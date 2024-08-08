package charter.charter_safe.dto;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.MemberRole;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

    private Long id;

    @NotBlank(message = "이메일을 입력해주세요")
    @Email(message = "올바른 이메일 주소를 입력해주세요.")
    private String email;

    @NotBlank(message = "비밀번호를 입력해주세요")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@$%^&*])[a-zA-Z0-9!@$%^&*]{8,20}",
        message = "영문, 숫자, 특수문자를 포함한 8~20 자리로 입력해주세요")
    private String password;

    @NotBlank(message = "이름을 입력해주세요")
    @Pattern(regexp = "^[ㄱ-힣]{1,10}",
        message = "올바른 이름을 입력해주세요")
    private String name;

    @NotBlank(message = "주소를 입력해주세요")
    private String address;

    @NotBlank(message = "핸드폰 번호를 입력해주세요")
    private String phone_number;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Past(message = "날짜를 입력해주세요")
    private LocalDate birthday;

    @CreatedDate
    private LocalDate create_day;

    private MemberRole memberRole;

    public Member toEntity(String encode) {
        return Member.builder()
                .email(this.getEmail())
                .password(this.getPassword())
                .name(this.getName())
                .address(this.getAddress())
                .phone_number(this.getPhone_number())
                .birthday(this.getBirthday())
                .build();

    }

}
