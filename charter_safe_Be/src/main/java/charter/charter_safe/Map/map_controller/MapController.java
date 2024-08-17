package charter.charter_safe.Map.map_controller;

import lombok.RequiredArgsConstructor;
import org.apache.tomcat.websocket.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;

@RestController
@RequiredArgsConstructor
public class MapController {

    @GetMapping("/map")
    public String map(Model model) throws IOException, ParseException {

        StringBuilder urlBuilder = new StringBuilder("apis.data.go.kr/1613000/RTMSDataSvcOffiRent/getRTMSDataSvcOffiRent");
        urlBuilder.append("?LAWD_CD=11140");
        urlBuilder.append("&DEAL_YMD=202401");
        urlBuilder.append("&serviceKey=xnrR9tk0q7+DsId1afT+Duec9dGjb+0GXrryYld0IXzHJ95APU32/5UCEPJts3XlAJpBZ2Bf6LCngMZ+Eekyzw==");

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("응답 결과 : " + conn.getResponseCode());

        return "map";
    }
}
