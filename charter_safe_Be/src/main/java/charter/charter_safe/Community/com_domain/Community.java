package charter.charter_safe.Community.com_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Community extends TimeStamp{

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_no")
    private Long post_id;
    @Column(nullable = false)
    private String title;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;
    private String author;
    private Integer views;
    private Integer likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "community")
    private List<Comment> comments;

    @OneToMany(mappedBy = "community", cascade = CascadeType.ALL, orphanRemoval = true) // 게시글이 삭제되면 이미지도 자동으로 삭제, 고아 객체 관리
    private List<Image> images;

    @Builder
    public Community(Long post_id, String title, String content, Member member, String author, Integer views, Integer likes) {
        this.post_id = post_id;
        this.title = title;
        this.content = content;
        if(member == null) {
            throw new IllegalArgumentException("null");
        }
        this.author = author;
        this.member = member;
        this.views = views;
        this.likes = likes;
    }

    public void update(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public void increaseViews() {
        this.views++;
    }

    public void increaseLikes() {
        this.likes++;
    }
}
