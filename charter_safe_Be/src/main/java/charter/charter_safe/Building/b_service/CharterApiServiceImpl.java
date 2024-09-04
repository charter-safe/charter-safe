package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_dto.CharterDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.print.Doc;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CharterApiServiceImpl implements CharterApiService{

    @Override
    @Transactional
    public List<CharterDto> CharterInfoApiParseXml(String xmlData) throws Exception {
        List<CharterDto> charterInfoList = new ArrayList<>();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(new InputSource(new StringReader(xmlData)));

        NodeList itemNodes = document.getElementsByTagName("item");
        System.out.println("item 개수:" + itemNodes.getLength());

        for(int i = 0; i < itemNodes.getLength(); i++) {
            Node itemNode = itemNodes.item(i);

            if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
                Element itemListElement = (Element) itemNode;

                String deposit = getElementValue(itemListElement, "deposit");
                String sggNm = getElementValue(itemListElement, "sggNm");// 시군구
                String umdNm = getElementValue(itemListElement, "umdNm"); // 법정동
                String jibun = getElementValue(itemListElement, "jibun"); // 지번
                String offiNm = getElementValue(itemListElement, "offiNm"); // 단지명
                String sggCd = getElementValue(itemListElement, "sggCd"); // 지역코드

                CharterDto charter = new CharterDto(deposit, sggNm, umdNm, jibun, offiNm, sggCd);
                charterInfoList.add(charter);
            }
            else System.out.println("땡");
        }
        return charterInfoList;
    }

    private final String getElementValue(Element element, String tagName) {
        NodeList nodeList = element.getElementsByTagName(tagName);
        System.out.println(tagName);
        if(nodeList.getLength() > 0) {
            Node node = nodeList.item(0);
            return node.getTextContent();
        }
        return "";
    }
}
