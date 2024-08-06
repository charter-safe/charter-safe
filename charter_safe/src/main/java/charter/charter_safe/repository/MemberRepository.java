package charter.charter_safe.repository;

import charter.charter_safe.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MemberRepository extends JpaRepository<Member, Long> {
    Member findByEmail(String email);
    List<Member> findAll();
}
