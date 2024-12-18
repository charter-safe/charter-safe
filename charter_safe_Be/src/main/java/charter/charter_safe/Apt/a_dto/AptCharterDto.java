package charter.charter_safe.Apt.a_dto;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
public class AptCharterDto {

    private String aptNm;
    private String sggCd;
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String floor; // 층수
    private String buildYear; //건축연도
    private String excluUseAr; // 전용면적
    private String contractTerm; // 계약기간
    private String deposit; // 전세가격
    private String monthlyRent;
}
