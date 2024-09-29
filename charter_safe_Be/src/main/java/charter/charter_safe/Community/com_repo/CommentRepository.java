package charter.charter_safe.Community.com_repo;

import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_domain.Community;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findByCommunity(Community community);
}
