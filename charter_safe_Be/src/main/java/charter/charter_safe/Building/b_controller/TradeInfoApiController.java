package charter.charter_safe.Building.b_controller;

import charter.charter_safe.Building.b_dto.CharterDto;
import charter.charter_safe.Building.b_dto.TradeDto;
import charter.charter_safe.Building.b_service.CharterApiService;
import charter.charter_safe.Building.b_service.TradeApiService;
import charter.charter_safe.Member.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class TradeInfoApiController {
    private final TradeApiService tradeApiService;
    String t_url = "https://apis.data.go.kr/1613000/RTMSDataSvcOffiTrade/getRTMSDataSvcOffiTrade"; //매매 데이터

    @Value("${API-KEY.trade}")
    String t_serviceKey; // 매매 서비스키

    Integer current_year = LocalDate.now().getYear();
    String current_month = "0" + (LocalDate.now().getMonthValue() - 1);
    Integer numOfRows = 1000;
    List<String> LAWD_CD = List.of("11110", "11140", "11170",
            "11200", "11215", "11230", "11260", "11290", "11305",
            "11320", "11350", "11380", "11410", "11440", "11470",
            "11500", "11530", "11545", "11560", "11590", "11620",
            "11650", "11680", "11710", "11740");

    @GetMapping("/trade")
    public ApiResponse<?> TradeList() throws Exception {

        RestTemplate restTemplate = new RestTemplate();
        List<TradeDto> tradeList = new ArrayList<>();

        for(String lawd_cd : LAWD_CD) {
            String urlStr = t_url + "?LAWD_CD=" + lawd_cd + "&DEAL_YMD=" + current_year + current_month
                    + "&serviceKey=" + t_serviceKey + "&numOfRows=" + numOfRows;
            URI uri = new URI(urlStr);
            String jsonData = restTemplate.getForObject(uri, String.class);
            List<TradeDto> currentTradeList = tradeApiService.TradeInfoApiParseXml(jsonData);
            tradeList.addAll(currentTradeList);
        }
        return ApiResponse.ok(tradeList);
    }
}
