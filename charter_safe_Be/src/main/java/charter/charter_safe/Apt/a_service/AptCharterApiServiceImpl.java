package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_dto.AptCharterDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AptCharterApiServiceImpl implements AptCharterApiService {

    @Override
    @Transactional
    public List<AptCharterDto> AptInfoApiParseXml(String jsonData) throws Exception {
        List<AptCharterDto> aptInfoList = new ArrayList<>();

        // JSON 파서 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 데이터를 트리 구조로 변환
        JsonNode rootNode = objectMapper.readTree(jsonData);
        JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

        // itemsNode를 반복하면서 AptDto 객체 생성 및 리스트에 추가
        for (JsonNode itemNode : itemsNode) {

            String aptNm = itemNode.path("aptNm").asText();
            String sggCd = itemNode.path("sggCd").asText();
            String umdNm = itemNode.path("umdNm").asText();
            String jibun = itemNode.path("jibun").asText();
            String floor = itemNode.path("floor").asText();
            String buildYear = itemNode.path("buildYear").asText();
            String excluUseAr = itemNode.path("excluUseAr").asText();
            String contractTerm = itemNode.path("contractTerm").asText();
            String deposit = itemNode.path("deposit").asText();
            String monthlyRent = itemNode.path("monthlyRent").asText();


            AptCharterDto aptCharter = new AptCharterDto(aptNm, sggCd, umdNm, jibun, floor, buildYear, excluUseAr, contractTerm, deposit, monthlyRent);
            aptInfoList.add(aptCharter);
        }
        return aptInfoList;
    }
}
