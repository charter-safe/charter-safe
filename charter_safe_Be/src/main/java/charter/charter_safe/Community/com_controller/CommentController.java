package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommentDto;
import charter.charter_safe.Community.com_service.CommentService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

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
}