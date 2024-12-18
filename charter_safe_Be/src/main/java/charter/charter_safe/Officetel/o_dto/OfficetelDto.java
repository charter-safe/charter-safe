package charter.charter_safe.Officetel.o_dto;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OfficetelDto {

    private String offiNm;
    private String address;
    private String sggNm; // 시군구
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String floor; // 층수
    private String buildYear; // 건축 연도
    private String excluUseAr; // 전용 면적
    private String contractTerm; // 계약 기간
    private String monthlyRent; // 월세

    private Long deposit; // 전세가격

    private Double charter_rate; // 전세가율

    private Long back_taxes; // 체납 세금

    private Long risk;

    public OfficetelDto(Officetel officetel) {
        this.offiNm = officetel.getOffiNm();
        this.address = officetel.getAddress();
        this.sggNm = officetel.getSggNm();
        this.umdNm = officetel.getUmdNm();
        this.jibun = officetel.getJibun();
        this.floor = officetel.getFloor();
        this.buildYear = officetel.getBuildYear();
        this.excluUseAr = officetel.getExcluUseAr();
        this.contractTerm = officetel.getContractTerm();
        this.monthlyRent = officetel.getMonthlyRent();
        this.deposit = officetel.getDeposit();
        this.charter_rate = officetel.getCharter_rate();
        this.back_taxes = officetel.getBack_taxes();
        this.risk = officetel.getRisk();
    }
//    public OfficetelDto(OfficetelDocument officetelDocument) {
//        this.sggNm = officetelDocument.getSggNm();
//    }

    public static OfficetelDto of(OfficetelDocument officetelDocument) {
        return OfficetelDto.builder()
                .offiNm(officetelDocument.getOffiNm())
                .address(officetelDocument.getAddress())
                .sggNm(officetelDocument.getSggNm())
                .build();
    }
}

