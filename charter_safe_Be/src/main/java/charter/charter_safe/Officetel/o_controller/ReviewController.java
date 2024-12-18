package charter.charter_safe.Officetel.o_controller;

import charter.charter_safe.Officetel.o_dto.ReviewDto;
import charter.charter_safe.Officetel.o_service.ReviewService;
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
@RequestMapping("/officetel")
public class ReviewController {
    private final ReviewService reviewService;

    @PostMapping("/{o_number}/review")
    @Transactional
    public ApiResponse writeReview(@PathVariable Long o_number,
                                   @RequestBody @Valid ReviewDto reviewDto, Authentication authentication) {

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(reviewService.writeReview(reviewDto, o_number, userDetails.getUsername()));
    }

    @GetMapping("/{o_number}/review/list")
    @Transactional
    public List<ReviewDto> findAll(@PathVariable Long o_number) {
        return reviewService.findAll(o_number);
    }

    @PatchMapping("/{o_number}/review/{host_review_no}/update")
    @Transactional
    public ApiResponse updateReview(@PathVariable Long o_number,
                                    @PathVariable Long host_review_no,
                                    @RequestBody @Valid ReviewDto reviewDto) {
        return ApiResponse.ok(reviewService.updateReview(reviewDto, host_review_no));
    }

    @DeleteMapping("/{o_number}/review/{host_review_no}")
    @Transactional
    public ApiResponse deleteReview(@PathVariable Long o_number, @PathVariable Long host_review_no) {
        return ApiResponse.ok(reviewService.deleteReview(host_review_no));
    }
}
