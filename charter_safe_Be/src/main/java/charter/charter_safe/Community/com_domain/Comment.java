package charter.charter_safe.Community.com_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class Comment extends TimeStamp{

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_no")
    private Long comment_id;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String comment_content;
    private Integer likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "comment")
    private List<Reply> replies;

    public void update(String comment_content) {
        this.comment_content = comment_content;
    }
}
