package charter.charter_safe.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
public class Member {

    @Id @GeneratedValue
    @Column(name = "m_id")
    private String Id;

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
}
