package charter.charter_safe.Building.b_controller;

import charter.charter_safe.Building.b_dto.CharterDto;
import charter.charter_safe.Building.b_dto.TradeDto;
import charter.charter_safe.Building.b_service.OfficetelService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/data")
public class OfficetelController {

    private final OfficetelService officetelService;

    @PostMapping("")
    public String saveOfficetelData(@RequestParam List<CharterDto> charterList,
                                    @RequestParam List<TradeDto> tradeList) {
        officetelService.saveOfficetelData(charterList, tradeList);
        return "success";
    }
}
