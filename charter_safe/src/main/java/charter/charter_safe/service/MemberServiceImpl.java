package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.repository.MemberRepository;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;

    @Override
    public Long join(MemberDto memberDto) {
        Member member = Member.builder()
                .email(memberDto.getEmail())
                .password(memberDto.getPassword())
                .name(memberDto.getName())
                .phone_number(memberDto.getPhone_number())
                .address(memberDto.getAddress())
                .birthday(memberDto.getBirthday())
                .role(Role.ADMIN)
                .build();

        return memberRepository.save(member).getId();
    }
}
