package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.TradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TradeApiService {
    List<TradeDto> TradeInfoApiParseXml(String jsonData) throws Exception;
}
