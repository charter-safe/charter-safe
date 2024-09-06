package charter.charter_safe.Member.repository;

import charter.charter_safe.Member.domain.MemberRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRoleRepository extends JpaRepository<MemberRole, Long> {

}
