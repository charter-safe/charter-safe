package charter.charter_safe.domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Getter
public class Reply {

    @Id @GeneratedValue
    @Column(name = "r_no")
    private Long reply_number;

    private String content;

    @CreatedDate
    private String create_reply_date;

    @LastModifiedDate
    private String update_reply_date;

    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "c_no")
    private Comment comment;

}
