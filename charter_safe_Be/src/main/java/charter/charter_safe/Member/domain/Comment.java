package charter.charter_safe.Member.domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
public class Comment {

    @Id @GeneratedValue
    @Column(name = "c_no")
    private Long comment_number;

    private String comment_content;

    @CreatedDate
    private LocalDateTime create_comment_date;

    @LastModifiedDate
    private LocalDateTime update_comment_date;

    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "comment")
    private List<Reply> replies;
}
