package charter.charter_safe.domain;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Entity
@Data // Getter, Setter
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "m_id")
    private Long id;

    @Column(nullable = false, unique = true, length = 100) // 동일한 값x
    private String email;

    @Column(nullable = false, length = 100)
    private String password;

    @Column(nullable = false, length = 20)
    private String name;

    @Column(nullable = false, length = 20)
    private String phone_number;

    @Column(nullable = false, length = 30)
    private String address;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private LocalDate birthday;

    @Column(name = "regdate")
    @CreatedDate
    private LocalDateTime create_day;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "member")
    private List<MemberRole> memberRoles;


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

    @Builder
    private Member(Long id, String email, String password, String name, String phone_number, String address, LocalDate birthday, LocalDateTime create_day, List<MemberRole> memberRoles) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone_number = phone_number;
        this.address = address;
        this.birthday = birthday;
        this.create_day = create_day;
        this.memberRoles = null;
    }
}
