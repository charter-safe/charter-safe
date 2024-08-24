package charter.charter_safe.Member.controller;

import charter.charter_safe.Member.authority.CustomUser;
import charter.charter_safe.Member.dto.LoginDto;
import charter.charter_safe.Member.dto.MemberDto;
import charter.charter_safe.Member.response.ApiResponse;
import charter.charter_safe.Member.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@CrossOrigin
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/signup")
    @Transactional // 일관성 유지
    public ApiResponse<?> join(@RequestBody @Valid MemberDto memberDto) {
        return ApiResponse.ok(memberService.join(memberDto));
    }

    @PostMapping("/login")
    @Transactional
    public ApiResponse<?> login(@RequestBody @Valid LoginDto loginDto) {
        return ApiResponse.ok(memberService.login(loginDto));
    }

    @GetMapping("")
    public ApiResponse<?> myInfo() {
        Long id = ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
        return ApiResponse.ok(memberService.memberInfo(id));
    }

    @GetMapping("/checkPwd")
    public String checkPwdView() {
        return "";
    }
}
