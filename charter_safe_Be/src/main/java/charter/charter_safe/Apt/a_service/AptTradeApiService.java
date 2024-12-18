package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptTradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AptTradeApiService {
    List<AptTradeDto> AptInfoApiParseXml(String xmlData) throws Exception;
}
