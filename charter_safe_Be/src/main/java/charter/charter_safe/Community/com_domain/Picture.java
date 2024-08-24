package charter.charter_safe.Community.com_domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

@Entity
@Getter
public class Picture extends TimeStamp{

    @Id @GeneratedValue
    @Column(name = "i_no")
    private Long picture_number;

    private String link;

    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;
}
