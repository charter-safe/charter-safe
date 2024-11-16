package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AptCharterApiService {
    List<AptDto> AptInfoApiParseXml(String xmlData) throws Exception;
}
