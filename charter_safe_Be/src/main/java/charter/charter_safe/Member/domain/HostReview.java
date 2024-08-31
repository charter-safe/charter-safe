package charter.charter_safe.Member.domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

@Entity
@Getter
public class HostReview {

    @Id @GeneratedValue
    @Column(name = "h_no")
    private Long review_number;

    private String content;

    @CreatedDate
    private LocalDateTime create_review_date;

    @LastModifiedDate
    private LocalDateTime update_review_date;

    private Double rating;

    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "b_no")
    private Building building;

}
