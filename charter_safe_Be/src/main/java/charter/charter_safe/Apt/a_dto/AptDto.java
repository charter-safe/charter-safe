package charter.charter_safe.Apt.a_dto;

import charter.charter_safe.Apt.a_domain.Apt;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AptDto {

    private String aptNm;
    private String address;
    private String sggNm;
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

    public AptDto(Apt apt) {
        this.aptNm = apt.getAptNm();
        this.address = apt.getAddress();
        this.sggNm = apt.getSggNm();
        this.umdNm = apt.getUmdNm();
        this.jibun = apt.getJibun();
        this.floor = apt.getFloor();
        this.buildYear = apt.getBuildYear();
        this.excluUseAr = apt.getExcluUseAr();
        this.contractTerm = apt.getContractTerm();
        this.deposit = apt.getDeposit();
        this.charter_rate = apt.getCharter_rate();
        this.back_taxes = apt.getBack_taxes();
        this.risk = apt.getRisk();
    }
}

