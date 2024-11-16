package charter.charter_safe.Officetel.o_dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OfficetelDataDto {

    private OfficetelCharterDto officetelCharterDto;
    private OfficetelTradeDto officetelTradeDto;
    private double charterRate;

    public OfficetelDataDto(OfficetelCharterDto officetelCharterDto, OfficetelTradeDto officetelTradeDto) {
        this.officetelCharterDto = officetelCharterDto;
        this.officetelTradeDto = officetelTradeDto;
    }
}
