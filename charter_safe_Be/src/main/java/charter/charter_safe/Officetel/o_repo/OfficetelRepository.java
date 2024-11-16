package charter.charter_safe.Officetel.o_repo;

import charter.charter_safe.Officetel.o_domain.Officetel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OfficetelRepository extends JpaRepository<Officetel, Long> {
}
