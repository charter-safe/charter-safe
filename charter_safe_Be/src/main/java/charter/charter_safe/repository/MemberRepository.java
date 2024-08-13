package charter.charter_safe.repository;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.SocialType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByEmail(String email);
    Optional<Member> findById(Long id);
    List<Member> findAll();
    Optional<Member> findBySocialTypeAndSocialId(SocialType socialType, String socialId);
}


