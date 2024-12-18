package charter.charter_safe.Officetel.o_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.elasticsearch.annotations.Document;

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
    private String floor; // 층수
    private String buildYear; // 건축 연도
    private String excluUseAr; // 전용 면적
    private String contractTerm; // 계약 기간
    private String monthlyRent; // 월세
    private Double charter_rate; // 전세가율
    private Long back_taxes; // 체납 세금
    private Long risk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "officetel")
    private List<HostReview> hostReviews;

    public Officetel(Long o_number, String offiNm, String address, String sggNm, String umdNm, String jibun,
                     Long deposit, String contractTerm, String buildYear, String excluUseAr, String floor,
                     String monthlyRent, Double charter_rate, Long back_taxes, Long risk) {
        this.o_number = o_number;
        this.offiNm = offiNm;
        this.address = address;
        this.sggNm = sggNm;
        this.umdNm = umdNm;
        this.jibun = jibun;
        this.deposit = deposit;
        this.floor = contractTerm;
        this.buildYear = buildYear;
        this.excluUseAr = excluUseAr;
        this.contractTerm = floor;
        this.monthlyRent = monthlyRent;
        this.charter_rate = charter_rate;
        this.back_taxes = back_taxes;
        this.risk = risk;
    }
}
