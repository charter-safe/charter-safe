package charter.charter_safe.Building.b_repo;

import charter.charter_safe.Building.b_domain.Building;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildingRepository extends JpaRepository<Building, Long> {
}
