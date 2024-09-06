package charter.charter_safe.Building.b_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Officetel {

    @Id @GeneratedValue
    @Column(name = "o_no")
    private Long officetel_number;

    private String o_name;

    private String o_address;

    private Long price; // 전세가격

    private Long charter_rate; // 전세가율

    private Long back_texes; // 체납 세금

    private Long risk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "officetel")
    private List<HostReview> hostReviews;
}
