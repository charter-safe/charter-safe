package charter.charter_safe.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
public class Member {

    @Id @GeneratedValue
    @Column(name = "m_id")
    private Long Id;

    private String member_id;

    private String password;

    private String name;

    private String email;

    private String phone_number;

    private String Address;

    private LocalDateTime birthday;

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

    @Builder
    public void updateMemberInfo(String password, String name, String email, String phone_number) {
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone_number = phone_number;
    }

    @Builder
    public void createMemberInfo(String member_id, String password, String name, String email, String phone_number,
                                 LocalDateTime birthday, LocalDateTime create_day)
    {
        this.member_id = member_id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone_number = phone_number;
        this.birthday = birthday;
        this.create_day = create_day;
    }

    @Builder
    public void updateMemberInfo(String name) {
        this.name = name;
    }
}
