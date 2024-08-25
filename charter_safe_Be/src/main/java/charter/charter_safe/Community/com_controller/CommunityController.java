package charter.charter_safe.Community.com_controller;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_service.CommunityService;
import charter.charter_safe.Member.response.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
        return ApiResponse.ok(communityService.save(dto, userDetails.getUsername()));
    }

    @GetMapping("/find")
    @Transactional
    public List<CommunityDto> findAll() {
        return communityService.findAll();
    }

//    @GetMapping("/find/{post_id}")
//    public String communityDetail(@PathVariable Long post_id, CommunityDto dto, Model model) {
//        Community result = communityService.communityDetail(post_id, dto);
//        model.addAttribute("dto", result);
//        model.addAttribute("post_id", post_id);
//
//        return "community/detail";
//    }

    @PatchMapping("/write/{post_id}")
    @Transactional
    public ApiResponse<?> update(@PathVariable Long post_id, @RequestBody @Valid CommunityDto dto) {
        return ApiResponse.ok(communityService.update(post_id, dto));
    }

//    @GetMapping("/remove/{post_id}/")
//    public String communityRemove(@PathVariable Long post_id, Authentication authentication) {
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        CommunityDto result = communityService.remove();
//    }

    @DeleteMapping("/remove/{post_id}")
    @Transactional
    public Long remove(@PathVariable Long post_id) {
        return communityService.remove(post_id);
    }
}

