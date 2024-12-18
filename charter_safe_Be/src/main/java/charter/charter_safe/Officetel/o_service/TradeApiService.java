package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TradeApiService {
    List<OfficetelTradeDto> TradeInfoApiParseXml(String jsonData) throws Exception;
}
