package charter.charter_safe.Officetel.o_controller;

import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import charter.charter_safe.Officetel.o_service.CharterApiService;
import charter.charter_safe.Officetel.o_service.OfficetelSearchService;
import charter.charter_safe.Officetel.o_service.OfficetelService;
import charter.charter_safe.Officetel.o_service.TradeApiService;
import charter.charter_safe.Member.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/officetel")
public class OfficetelController {

    String r_url = "https://apis.data.go.kr/1613000/RTMSDataSvcOffiRent/getRTMSDataSvcOffiRent"; //전세 데이터
    String t_url = "https://apis.data.go.kr/1613000/RTMSDataSvcOffiTrade/getRTMSDataSvcOffiTrade"; //매매 데이터

    @Value("${API-KEY.rent}")
    String r_serviceKey; // 전세 서비스키
    @Value("${API-KEY.trade}")
    String t_serviceKey; // 매매 서비스키

    Integer current_year = LocalDate.now().getYear();
    Integer current_month = LocalDate.now().getMonthValue();
    Integer numOfRows = 1000;

    List<String> LAWD_CD = List.of("11110", "11140", "11170",
            "11200", "11215", "11230", "11260", "11290", "11305",
            "11320", "11350", "11380", "11410", "11440", "11470",
            "11500", "11530", "11545", "11560", "11590", "11620",
            "11650", "11680", "11710", "11740");

    private final OfficetelService officetelService;
    private final TradeApiService tradeApiService;
    private final CharterApiService charterApiService; // final(null 예외 방지)
    private final OfficetelSearchService officetelSearchService;



    @GetMapping("")
    public ApiResponse<?> saveOfficetelData() throws Exception{

        List<OfficetelCharterDto> charterList = new ArrayList<>();
        List<OfficetelTradeDto> tradeList = new ArrayList<>();

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
            List<OfficetelCharterDto> currentRentList = charterApiService.CharterInfoApiParseXml(jsonData1);
            List<OfficetelTradeDto> currentTradeList = tradeApiService.TradeInfoApiParseXml(jsonData2);
            charterList.addAll(currentRentList);
            tradeList.addAll(currentTradeList);
        }

        List<OfficetelDto> officetelList = officetelService.saveOfficetelData(charterList, tradeList);
        List<OfficetelDocument> officetelDocuments = officetelSearchService.saveData(charterList, tradeList);
        return ApiResponse.ok(officetelDocuments);
    }

//    @GetMapping("/find/{umdNm}")
//    @Transactional
//    public List<OfficetelDto> find(@PathVariable String umdNm) {
//        return officetelService.findOfficetelData(umdNm);
//    }
//
//    @GetMapping("/findBySggNm/{sggNm}")
//    @Transactional
//    public List<OfficetelDto> findSggNm(@PathVariable String sggNm) {
//        return officetelService.findOfficetelDataBySggNm(sggNm);
//    }

    @GetMapping("/search1/{sggNm}")
    @Transactional
    public List<OfficetelDocument> searchBySggNm(@PathVariable String sggNm) {
        return officetelSearchService.searchBySggNm(sggNm);
    }

    @GetMapping("/search2/{umdNm}")
    @Transactional
    public List<OfficetelDocument> searchByUmdNm(@PathVariable String umdNm) {
        return officetelSearchService.searchByUmdNm(umdNm);
    }
}
