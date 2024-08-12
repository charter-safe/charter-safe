package charter.charter_safe.oauth2.handler;

import charter.charter_safe.authority.JwtTokenProvider;
import charter.charter_safe.authority.TokenInfo;
import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import charter.charter_safe.oauth2.CustomOAuth2User;
import charter.charter_safe.repository.MemberRepository;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Slf4j
@Component
@RequiredArgsConstructor
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final JwtTokenProvider jwtTokenProvider;
    private final MemberRepository memberRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        log.info("OAuth2 Login 성공");
        try {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal();

            if(oAuth2User.getRole() == Role.GUEST) {
                TokenInfo tokenInfo = jwtTokenProvider.createToken(authentication);

                String jwt = tokenInfo.getAccessToken();
                response.sendRedirect("oauth2/signup");

                Member findMember = memberRepository.findByEmail(oAuth2User.getEmail())
                        .orElseThrow(() -> new IllegalArgumentException("이메일에 해당하는 유저가 없습니다."));
            }
        } catch (Exception e){
            throw e;
        }
    }
}
