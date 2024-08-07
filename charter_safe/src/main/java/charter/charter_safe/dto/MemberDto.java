package charter.charter_safe.dto;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

    private Long id;

    @NotBlank(message = "이메일을 입력해주세요")
    @Email(message = "올바른 이메일 주소를 입력해주세요.")
    private String email;

    @NotBlank(message = "비밀번호를 입력해주세요")
    private String password;

    @NotBlank(message = "이름을 입력해주세요")
    private String name;

    @NotBlank(message = "핸드폰 번호를 입력해주세요")
    private String phone_number;

    @NotBlank(message = "주소를 입력해주세요")
    private String address;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotBlank(message = "날짜를 입력해주세요")
    private Date birthday;

    @CreatedDate
    private LocalDate create_day;

    private Role role;


}
