package charter.charter_safe.Building.b_dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OfficetelDto {

    private String offiNm;
    private String address;
    private String sggNm; // 시군구
    private String umdNm; // 법정동
    private String jibun; // 지번

    private Long deposit; // 전세가격

    private Double charter_rate; // 전세가율

    private Long back_taxes; // 체납 세금

    private Long risk;

}

