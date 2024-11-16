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

    public OfficetelCharterDto(String deposit, String sggNm, String umdNm, String jibun, String offiNm, String sggCd) {
        this.deposit = deposit;
        this.sggNm = sggNm;
        this.umdNm = umdNm;
        this.jibun = jibun;
        this.offiNm = offiNm;
        this.sggCd = sggCd;
    }
}
