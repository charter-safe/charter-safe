package charter.charter_safe.oauth2.userinfo;

import java.security.PublicKey;
import java.time.LocalDate;
import java.util.Map;

public class GoogleOAuth2UserInfo extends OAuth2UserInfo {

    public GoogleOAuth2UserInfo(Map<String, Object> attributes) {
        super(attributes);
    }

    @Override
    public String getId() {
        return (String) attributes.get("sub");
    }

    @Override
    public String getNickname() {
        return (String) attributes.get("name");
    }

    @Override
    public LocalDate getBirthday() {
        return (LocalDate) attributes.get("birthday");
    }

    @Override
    public String getPhone_Number() {
        return (String) attributes.get("phone_number");
    }

}
