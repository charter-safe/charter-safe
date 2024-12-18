package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptCharterDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AptCharterApiService {
    List<AptCharterDto> AptInfoApiParseXml(String xmlData) throws Exception;
}
