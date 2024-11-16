package charter.charter_safe.Apt.a_controller;

import charter.charter_safe.Apt.a_dto.AptCharterDto;
import charter.charter_safe.Apt.a_service.AptCharterApiService;
import charter.charter_safe.Member.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/apt")
public class AptCharterInfoApiController {

    private final AptCharterApiService aptCharterApiService; // final(null 예외 방지)
    String r_url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptRent/getRTMSDataSvcAptRent"; //전세 데이터
    @Value("${API-KEY.aptRent}")
    String r_serviceKey; // 전세 서비스키
    Integer current_year = LocalDate.now().getYear();
    Integer current_month = LocalDate.now().getMonthValue() - 1;
    Integer numOfRows = 1000;
    List<String> LAWD_CD = List.of("11110", "11140", "11170",
            "11200", "11215", "11230", "11260", "11290", "11305",
            "11320", "11350", "11380", "11410", "11440", "11470",
            "11500", "11530", "11545", "11560", "11590", "11620",
            "11650", "11680", "11710", "11740");


    @GetMapping("/charter")
    public ApiResponse<?> CharterList() throws Exception {

        RestTemplate restTemplate = new RestTemplate();
        List<AptCharterDto> rentList = new ArrayList<>();

        for(String lawd_cd : LAWD_CD) {
            String urlStr = r_url + "?LAWD_CD=" + lawd_cd + "&DEAL_YMD=" + current_year + current_month
                    + "&serviceKey=" + r_serviceKey + "&numOfRows=" + numOfRows;
            URI uri = new URI(urlStr);
            String jsonData = restTemplate.getForObject(uri, String.class);
            List<AptCharterDto> currentRentList = aptCharterApiService.AptInfoApiParseXml(jsonData);
            rentList.addAll(currentRentList);
        }
        return ApiResponse.ok(rentList);
    }
}
