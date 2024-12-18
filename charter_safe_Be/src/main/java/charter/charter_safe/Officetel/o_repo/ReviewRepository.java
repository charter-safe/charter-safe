package charter.charter_safe.Officetel.o_repo;

import charter.charter_safe.Officetel.o_domain.HostReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<HostReview, Long> {
}
