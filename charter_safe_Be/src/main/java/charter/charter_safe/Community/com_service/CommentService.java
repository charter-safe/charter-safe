package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_dto.CommentDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {
    Long writeComment(CommentDto commentDto, Long post_id, String email);
    List<CommentDto> findAll(Long post_id);
    Long updateComment(CommentDto commentDto, Long comment_id);
    Long deleteComment(Long comment_id);
}
