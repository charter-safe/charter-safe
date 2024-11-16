package charter.charter_safe.Officetel.o_domain;

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
    private Long o_number;
    private String offiNm;
    private String address;
    private String sggNm; // 시군구
    private String umdNm; // 법정동
    private String jibun; // 지번
    private Long deposit; // 전세가격
    private Double charter_rate; // 전세가율
    private Long back_taxes; // 체납 세금
    private Long risk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "officetel")
    private List<HostReview> hostReviews;

    public Officetel(String offiNm, String address, String sggNm, String umdNm, String jibun, Long deposit, Double charter_rate, Long back_taxes, Long risk, Member member, List<HostReview> hostReviews) {
        this.offiNm = offiNm;
        this.address = address;
        this.sggNm = sggNm;
        this.umdNm = umdNm;
        this.jibun = jibun;
        this.deposit = deposit;
        this.charter_rate = charter_rate;
        this.back_taxes = back_taxes;
        this.risk = risk;
        this.member = member;
        this.hostReviews = hostReviews;
    }
}
