package charter.charter_safe.Member.repository;

import charter.charter_safe.Member.domain.SocialType;
import charter.charter_safe.Member.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByEmail(String email);
    Optional<Member> findById(Long id);
    List<Member> findAll();
    Optional<Member> findBySocialTypeAndSocialId(SocialType socialType, String socialId);
}


