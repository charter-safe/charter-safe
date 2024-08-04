package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.dto.MemberResponse;
import charter.charter_safe.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {

    private final MemberRepository memberRepository;

    @Transactional
    public Long join(Member member) {
        validateDuplicateMember(member);
        memberRepository.save(member);
        return member.getId();
    }

    private void validateDuplicateMember(Member member) {
        List<Member> findMembers = memberRepository.findByName(member.getName());
        if(!findMembers.isEmpty()) {
            throw new IllegalStateException("이미 존재하는 회원입니다.");
        }
    }

    public List<Member> findMembers() {return memberRepository.findAll();}

    public Member findOne(Long id) {return memberRepository.findOne(id);}

    @Transactional
    public void update(Long id, String name) {
        Member member = memberRepository.findOne(id);
        member.updateMemberInfo(name);
    }
}
