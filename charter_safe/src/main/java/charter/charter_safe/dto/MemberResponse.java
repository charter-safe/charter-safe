package charter.charter_safe.dto;

import charter.charter_safe.domain.Member;

import java.time.LocalDateTime;

public class MemberResponse {

    private String member_id;
    private String password;
    private String name;
    private String address;
    private String phone_number;
    private LocalDateTime birthday;
    private LocalDateTime create_day;

    public MemberResponse(Member member) {
        this.member_id = member.getMember_id();
        this.password = member.getPassword();
        this.name = member.getName();
        this.address = member.getAddress();
        this.phone_number = member.getPhone_number();
        this.birthday = member.getBirthday();
        this.create_day = member.getCreate_day();
    }
}
