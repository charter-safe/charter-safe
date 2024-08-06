package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {

    private final MemberRepository memberRepository;

    @Transactional
    public Member join(@RequestBody Member member) {
        validateDuplicateMember(member);
        return memberRepository.save(member);
    }

    private void validateDuplicateMember(Member member) {
        Member findMembers = memberRepository.findByEmail(member.getEmail());
        if(findMembers != null) {
            throw new IllegalStateException("이미 존재하는 회원입니다.");
        }
    }
    public List<Member> findMembers() {return memberRepository.findAll();}

}
