package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.CharterDto;
import charter.charter_safe.Building.b_dto.OfficetelDataDto;
import charter.charter_safe.Building.b_dto.OfficetelDto;
import charter.charter_safe.Building.b_dto.TradeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OfficetelService {
    List<OfficetelDto> saveOfficetelData(List<CharterDto> charterList, List<TradeDto> tradeList);
}
