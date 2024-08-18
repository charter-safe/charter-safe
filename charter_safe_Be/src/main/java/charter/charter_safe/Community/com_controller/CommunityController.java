package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.authority.CustomUser;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    private final CommunityService communityService;

    @PostMapping("/write")
    @Transactional
    public ApiResponse<?> write(@RequestBody @Valid CommunityWriteRequestDto communityWriteRequestDto) {

        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        return ApiResponse.ok(communityService.saveCom(communityWriteRequestDto, email));
    }
}

