package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.CharterDto;
import charter.charter_safe.Building.b_dto.TradeDto;
import charter.charter_safe.Building.b_dto.OfficetelDataDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DataMapper {

    public List<OfficetelDataDto> mapRentAndTrade(List<CharterDto> charterList, List<TradeDto> tradeList) {

        Map<String, TradeDto> tradeMap = new HashMap<>();
        for(TradeDto tradeDto : tradeList) {
            String key = tradeDto.getOffiNm() + tradeDto.getJibun();
            tradeMap.put(key, tradeDto);
        }

        List<OfficetelDataDto> mappedData = new ArrayList<>();
        for(CharterDto charterDto : charterList) {
            String key = charterDto.getOffiNm() + charterDto.getJibun();
            if(tradeMap.containsKey(key)) {
                TradeDto trades = tradeMap.get(key);
                OfficetelDataDto dataDto = new OfficetelDataDto(charterDto, trades);
                mappedData.add(dataDto);
            }
        }
        return mappedData;
    }
}
