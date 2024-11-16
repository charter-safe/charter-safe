package charter.charter_safe.Apt.a_dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AptDto {

    private Long a_number;
    private String aptNm;
    private String address;
    private String umdNm; // 법정동
    private String jibun; // 지번
    private String floor;
    private String buildYear;
    private Double excluUseAr;
    private String contractTerm;
    private Long deposit; // 전세가격
    private Double charter_rate; // 전세가율
    private Long back_taxes; // 체납 세금
    private Long risk;

}

