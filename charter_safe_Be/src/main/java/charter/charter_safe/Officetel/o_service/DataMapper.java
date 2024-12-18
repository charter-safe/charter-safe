package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDataDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DataMapper {

    public List<OfficetelDataDto> mapRentAndTrade(List<OfficetelCharterDto> charterList, List<OfficetelTradeDto> tradeList) {

        Map<String, OfficetelTradeDto> tradeMap = new HashMap<>();
        for(OfficetelTradeDto officetelTradeDto : tradeList) {
            String key = officetelTradeDto.getOffiNm() + officetelTradeDto.getJibun();
            tradeMap.put(key, officetelTradeDto);
        }

        List<OfficetelDataDto> mappedData = new ArrayList<>();
        for(OfficetelCharterDto officetelCharterDto : charterList) {
            String key = officetelCharterDto.getOffiNm() + officetelCharterDto.getJibun();
            if(tradeMap.containsKey(key)) {
                OfficetelTradeDto trades = tradeMap.get(key);
                OfficetelDataDto dataDto = new OfficetelDataDto(officetelCharterDto, trades);
                mappedData.add(dataDto);
            }
        }
        return mappedData;
    }
}
