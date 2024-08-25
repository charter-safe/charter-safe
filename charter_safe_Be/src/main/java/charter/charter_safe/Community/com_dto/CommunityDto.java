package charter.charter_safe.Community.com_dto;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Member.domain.Member;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CommunityDto {

    private Long post_id;
    @NotBlank(message = "제목을 입력해주세요")
    private String title;
    @NotBlank(message = "내용을 입력해주세요")
    private String content;
    private String author;
    private Member member;
    private Integer views;
    private Integer likes;

    public CommunityDto(Community community) {
        this.post_id = community.getPost_id();
        this.title = community.getTitle();
        this.content = community.getContent();
        this.author = community.getAuthor();
        this.views = community.getViews();
        this.likes = community.getLikes();
    }
}
