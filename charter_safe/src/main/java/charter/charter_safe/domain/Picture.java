package charter.charter_safe.domain;

import jakarta.persistence.*;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;

@Entity
@Getter
public class Picture {

    @Id @GeneratedValue
    @Column(name = "i_no")
    private Long picture_number;

    @CreatedDate
    private LocalDateTime create_picture_date;

    @LastModifiedDate
    private LocalDateTime update_picture_date;

    private String link;

    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "p_no")
    private Community community;
}
