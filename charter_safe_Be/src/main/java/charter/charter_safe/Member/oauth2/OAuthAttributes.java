package charter.charter_safe.Member.oauth2;

import charter.charter_safe.Member.domain.SocialType;
import charter.charter_safe.Member.oauth2.userinfo.GoogleOAuth2UserInfo;
import charter.charter_safe.Member.oauth2.userinfo.NaverOAuth2UserInfo;
import charter.charter_safe.Member.oauth2.userinfo.OAuth2UserInfo;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.domain.Role;
import lombok.Builder;
import lombok.Getter;

import java.util.Map;
import java.util.UUID;

@Getter
public class OAuthAttributes {

    private String nameAttributeKey;
    private OAuth2UserInfo oAuth2UserInfo;

    @Builder
    private OAuthAttributes (String nameAttributeKey, OAuth2UserInfo oAuth2UserInfo) {
        this.nameAttributeKey = nameAttributeKey;
        this.oAuth2UserInfo = oAuth2UserInfo;
    }

    public static OAuthAttributes of(SocialType socialType,
                                     String userNameAttributeName, Map<String, Object> attributes) {
        if(socialType == SocialType.NAVER) {
            return ofNaver(userNameAttributeName, attributes);
        }
        return ofGoogle(userNameAttributeName, attributes);
    }

    public static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
        return OAuthAttributes.builder()
                .nameAttributeKey(userNameAttributeName)
                .oAuth2UserInfo(new GoogleOAuth2UserInfo(attributes))
                .build();
    }

    public static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        return OAuthAttributes.builder()
                .nameAttributeKey(userNameAttributeName)
                .oAuth2UserInfo(new NaverOAuth2UserInfo(attributes))
                .build();
    }

    public Member toEntity(SocialType socialType, OAuth2UserInfo oAuth2UserInfo) {

//        MonthDay monthDay = MonthDay.parse(oAuth2UserInfo.getBirthday(), DateTimeFormatter.ofPattern("MM-dd"));
//        Year year = Year.parse(oAuth2UserInfo.getYear());
//        LocalDate day = monthDay.atYear(year.getValue());

        return Member.builder()
                .socialType(socialType)
                .socialId(oAuth2UserInfo.getId())
                .name(oAuth2UserInfo.getNickname())
                .address(oAuth2UserInfo.getAddress())
                .email(UUID.randomUUID() + "@socialUser.com")
                .year(oAuth2UserInfo.getYear())
                .birthday(oAuth2UserInfo.getBirthday())
                .phone_number(oAuth2UserInfo.getPhone_Number())
                .role(Role.GUEST)
                .build();
    }
}
