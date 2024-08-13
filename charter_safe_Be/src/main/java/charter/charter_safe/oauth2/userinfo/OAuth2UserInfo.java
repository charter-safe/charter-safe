package charter.charter_safe.oauth2.userinfo;

import java.time.LocalDate;
import java.util.Map;

public abstract class OAuth2UserInfo {

    protected Map<String, Object> attributes;

    public OAuth2UserInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public abstract String getNickname();
    public abstract String getId();
    public abstract String getAddress();
    public abstract String getYear();
    public abstract String getBirthday();
    public abstract String getPhone_Number();


}
