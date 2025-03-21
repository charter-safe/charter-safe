package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.HostReview;
import charter.charter_safe.Officetel.o_dto.ReviewDto;
import charter.charter_safe.Officetel.o_repo.OfficetelRepository;
import charter.charter_safe.Officetel.o_repo.ReviewRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{

    private final MemberRepository memberRepository;
    private final ReviewRepository reviewRepository;
    private final OfficetelRepository officetelRepository;

    @Override
    @Transactional
    public Long writeReview(ReviewDto reviewDto, Long building_number, String email) {
        Member member = memberRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("이메일이 존재하지 않습니다."));
        Officetel officetel = officetelRepository.findById(building_number).orElseThrow(()
                -> new IllegalArgumentException("건물이 존재하지 않습니다."));

        HostReview review = HostReview.builder()
                .content(reviewDto.getContent())
                .rating(4.4)
                .likes(8)
                .officetel(officetel)
                .build();
        reviewRepository.save(review);
        return review.getHost_review_no();
    }

    @Override
    @Transactional
    public List<ReviewDto> findAll(Long host_review_no) {
        List<HostReview> reviews = reviewRepository.findAll();
        return reviews.stream().map(ReviewDto::new).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public Long updateReview(ReviewDto reviewDto, Long host_review_no) {
        HostReview hostReview = reviewRepository.findById(host_review_no).orElseThrow(()
                -> new IllegalArgumentException("존재하지 않는 댓글입니다."));
        hostReview.update(reviewDto.getContent());
        return host_review_no;
    }

    @Override
    @Transactional
    public Long deleteReview(Long host_review_no) {
        reviewRepository.deleteById(host_review_no);
        return host_review_no;
    }

//    @Override
//    @Transactional
//    public void calculateRating(ReviewDto reviewDto, Long host_review_no) {
//
//        List<HostReview> reviews = reviewRepository.findAll();
//
//        double totalRating = (double) reviews.stream().mapToDouble(HostReview::getRating).sum();
//        double avgRating = totalRating/reviews.size();
//
//    }
}
