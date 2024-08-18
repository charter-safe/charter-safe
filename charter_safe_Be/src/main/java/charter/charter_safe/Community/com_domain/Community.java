package charter.charter_safe.Community.com_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Community extends TimeStamp{

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_no")
    private Long post_id;
    @Column(nullable = false)
    private String title;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;
    private String author;
    private Long views;
    private Long likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "community")
    private List<Comment> comments;

    @OneToMany(mappedBy = "community")
    private List<Picture> pictures;

    @Builder
    private Community(Long post_id, String title, String content, String author, Long views, Long likes) {
        this.post_id = post_id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.views = views;
        this.likes = likes;
    }

}
