package charter.charter_safe.Building.b_domain;

import charter.charter_safe.Community.com_domain.TimeStamp;
import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HostReview extends TimeStamp {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "h_no")
    private Long host_review_no;
    private String content;

    private Double rating;
    private Integer likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "o_no")
    private Officetel officetel;

    public void update(String content) {
        this.content = content;
    }
    public void increaseLikes() {
        this.likes++;
    }
}
