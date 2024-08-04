package charter.charter_safe.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
public class MemberRequest {

    private String id;
    private String password;
    private String name;
    private String address;
    private String phone_number;
    private String birthday;
    private LocalDateTime create_day;
}
