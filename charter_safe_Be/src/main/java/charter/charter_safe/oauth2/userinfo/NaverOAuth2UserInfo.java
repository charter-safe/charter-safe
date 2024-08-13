package charter.charter_safe.oauth2.userinfo;

import java.time.LocalDate;
import java.util.Map;

public class NaverOAuth2UserInfo extends OAuth2UserInfo{

    public NaverOAuth2UserInfo(Map<String, Object> attributes) {
        super(attributes);
    }

    @Override
    public String getId() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("id");
    }
    @Override
    public String getNickname() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("name");
    }
    @Override
    public String getAddress() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("address");
    }
    @Override
    public String  getYear() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("year");
    }
    @Override
    public String  getBirthday() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("birthday");
    }
    @Override
    public String getPhone_Number() {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if(response == null) return null;
        return (String) response.get("phone_number");
    }
}
