package charter.charter_safe.service;

import charter.charter_safe.authority.JwtTokenProvider;
import charter.charter_safe.authority.TokenInfo;
import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.MemberRole;
import charter.charter_safe.domain.Role;
import charter.charter_safe.dto.LoginDto;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.exception.InvalidInputException;
import charter.charter_safe.repository.MemberRepository;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final JwtTokenProvider jwtTokenProvider;

    @Override
    public String join(MemberDto memberDto) {


        memberRepository.findByEmail(memberDto.getEmail()).
                ifPresent(m -> {throw new InvalidInputException("email", "중복된 이메일 입니다.");
                });

        Member member = memberDto.toEntity(passwordEncoder.encode(memberDto.getPassword()));

        memberRepository.save(member);

        MemberRole memberRole = MemberRole.builder()
                .role(Role.MEMBER)
                .member(member)
                .build();
        memberRepository.save(member);

        return "가입이 완료되었습니다!";
    }

    public TokenInfo login(LoginDto loginDto) {

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(loginDto.getEmail(), loginDto.getPassword());

        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
        return jwtTokenProvider.createToken(authentication);
    }
}
