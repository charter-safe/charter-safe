package charter.charter_safe.Community.com_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Getter
public class Reply extends TimeStamp{

    @Id @GeneratedValue
    @Column(name = "r_no")
    private Long reply_number;

    private String content;

    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "c_no")
    private Comment comment;

}
