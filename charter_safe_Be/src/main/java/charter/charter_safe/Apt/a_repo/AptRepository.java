package charter.charter_safe.Apt.a_repo;

import charter.charter_safe.Apt.a_domain.Apt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AptRepository extends JpaRepository<Apt, Long> {
}
