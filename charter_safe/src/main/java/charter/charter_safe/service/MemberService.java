package charter.charter_safe.service;

import charter.charter_safe.authority.TokenInfo;
import charter.charter_safe.dto.LoginDto;
import charter.charter_safe.dto.MemberDto;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;

public interface MemberService {
    String join(MemberDto memberDto);
    TokenInfo login(LoginDto loginDto);
}
