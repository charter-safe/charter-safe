package charter.charter_safe.Community.com_dto;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Member.domain.Member;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CommunityWriteRequestDto {

    @NotBlank(message = "제목을 입력해주세요")
    String title;
    @NotBlank(message = "내용을 입력해주세요")
    String content;
    Member member;

    public Community toEntity() {
        return Community.builder()
                .title(this.getTitle())
                .content(this.getContent())
                .member(this.getMember())
                .build();
    }
}
