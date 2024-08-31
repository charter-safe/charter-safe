package charter.charter_safe.Community.com_domain;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
@AllArgsConstructor
public class Image extends TimeStamp{

    @Id @GeneratedValue
    @Column(name = "i_no")
    private Long image_number;

    private String origin_name;

    private String save_name;

    private String url;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;

//    @Builder
//    public Image(Long image_number, String origin_name, String save_name, String url, Community community)
//    {
//        this.image_number = image_number;
//        this.origin_name = origin_name;
//        this.save_name = save_name;
//        this.url = url;
//        this.community = community;
//    }
}
