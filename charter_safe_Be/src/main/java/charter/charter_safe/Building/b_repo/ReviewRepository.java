package charter.charter_safe.Building.b_repo;

import charter.charter_safe.Building.b_domain.HostReview;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<HostReview, Long> {
}
