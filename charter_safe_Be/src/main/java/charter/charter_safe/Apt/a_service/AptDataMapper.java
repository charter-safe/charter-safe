package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptCharterDto;
import charter.charter_safe.Apt.a_dto.AptDataDto;
import charter.charter_safe.Apt.a_dto.AptTradeDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AptDataMapper {

    public List<AptDataDto> mapRentAndTrade(List<AptCharterDto> charterList, List<AptTradeDto> tradeList) {

        Map<String, AptTradeDto> tradeMap = new HashMap<>();
        for(AptTradeDto aptTradeDto : tradeList) {
            String key = aptTradeDto.getAptNm() + aptTradeDto.getJibun();
            tradeMap.put(key, aptTradeDto);
        }

        List<AptDataDto> mappedData = new ArrayList<>();
        for(AptCharterDto aptCharterDto : charterList) {
            String key = aptCharterDto.getAptNm() + aptCharterDto.getJibun();
            if(tradeMap.containsKey(key)) {
                AptTradeDto trades = tradeMap.get(key);
                AptDataDto dataDto = new AptDataDto(aptCharterDto, trades);
                mappedData.add(dataDto);
            }
        }
        return mappedData;
    }
}
