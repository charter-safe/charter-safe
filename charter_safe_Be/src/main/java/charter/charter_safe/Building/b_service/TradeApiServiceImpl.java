package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.TradeDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TradeApiServiceImpl implements TradeApiService{

    @Override
    @Transactional
    public List<TradeDto> TradeInfoApiParseXml(String jsonData) throws Exception {
        List<TradeDto> tradeInfoList = new ArrayList<>();

        // JSON 파서 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 데이터를 트리 구조로 변환
        JsonNode rootNode = objectMapper.readTree(jsonData);
        JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

        // itemsNode를 반복하면서 CharterDto 객체 생성 및 리스트에 추가
        for (JsonNode itemNode : itemsNode) {
            String dealAmount = itemNode.path("dealAmount").asText();
            String sggNm = itemNode.path("sggNm").asText();
            String umdNm = itemNode.path("umdNm").asText();
            String jibun = itemNode.path("jibun").asText();
            String offiNm = itemNode.path("offiNm").asText();
            String sggCd = itemNode.path("sggCd").asText();

            TradeDto trade = new TradeDto(dealAmount, sggNm, umdNm, jibun, offiNm, sggCd);
            tradeInfoList.add(trade);
        }
        return tradeInfoList;
    }
}