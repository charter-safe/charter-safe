package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    private final CommunityService communityService;
//
//    @PostMapping("/write")
//    public Long save(@RequestBody final CommunityWriteRequestDto dto) {
//        return communityService.save(dto);
//    }

    @PostMapping("/write")
    @Transactional
    public ApiResponse<?> write(@RequestBody @Valid CommunityWriteRequestDto dto) {
         return ApiResponse.ok(communityService.save(dto));
    }
}

