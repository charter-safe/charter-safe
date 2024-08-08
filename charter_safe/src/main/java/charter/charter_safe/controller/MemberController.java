package charter.charter_safe.controller;

import charter.charter_safe.dto.LoginDto;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.response.ApiResponse;
import charter.charter_safe.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/member")
@RequiredArgsConstructor
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
}
