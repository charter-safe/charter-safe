package charter.charter_safe.Community.com_repo;

import charter.charter_safe.Community.com_domain.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
}
