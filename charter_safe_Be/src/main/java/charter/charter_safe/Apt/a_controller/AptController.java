package charter.charter_safe.Apt.a_controller;

import charter.charter_safe.Apt.a_dto.AptCharterDto;
import charter.charter_safe.Apt.a_dto.AptDto;
import charter.charter_safe.Apt.a_dto.AptTradeDto;
import charter.charter_safe.Apt.a_service.AptCharterApiService;
import charter.charter_safe.Apt.a_service.AptService;
import charter.charter_safe.Apt.a_service.AptTradeApiService;
import charter.charter_safe.Member.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
public class AptController {

    private final AptCharterApiService aptCharterApiService; // final(null 예외 방지)
    private final AptTradeApiService aptTradeApiService;
    private final AptService aptService;
    String r_url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptRent/getRTMSDataSvcAptRent"; //전세 데이터
    String t_url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptTrade/getRTMSDataSvcAptTrade"; //매매 데이터

    @Value("${API-KEY.aptRent}")
    String r_serviceKey; // 전세 서비스키
    @Value("${API-KEY.aptTrade}")
    String t_serviceKey;
    Integer current_year = LocalDate.now().getYear();
    Integer current_month = LocalDate.now().getMonthValue() - 1;
    Integer numOfRows = 1000;
    List<String> LAWD_CD = List.of("11110", "11140", "11170",
            "11200", "11215", "11230", "11260", "11290", "11305",
            "11320", "11350", "11380", "11410", "11440", "11470",
            "11500", "11530", "11545", "11560", "11590", "11620",
            "11650", "11680", "11710", "11740");


    @GetMapping("")
    public ApiResponse<?> AptList() throws Exception {

        List<AptCharterDto> rentList = new ArrayList<>();
        List<AptTradeDto> tradeList = new ArrayList<>();

        RestTemplate restTemplate1 = new RestTemplate();
        RestTemplate restTemplate2 = new RestTemplate();


        for(String lawd_cd : LAWD_CD) {
            String urlStr1 = r_url + "?LAWD_CD=" + lawd_cd + "&DEAL_YMD=" + current_year + current_month
                    + "&serviceKey=" + r_serviceKey + "&numOfRows=" + numOfRows;

            String urlStr2 = t_url + "?LAWD_CD=" + lawd_cd + "&DEAL_YMD=" + current_year + current_month
                    + "&serviceKey=" + t_serviceKey + "&numOfRows=" + numOfRows;

            URI uri1 = new URI(urlStr1);
            URI uri2 = new URI(urlStr2);
            String jsonData1 = restTemplate1.getForObject(uri1, String.class);
            String jsonData2 = restTemplate2.getForObject(uri2, String.class);

            List<AptCharterDto> currentRentList = aptCharterApiService.AptInfoApiParseXml(jsonData1);
            List<AptTradeDto> currentTradeList = aptTradeApiService.AptInfoApiParseXml(jsonData2);

            rentList.addAll(currentRentList);
            tradeList.addAll(currentTradeList);
        }

        List<AptDto> aptList = aptService.saveAptData(rentList, tradeList);
        return ApiResponse.ok(aptList);
    }

    @GetMapping("/find/{umdNm}")
    @Transactional
    public List<AptDto> find(@PathVariable String umdNm) {
        return aptService.findApt(umdNm);
    }

    @GetMapping("/findBySggNm/{sggNm}")
    @Transactional
    public List<AptDto> findBySggNm(@PathVariable String sggNm) {
        return aptService.findAptBySggNm(sggNm);
    }
}
