package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommentDto;
import charter.charter_safe.Community.com_repo.CommentRepository;
import charter.charter_safe.Community.com_repo.CommunityRepository;
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
public class CommentServiceImpl implements CommentService{

    private final CommentRepository commentRepository;
    private final CommunityRepository communityRepository;
    private final MemberRepository memberRepository;

    @Override
    @Transactional
    public Long writeComment(CommentDto commentDto, Long post_id, String email) {
        Member member = memberRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("이메일이 존재하지 않습니다."));
        Community community = communityRepository.findById(post_id).orElseThrow(()
                -> new IllegalArgumentException("게시물을 찾을 수 없습니다."));
        Comment result = Comment.builder()
                .comment_content(commentDto.getComment_content())
                .likes(0)
                .community(community)
                .member(member)
                .build();
        commentRepository.save(result);
        return result.getComment_id();
    }

    @Override
    @Transactional
    public List<CommentDto> findAll(Long post_id) {
        List<Comment> comments = commentRepository.findAll();
        return comments.stream().map(CommentDto::new).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public Long updateComment(CommentDto commentDto, Long comment_id) {
        Comment comment = commentRepository.findById(comment_id).orElseThrow(()
                -> new IllegalArgumentException("존재하지 않는 댓글입니다."));
        comment.update(commentDto.getComment_content());
        return comment_id;
    }

    @Override
    @Transactional
    public Long deleteComment(Long comment_id) {
        commentRepository.deleteById(comment_id);
        return comment_id;
    }
}
