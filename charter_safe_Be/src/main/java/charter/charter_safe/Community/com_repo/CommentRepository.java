package charter.charter_safe.Community.com_repo;

import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_domain.Community;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findByCommunity(Community community);
}