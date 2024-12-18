package charter.charter_safe.Apt.a_dto;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
public class AptTradeDto {

    private String aptNm; // 아파트이름
    private String sggCd; // 법정코드
    private String sggNm; // 구이름
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String floor; // 층수
    private String buildYear; //건축연도
    private String excluUseAr; // 전용면적
    private String dealAmount; // 매매가격
    private String rgstDate; // 등록일
}
