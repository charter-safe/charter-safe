package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    private final CommunityService communityService;

//    @PostMapping("/write")
//    @Transactional
//    public ApiResponse<?> write(@RequestBody @Valid CommunityWriteRequestDto dto) {
//         return ApiResponse.ok(communityService.save(dto));
//    }


    @PostMapping("/write")
    @Transactional
    public ApiResponse<?> write(@RequestBody @Valid CommunityWriteRequestDto dto, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(communityService.save(dto, userDetails.getUsername()));
    }

    @GetMapping("/find")
    @Transactional
    public List<CommunityWriteRequestDto> findAll() {
        return communityService.findAll();
    }

    @PatchMapping("/write/{post_id}")
    public ApiResponse<?> update(@PathVariable Long post_id, @RequestBody @Valid CommunityWriteRequestDto dto) {
        return ApiResponse.ok(communityService.update(post_id, dto));
    }
}

