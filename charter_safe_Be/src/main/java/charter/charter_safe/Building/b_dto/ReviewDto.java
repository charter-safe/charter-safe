package charter.charter_safe.Building.b_dto;

import charter.charter_safe.Building.b_domain.HostReview;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {

    private Long host_review_no;
    @NotBlank(message = "내용을 입력해주세요")
    private String content;
    private Double rating;
    private Integer likes;

    @Builder
    public ReviewDto(HostReview hostReview) {
        this.content = hostReview.getContent();
        this.rating = hostReview.getRating();
        this.likes = hostReview.getLikes();
    }
}
