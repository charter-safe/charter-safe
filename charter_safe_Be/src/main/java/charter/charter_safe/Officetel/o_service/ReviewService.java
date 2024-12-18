package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_dto.ReviewDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ReviewService {
    Long writeReview(ReviewDto reviewDto, Long building_number, String email);

    List<ReviewDto> findAll(Long host_review_no);

    Long updateReview(ReviewDto reviewDto, Long host_review_no);

    Long deleteReview(Long host_review_no);
}
