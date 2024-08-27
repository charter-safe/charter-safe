package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_dto.ImageDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final Logger logger = LoggerFactory.getLogger(CommunityController.class);
    private final CommunityService communityService;

    @PostMapping("/write")
    @Transactional
    public ApiResponse<?> write(@RequestPart @Valid CommunityDto dto,
                                @RequestPart ImageDto imageDto, Authentication authentication) {

        logger.info("imageDto is {}", imageDto);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return ApiResponse.ok(communityService.writeCommunity(dto, imageDto, userDetails.getUsername()));
    }

    @GetMapping("/list")
    @Transactional
    public List<CommunityDto> findAll() {
        return communityService.findAll();
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

