package charter.charter_safe.Building.b_controller;

import charter.charter_safe.Building.b_dto.ReviewDto;
import charter.charter_safe.Building.b_service.ReviewService;
import charter.charter_safe.Community.com_dto.CommentDto;
import charter.charter_safe.Community.com_service.CommentService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/building")
public class ReviewController {
    private final ReviewService reviewService;

    @PostMapping("/{building_number}/review")
    @Transactional
    public ApiResponse writeReview(@PathVariable Long building_number,
                                   @RequestBody @Valid ReviewDto reviewDto, Authentication authentication) {

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(reviewService.writeReview(reviewDto, building_number, userDetails.getUsername()));
    }

    @GetMapping("/{building_number}/review/list")
    @Transactional
    public List<ReviewDto> findAll(@PathVariable Long building_number) {
        return reviewService.findAll(building_number);
    }

    @PatchMapping("/{building_number}/review/{host_review_no}/update")
    @Transactional
    public ApiResponse updateReview(@PathVariable Long building_number,
                                    @PathVariable Long host_review_no,
                                    @RequestBody @Valid ReviewDto reviewDto) {
        return ApiResponse.ok(reviewService.updateReview(reviewDto, host_review_no));
    }

    @DeleteMapping("/{building_number}/review/{host_review_no}")
    @Transactional
    public ApiResponse deleteReview(@PathVariable Long building_number, @PathVariable Long host_review_no) {
        return ApiResponse.ok(reviewService.deleteReview(host_review_no));
    }
}
