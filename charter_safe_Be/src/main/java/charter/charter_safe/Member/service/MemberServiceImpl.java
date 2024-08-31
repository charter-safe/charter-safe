package charter.charter_safe.Member.service;

import charter.charter_safe.Member.authority.JwtTokenProvider;
import charter.charter_safe.Member.authority.TokenInfo;
import charter.charter_safe.Member.domain.MemberRole;
import charter.charter_safe.Member.exception.InvalidInputException;
import charter.charter_safe.Member.repository.MemberRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.domain.Role;
import charter.charter_safe.Member.dto.LoginDto;
import charter.charter_safe.Member.dto.MemberDto;
import charter.charter_safe.Member.repository.MemberRoleRepository;
import charter.charter_safe.Member.response.MemberInfoResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;
    private final MemberRoleRepository memberRoleRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final JwtTokenProvider jwtTokenProvider;

    @Override
    public String join(MemberDto memberDto) {

        memberRepository.findByEmail(memberDto.getEmail()).
                ifPresent(m -> {throw new InvalidInputException("email", "중복된 이메일 입니다.");
                });

        if(!memberDto.getPassword().equals(memberDto.getPasswordcheck())) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }

        else {
            Member member = memberDto.toEntity();
            member.setPassword(passwordEncoder.encode(memberDto.getPassword()));
            memberRepository.save(member);

            MemberRole memberRole = MemberRole.builder()
                    .role(Role.MEMBER)
                    .member(member)
                    .build();
            memberRoleRepository.save(memberRole);
        }
        return "가입이 완료되었습니다!";
    }

    public TokenInfo login(LoginDto loginDto) {

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(loginDto.getEmail(), loginDto.getPassword());

        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
        return jwtTokenProvider.createToken(authentication);
    }

    public MemberInfoResponse memberInfo(Long id) {
        Member findMember = memberRepository.findById(id)
                .orElseThrow(() -> new InvalidInputException("token", "회원 정보가 존재하지 않습니다."));
        return new MemberInfoResponse(findMember);
    }
}
