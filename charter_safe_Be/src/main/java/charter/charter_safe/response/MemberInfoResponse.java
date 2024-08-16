package charter.charter_safe.response;

import charter.charter_safe.domain.Member;
import charter.charter_safe.dto.MemberDto;
import lombok.Data;

@Data
public class MemberInfoResponse {
    private String email;
    private String name;
    private String address;
    private String phone_number;

    public MemberInfoResponse(Member member) {
        this.email = member.getEmail();
        this.name = member.getName();
        this.address = member.getAddress();
        this.phone_number = member.getPhone_number();
    }
}
