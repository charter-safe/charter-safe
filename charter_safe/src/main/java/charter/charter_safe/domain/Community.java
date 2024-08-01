package charter.charter_safe.domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.awt.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
public class Community {

    @Id @GeneratedValue
    @Column(name = "p_no")
    private Long post_number;

    private String title;

    private String content;

    @CreatedDate
    private LocalDateTime post_create_date;

    @LastModifiedDate
    private LocalDateTime post_update_date;

    private Long views;

    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "community")
    private List<Comment> comments;

    @OneToMany(mappedBy = "community")
    private List<Picture> pictures;

}
