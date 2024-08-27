package charter.charter_safe.Community.com_dto;

import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_domain.Community;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto {

    private Long comment_id;
    @NotBlank(message = "댓글을 입력해주세요.")
    private String content;
    private Integer likes;

    @Builder
    public CommentDto(Comment comment) {
        this.comment_id = comment.getComment_id();
        this.content = comment.getContent();
        this.likes = comment.getLikes();
    }

}
