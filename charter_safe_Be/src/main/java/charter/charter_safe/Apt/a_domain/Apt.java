package charter.charter_safe.Apt.a_domain;

import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Officetel.o_domain.HostReview;
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
public class Apt {

    @Id @GeneratedValue
    @Column(name = "a_no")
    private Long a_number;
    private String aptNm;
    private String address;
    private String sggNm; // 법정구
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String floor;
    private String buildYear;
    private String excluUseAr;
    private String contractTerm;
    private Long deposit; // 전세가격
    private Double charter_rate; // 전세가율
    private Long back_taxes; // 체납 세금
    private Long risk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "m_id")
    private Member member;

    @OneToMany(mappedBy = "apt")
    private List<HostReview> hostReviews;

}
