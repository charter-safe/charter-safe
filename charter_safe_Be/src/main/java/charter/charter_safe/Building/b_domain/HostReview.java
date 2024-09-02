package charter.charter_safe.Building.b_domain;

import charter.charter_safe.Community.com_domain.TimeStamp;
import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

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
    @JoinColumn(name = "b_no")
    private Building building;

    public void update(String content) {
        this.content = content;
    }
    public void increaseLikes() {
        this.likes++;
    }
}
