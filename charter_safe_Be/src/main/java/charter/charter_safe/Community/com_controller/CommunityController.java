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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final CommunityService communityService;

    @PostMapping(value = "/write")
    @Transactional
    public ApiResponse<?> write(@RequestPart("dto") @Valid CommunityDto dto,
                                @RequestPart("file") MultipartFile file,
                                @RequestPart("files") List<MultipartFile> files,
                                Authentication authentication) throws IOException{

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Long postId = null;
        for (MultipartFile multipartFile : files) {
            postId = communityService.writeCommunity(dto, multipartFile, userDetails.getUsername());
        }
        return ApiResponse.ok(postId);
    }

//    @PostMapping(value = "/write/upload")
//    @Transactional
//    public ApiResponse<?> uploadFile(@RequestPart("file")MultipartFile file, Authentication authentication) throws IOException {
//
////        for (MultipartFile multipartFile : files) {
////            communityService.saveImage(multipartFile);
////        }
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        return ApiResponse.ok(communityService.saveImage(file));
//    }

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

