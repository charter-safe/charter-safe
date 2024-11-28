package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OfficetelService {
    List<OfficetelDto> saveOfficetelData(List<OfficetelCharterDto> charterList, List<OfficetelTradeDto> tradeList);
    List<OfficetelDto> findOfficetelData(String umdNm);
    List<OfficetelDto> findOfficetelDataBySggNm(String sggNm);
}
