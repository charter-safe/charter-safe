package charter.charter_safe.Member.oauth2.userinfo;

import java.util.Map;

public class GoogleOAuth2UserInfo extends OAuth2UserInfo {

    public GoogleOAuth2UserInfo(Map<String, Object> attributes) {
        super(attributes);
    }

    @Override public String getId() { return (String) attributes.get("sub");}
    @Override public String getNickname() { return (String) attributes.get("name");}
    @Override public String getAddress() { return (String) attributes.get("address");}
    @Override public String getYear() { return (String) attributes.get("year");}
    @Override public String getBirthday() { return (String) attributes.get("birthday");}
    @Override public String getPhone_Number() { return (String) attributes.get("phone_number");}
}
