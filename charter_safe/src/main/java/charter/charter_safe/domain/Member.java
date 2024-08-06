package charter.charter_safe.domain;

import charter.charter_safe.dto.MemberDto;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import org.springframework.cglib.core.Local;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Entity
@Getter @Setter
@NoArgsConstructor
public class Member {

    @Id @GeneratedValue
    @Column(name = "m_id")
    private Long Id;

    @Column(unique = true) // 동일한 값x
    private String email;

    private String password;

    private String name;

    private String phone_number;

    private String Address;

    private Date birthday;

    @Column(name = "regdate")
    private LocalDateTime create_day;

    @OneToMany(mappedBy = "member")
    private List<Community> communities;

    @OneToMany(mappedBy = "member")
    private List<Comment> comments;

    @OneToMany(mappedBy = "member")
    private List<Reply> replies;

    @OneToMany(mappedBy = "member")
    private List<Building> buildings;

    @OneToMany(mappedBy = "member")
    private List<HostReview> hostReviews;

   public static Member createMember(MemberDto memberDto, PasswordEncoder passwordEncoder) {
       Member member = new Member();
       member.setEmail(memberDto.getEmail());
       String password = passwordEncoder.encode(member.getPassword());
       member.setPassword(password);
       member.setName(memberDto.getName());
       member.setPhone_number(memberDto.getPhone_number());
       member.setAddress(memberDto.getAddress());
       member.setBirthday(memberDto.getBirthday());
       member.setCreate_day(memberDto.getCreate_day());

       return member;
   }
}
