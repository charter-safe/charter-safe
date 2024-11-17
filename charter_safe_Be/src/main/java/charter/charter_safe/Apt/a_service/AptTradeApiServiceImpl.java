package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptTradeDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AptTradeApiServiceImpl implements AptTradeApiService {

    @Override
    @Transactional
    public List<AptTradeDto> AptInfoApiParseXml(String jsonData) throws Exception {
        List<AptTradeDto> aptInfoList = new ArrayList<>();

        // JSON 파서 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 데이터를 트리 구조로 변환
        JsonNode rootNode = objectMapper.readTree(jsonData);
        JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

        // itemsNode를 반복하면서 AptDto 객체 생성 및 리스트에 추가
        for (JsonNode itemNode : itemsNode) {

            String aptNm = itemNode.path("aptNm").asText();
            String sggCd = itemNode.path("sggCd").asText();
            String sggNm = itemNode.path("estateAgentSggNm").asText();
            String umdNm = itemNode.path("umdNm").asText();
            String jibun = itemNode.path("jibun").asText();
            String floor = itemNode.path("floor").asText();
            String buildYear = itemNode.path("buildYear").asText();
            String excluUseAr = itemNode.path("excluUseAr").asText();
            String dealAmount = itemNode.path("dealAmount").asText();
            String rgstDate = itemNode.path("rgstDate").asText();

            AptTradeDto aptTrade = new AptTradeDto(aptNm, sggCd, sggNm, umdNm, jibun, floor, buildYear, excluUseAr,
                    dealAmount, rgstDate);
            aptInfoList.add(aptTrade);
        }
        return aptInfoList;
    }
}
