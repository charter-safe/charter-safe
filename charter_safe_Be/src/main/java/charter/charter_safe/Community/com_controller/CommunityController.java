package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    private final CommunityService communityService;

    @PostMapping("/write")
    @Transactional
    public ApiResponse<?> write(@RequestBody @Valid CommunityDto dto, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(communityService.writeCommunity(dto, userDetails.getUsername()));
    }

    @GetMapping("/list")
    @Transactional
    public List<CommunityDto> findAll() {
        return communityService.findAll();
    }

    @GetMapping("/{post_id}")
    @Transactional
    public ApiResponse<?> find(@PathVariable Long post_id) {
        return ApiResponse.ok(communityService.findCommunity(post_id));
    }

    @PatchMapping("/write/{post_id}")
    @Transactional
    public ApiResponse<?> update(@PathVariable Long post_id, @RequestBody @Valid CommunityDto dto) {
        return ApiResponse.ok(communityService.updateCommunity(post_id, dto));
    }

    @DeleteMapping("/remove/{post_id}")
    @Transactional
    public ApiResponse<?> remove(@PathVariable Long post_id) {
        return ApiResponse.ok(communityService.removeCommunity(post_id));
    }
}

