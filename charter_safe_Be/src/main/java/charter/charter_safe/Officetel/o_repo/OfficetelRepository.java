package charter.charter_safe.Officetel.o_repo;

import charter.charter_safe.Apt.a_domain.Apt;
import charter.charter_safe.Officetel.o_domain.Officetel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OfficetelRepository extends JpaRepository<Officetel, Long> {
    List<Officetel> findOfficetelByUmdNm(String umdNm);
    List<Officetel> findOfficetelBySggNm(String sggNm);
}
