package charter.charter_safe.Officetel.o_dto;

import charter.charter_safe.Officetel.o_domain.HostReview;
import charter.charter_safe.Member.domain.Member;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {

    @NotBlank(message = "내용을 입력해주세요")
    private String content;
    private Double rating;
    private Integer likes;
    private Member member;

    @Builder
    public ReviewDto(HostReview hostReview) {
        this.content = hostReview.getContent();
        this.rating = hostReview.getRating();
        this.likes = hostReview.getLikes();
    }
}
