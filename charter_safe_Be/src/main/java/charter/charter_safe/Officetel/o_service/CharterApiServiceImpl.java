package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CharterApiServiceImpl implements CharterApiService{

    @Override
    @Transactional
    public List<OfficetelCharterDto> CharterInfoApiParseXml(String jsonData) throws Exception {
        List<OfficetelCharterDto> charterInfoList = new ArrayList<>();

        // JSON 파서 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 데이터를 트리 구조로 변환
        JsonNode rootNode = objectMapper.readTree(jsonData);
        JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

        // itemsNode를 반복하면서 OfficetelCharterDto 객체 생성 및 리스트에 추가
        for (JsonNode itemNode : itemsNode) {
            String deposit = itemNode.path("deposit").asText();
            String sggNm = itemNode.path("sggNm").asText();
            String umdNm = itemNode.path("umdNm").asText();
            String jibun = itemNode.path("jibun").asText();
            String offiNm = itemNode.path("offiNm").asText();
            String sggCd = itemNode.path("sggCd").asText();

            OfficetelCharterDto charter = new OfficetelCharterDto(deposit, sggNm, umdNm, jibun, offiNm, sggCd);
            charterInfoList.add(charter);
        }
        return charterInfoList;
    }
}
