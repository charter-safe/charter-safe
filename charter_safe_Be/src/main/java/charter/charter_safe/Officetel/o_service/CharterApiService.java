package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CharterApiService {

    List<OfficetelCharterDto> CharterInfoApiParseXml(String xmlData) throws Exception;
}
