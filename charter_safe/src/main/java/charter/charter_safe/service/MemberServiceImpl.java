package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.exception.InvalidInputException;
import charter.charter_safe.repository.MemberRepository;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;

    @Override
    public String join(MemberDto memberDto) {


        memberRepository.findByEmail(memberDto.getEmail()).
                ifPresent(m -> {throw new InvalidInputException("email", "중복된 이메일 입니다.");
                });

        Member member = memberDto.toEntity();

        memberRepository.save(member);

        return "가입이 완료되었습니다!";
    }
}
