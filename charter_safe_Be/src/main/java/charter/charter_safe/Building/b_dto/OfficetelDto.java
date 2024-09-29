package charter.charter_safe.Building.b_dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OfficetelDto {

    private Long officetel_number;

    private String o_name;

    private String o_address;

    private Long price; // 전세가격

    private Long charter_rate; // 전세가율

    private Long back_texes; // 체납 세금

    private Long risk;
}
