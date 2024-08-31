package charter.charter_safe.Community.com_repo;

import charter.charter_safe.Community.com_domain.Community;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CommunityRepository extends JpaRepository<Community, Long> {

}
