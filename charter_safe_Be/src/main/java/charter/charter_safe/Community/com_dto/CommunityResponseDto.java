package charter.charter_safe.Community.com_dto;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Member.domain.Member;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityResponseDto {

    private Long post_id;
    @NotBlank(message = "제목을 입력해주세요")
    private String title;
    @NotBlank(message = "내용을 입력해주세요")
    private String content;
    private String author;
    private Long views;
    private Long likes;
    private Member member;

    public Community toEntity() {
        return Community.builder()
                .post_id(this.getPost_id())
                .title(this.getTitle())
                .content(this.getContent())
                .member(this.getMember())
                .views(this.getViews())
                .likes(this.getLikes())
                .build();
    }
}
