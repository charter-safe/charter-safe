package charter.charter_safe.Member.authority;

import lombok.Data;
import lombok.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
public class TokenInfo {

    private String grantType;
    private String accessToken;

    public TokenInfo(String grantType, String accessToken) {
        this.grantType = grantType;
        this.accessToken = accessToken;
    }
}
