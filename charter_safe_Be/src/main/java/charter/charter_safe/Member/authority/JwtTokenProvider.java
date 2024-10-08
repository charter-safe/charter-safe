package charter.charter_safe.Member.authority;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Component
@PropertySource("classpath:application.yml")
public class JwtTokenProvider {

    private final String secretKey;
    private static final long EXPIRATION_TIME = 1000 * 60 * 60 * 24;

    public JwtTokenProvider(@Value("${jwt.secret}") String secretKey) {
        this.secretKey = secretKey;
    }

    public SecretKey getKey() {
        return Keys.hmacShaKeyFor(Decoders.BASE64.decode(secretKey));
    }

    public TokenInfo createToken(Authentication authentication) {
        String authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority).collect(Collectors.joining(","));
        Date now = new Date();
        Date accessExpiration = new Date(now.getTime() + EXPIRATION_TIME);

        String jwt = Jwts.builder()
                .subject(authentication.getName())
                .claim("auth", authorities)
                //.claim("email", ((CustomUser) authentication.getPrincipal()).getEmail())
                .claim("userId", ((CustomUser) authentication.getPrincipal()).getUserId())
                .issuedAt(now)
                .expiration(accessExpiration)
                .signWith(getKey(), Jwts.SIG.HS256)
                .compact();

        return new TokenInfo("Bearer", jwt);
    }

    public Authentication getAuthentication(String jwt) {
        Claims claims = getClaims(jwt);

        String auth = Optional.ofNullable(claims.get("auth", String.class))
                .orElseThrow(() -> new RuntimeException("잘못된 토큰입니다. auth 클레임이 누락되었습니다."));

        Long userId = Optional.ofNullable(claims.get("userId", Long.class))
                .orElseThrow(() -> new RuntimeException("잘못된 토큰입니다. userId 클레임이 누락되었습니다."));

        Collection<GrantedAuthority> authorities = Arrays.stream(auth.split(","))
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        UserDetails principal = new CustomUser(userId, claims.getSubject(), "", authorities);
        return new UsernamePasswordAuthenticationToken(principal, "", authorities);
    }

    public boolean validateToken(String token) {
        try {
            getClaims(token);
            return true;
        } catch (Exception e) {
            if(e instanceof SecurityException) {
                log.debug("[SecurityException] 잘못된 토큰");
                throw new JwtException("[SecurityException] 잘못된 토큰입니다.");
            } else if (e instanceof MalformedJwtException) {
                log.debug("[MalformedJwtException] 잘못된 토큰");
                throw new JwtException("[MalformedJwtException] 잘못된 토큰입니다.");
            } else if (e instanceof ExpiredJwtException) {
                log.debug("[ExpiredJwtException] 토큰 만료");
                throw new JwtException("[ExpiredJwtException] 토큰이 만료되었습니다.");
            } else if (e instanceof UnsupportedJwtException) {
                log.debug("[UnsupportedJwtException] 잘못된 형식의 토큰");
                throw new JwtException("[MalformedJwtException] 잘못된 형식의 토큰입니다.");
            } else if (e instanceof IllegalArgumentException) {
                log.debug("[IllegalArgumentException] 잘못된 토큰");
                throw new JwtException("[IllegalArgumentException]");
            } else {
                log.debug("[토큰 검증 오류]" + e.getClass());
                throw new JwtException("[토큰검증 오류] 미처리 토큰 오류");
            }
        }
    }

    private Claims getClaims(String jwt) {
        return Jwts.parser()
                .verifyWith(getKey())
                .build()
                .parseSignedClaims(jwt)
                .getPayload();
    }
}
