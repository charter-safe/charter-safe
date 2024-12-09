package charter.charter_safe.Officetel.o_domain;

import charter.charter_safe.Member.domain.Member;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.elasticsearch.annotations.Document;

import java.util.List;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Document(indexName = "officetel")
public class OfficetelDocument {

    @Id
    private String id;

    private String offiNm;
    private String address;
    private String sggNm; // 시군구
//    private String umdNm; // 법정동
//    private String jibun; // 지번
//    private Long deposit; // 전세가격
//    private String floor; // 층수
//    private String buildYear; // 건축 연도
//    private String excluUseAr; // 전용 면적
//    private String contractTerm; // 계약 기간
//    private String monthlyRent; // 월세
//    private Double charter_rate; // 전세가율
//    private Long back_taxes; // 체납 세금
//    private Long risk;

    public static OfficetelDocument from(Officetel officetel) {
        return OfficetelDocument.builder()
                .offiNm(officetel.getOffiNm())
                .address(officetel.getAddress())
                .sggNm(officetel.getSggNm())
//                .umdNm(officetel.getUmdNm())
//                .jibun(officetel.getJibun())
//                .deposit(officetel.getDeposit())
//                .floor(officetel.getFloor())
//                .buildYear(officetel.getBuildYear())
//                .excluUseAr(officetel.getExcluUseAr())
//                .contractTerm(officetel.getContractTerm())
//                .monthlyRent(officetel.getMonthlyRent())
//                .charter_rate(officetel.getCharter_rate())
//                .back_taxes(officetel.getBack_taxes())
//                .risk(officetel.getRisk())
                .build();
    }

//    public OfficetelDocument(String offiNm, String address, String sggNm)
//
////    String umdNm, String jibun, Long deposit, String floor, String buildYear, String excluUseAr, String contractTerm, String monthlyRent, Double charter_rate, Long back_taxes, Long risk)
//    {
//        this.offiNm = offiNm;
//        this.address = address;
//        this.sggNm = sggNm;
////        this.umdNm = umdNm;
////        this.jibun = jibun;
////        this.deposit = deposit;
////        this.floor = floor;
////        this.buildYear = buildYear;
////        this.excluUseAr = excluUseAr;
////        this.contractTerm = contractTerm;
////        this.monthlyRent = monthlyRent;
////        this.charter_rate = charter_rate;
////        this.back_taxes = back_taxes;
////        this.risk = risk;
//    }
}
