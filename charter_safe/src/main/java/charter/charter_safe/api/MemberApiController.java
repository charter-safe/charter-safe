package charter.charter_safe.api;

import charter.charter_safe.domain.Member;
import charter.charter_safe.service.MemberService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.transform.Result;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
public class MemberApiController {

    private final MemberService memberService;

    @GetMapping("/api/members")
    public Result memberV1() {
        List<Member> findMembers = memberService.findMembers();
        List<MemberDto> collect = findMembers.stream()
                .map(m -> new MemberDto(m.getName()))
                .collect(Collectors.toList());

        return new Result(collect);
    }

    @Data
    @AllArgsConstructor
    public class Result<T> {
        private T data;
    }

    @Data
    @AllArgsConstructor
    public class MemberDto {
        private String name;
    }

    @PostMapping("/api/members")
    public CreateMemberResponse saveMember(@Valid CreateMemberRequest request) {
        Member member = new Member();
        member.updateMemberInfo(request.getName());

        String id = memberService.join(member);
        return new CreateMemberResponse(id);
    }

    @Data
    static class CreateMemberRequest {
        @NotEmpty
        private String name;
    }

    @Data
    static class CreateMemberResponse {
        private String id;

        public CreateMemberResponse(String id) {
            this.id = id;
        }
    }
}
