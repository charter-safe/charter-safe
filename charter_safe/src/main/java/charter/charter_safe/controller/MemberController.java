package charter.charter_safe.controller;

import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.service.MemberService;
import lombok.RequiredArgsConstructor;
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
    public Long signup(@RequestBody MemberDto memberDto) {
        return memberService.join(memberDto);
    }
}
