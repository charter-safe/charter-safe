package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.repository.MemberRepository;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;

    @Override
    public String join(MemberDto memberDto) {

        Optional<Member> findMember = memberRepository.findByEmail(memberDto.getEmail());
        if(findMember.isPresent()) {
            return "중복된 이메일입니다.";
        }
        Member member = Member.builder()
                .email(memberDto.getEmail())
                .password(memberDto.getPassword())
                .name(memberDto.getName())
                .address(memberDto.getAddress())
                .phone_number(memberDto.getPhone_number())
                .birthday(memberDto.getBirthday())
                .role(Role.ADMIN)
                .build();

        memberRepository.save(member);
        return "가입이 완료되었습니다!";
    }
}
