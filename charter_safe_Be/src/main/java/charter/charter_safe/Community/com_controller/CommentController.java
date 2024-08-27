package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_domain.Comment;
import charter.charter_safe.Community.com_dto.CommentDto;
import charter.charter_safe.Community.com_dto.CommunityDto;
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
@RequestMapping("/community")
public class CommentController {

    private final CommentService commentService;

    @PostMapping("/{post_id}/comment")
    @Transactional
    public ApiResponse writeComment(@PathVariable Long post_id, @RequestBody @Valid CommentDto commentDto, Authentication authentication) {

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(commentService.writeComment(commentDto, post_id, userDetails.getUsername()));
    }

    @GetMapping("/{post_id}/comment/list")
    @Transactional
    public List<CommentDto> findAll(@PathVariable Long post_id) {
        return commentService.findAll(post_id);
    }

    @PatchMapping("/{post_id}/comment/{comment_id}/update")
    @Transactional
    public ApiResponse updateComment(@PathVariable Long post_id, @PathVariable Long comment_id, @RequestBody @Valid CommentDto commentDto) {
        return ApiResponse.ok(commentService.updateComment(commentDto, comment_id));
    }

    @DeleteMapping("/{post_id}/comment/{comment_id}")
    @Transactional
    public ApiResponse deleteComment(@PathVariable Long post_id, @PathVariable Long comment_id) {
        return ApiResponse.ok(commentService.deleteComment(comment_id));
    }
}
