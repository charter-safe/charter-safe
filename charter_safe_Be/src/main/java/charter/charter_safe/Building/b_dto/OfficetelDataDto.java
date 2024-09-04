package charter.charter_safe.Building.b_dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OfficetelDataDto {

    private CharterDto charterDto;
    private TradeDto tradeDto;
    private double charterRate;

    public OfficetelDataDto(CharterDto charterDto, TradeDto tradeDto) {
        this.charterDto = charterDto;
        this.tradeDto = tradeDto;
    }
}
