package charter.charter_safe.Community.com_domain;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;

@Entity
@Getter
@Builder
public class Image extends TimeStamp{

    @Id @GeneratedValue
    @Column(name = "i_no")
    private Long image_number;

    private String url;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;
}
