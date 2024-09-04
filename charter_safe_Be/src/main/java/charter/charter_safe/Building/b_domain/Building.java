package charter.charter_safe.Building.b_domain;

import charter.charter_safe.Building.b_domain.HostReview;
import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.Getter;

import java.util.List;

@Entity
@Getter
public class Building {

    @Id @GeneratedValue
    @Column(name = "b_no")
    private Long building_number;

    private String b_name;

    private String b_address;

    private Long price; // 전세가격

    private Long rate; // 전세가율

    private Long back_texes; // 체납 세금

    private Long risk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "building")
    private List<HostReview> hostReviews;
}
