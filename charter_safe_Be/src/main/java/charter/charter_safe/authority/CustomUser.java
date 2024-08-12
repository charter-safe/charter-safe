package charter.charter_safe.authority;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CustomUser extends User {

    private Long userId;
    private String email;
    private String password;
    private Collection<GrantedAuthority> authorities;

    public CustomUser(Long userId, String email, String password, Collection<? extends GrantedAuthority> authorities) {
        super(email, password, authorities);
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public String getEmail() {return email;}
}
