package charter.charter_safe.Building.b_dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
public class TradeDto {

    private String dealAmount;
    private String sggNm; // 시군구
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String offiNm; // 단지명
    private String sggCd; // 지역코드

    public TradeDto(String dealAmount, String sggNm, String umdNm, String jibun, String offiNm, String sggCd) {
        this.dealAmount = dealAmount;
        this.sggNm = sggNm;
        this.umdNm = umdNm;
        this.jibun = jibun;
        this.offiNm = offiNm;
        this.sggCd = sggCd;
    }
}
