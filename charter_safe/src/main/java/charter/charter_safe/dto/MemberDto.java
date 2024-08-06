package charter.charter_safe.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Getter @Setter
public class MemberDto {

    private String email;
    private String password;
    private String address;
    private String name;
    private String phone_number;
    private LocalDateTime create_day;
    private Date birthday;
}
