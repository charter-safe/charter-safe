package charter.charter_safe.Member.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data // Getter, Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED) // 기본 생성자
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "m_id")
    private Long id;

    @Column(nullable = false, unique = true, length = 100) // 동일한 값x
    private String email;

    @Column(nullable = true, length = 100)
    private String password;

    @Column(nullable = false, length = 20)
    private String name;

    @Column(nullable = true, length = 20)
    private String phone_number;

    @Column(nullable = true, length = 30)
    private String address;

    @Column(nullable = true)
    private String year;

//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(nullable = true)
    private String birthday;

    @Column(name = "regdate")
    @CreatedDate
    private LocalDateTime create_day;

    @Enumerated(EnumType.STRING)
    private SocialType socialType;

    private String socialId;

    private Role role;

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
    private Member(Long id, String email, String password, String name, String phone_number, String address, String year, String birthday, LocalDateTime create_day, List<MemberRole> memberRoles) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone_number = phone_number;
        this.address = address;
        this.year = year;
        this.birthday = birthday;
        this.create_day = create_day;
        this.memberRoles = null;
    }
}
