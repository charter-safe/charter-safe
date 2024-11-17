package charter.charter_safe.Apt.a_dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AptDataDto {
    private AptCharterDto aptCharterDto;
    private AptTradeDto aptTradeDto;
    private double aptRate;

    public AptDataDto(AptCharterDto aptCharterDto, AptTradeDto aptTradeDto) {
        this.aptCharterDto = aptCharterDto;
        this.aptTradeDto = aptTradeDto;
    }
}
