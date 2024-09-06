package charter.charter_safe.Building.b_repo;

import charter.charter_safe.Building.b_domain.HostReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<HostReview, Long> {
}
