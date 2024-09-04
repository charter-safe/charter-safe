package charter.charter_safe.Building.b_repo;

import charter.charter_safe.Building.b_domain.Officetel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildingRepository extends JpaRepository<Officetel, Long> {
}
