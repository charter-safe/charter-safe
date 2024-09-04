package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.CharterDto;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@Service
public interface CharterApiService {

    List<CharterDto> CharterInfoApiParseXml(String xmlData) throws Exception;
}
