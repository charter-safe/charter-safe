package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_domain.Building;
import charter.charter_safe.Building.b_domain.HostReview;
import charter.charter_safe.Building.b_dto.ReviewDto;
import charter.charter_safe.Building.b_repo.BuildingRepository;
import charter.charter_safe.Building.b_repo.ReviewRepository;
import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommentDto;
import charter.charter_safe.Community.com_repo.CommentRepository;
import charter.charter_safe.Community.com_repo.CommunityRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.Host;
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
    private final BuildingRepository buildingRepository;

    @Override
    @Transactional
    public Long writeReview(ReviewDto reviewDto, Long building_number, String email) {
        Member member = memberRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("이메일이 존재하지 않습니다."));
        Building building = buildingRepository.findById(building_number).orElseThrow(()
                -> new IllegalArgumentException("건물이 존재하지 않습니다."));

        HostReview review = HostReview.builder()
                .content(reviewDto.getContent())
                .rating(0.0)
                .likes(0)
                .building(building)
                .member(member)
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

//    @Override
//    @Transactional
//    public Long updateComment(CommentDto commentDto, Long comment_id) {
//        Comment comment = commentRepository.findById(comment_id).orElseThrow(()
//                -> new IllegalArgumentException("존재하지 않는 댓글입니다."));
//        comment.update(commentDto.getComment_content());
//        return comment_id;
//    }
//
//    @Override
//    @Transactional
//    public Long deleteComment(Long comment_id) {
//        commentRepository.deleteById(comment_id);
//        return comment_id;
//    }
}