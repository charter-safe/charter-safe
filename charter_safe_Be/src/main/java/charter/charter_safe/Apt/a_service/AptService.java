package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_domain.Apt;
import charter.charter_safe.Apt.a_dto.AptCharterDto;
import charter.charter_safe.Apt.a_dto.AptDto;
import charter.charter_safe.Apt.a_dto.AptTradeDto;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AptService {
    List<AptDto> saveAptData(List<AptCharterDto> charterList, List<AptTradeDto> tradeList);
    List<AptDto> findApt(String umdNm);
}
