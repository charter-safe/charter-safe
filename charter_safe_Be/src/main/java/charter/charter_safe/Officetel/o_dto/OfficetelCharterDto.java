package charter.charter_safe.Officetel.o_dto;

import lombok.*;

@Getter
@Builder
public class OfficetelCharterDto {

    private String deposit;
    private String sggNm; // 시군구
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String offiNm; // 단지명
    private String sggCd; // 지역코드
    private String contractTerm; // 계약 기간
    private String buildYear; // 건축 연도
    private String excluUseAr; // 전용 면적
    private String floor; // 층수
    private String monthlyRent; // 월세

    public OfficetelCharterDto(String deposit, String sggNm, String umdNm, String jibun, String offiNm, String sggCd,
                               String floor, String buildYear, String excluUseAr, String contractTerm, String monthlyRent) {
        this.deposit = deposit;
        this.sggNm = sggNm;
        this.umdNm = umdNm;
        this.jibun = jibun;
        this.offiNm = offiNm;
        this.sggCd = sggCd;
        this.floor = floor;
        this.buildYear = buildYear;
        this.excluUseAr = excluUseAr;
        this.contractTerm = contractTerm;
        this.monthlyRent = monthlyRent;
    }
}
