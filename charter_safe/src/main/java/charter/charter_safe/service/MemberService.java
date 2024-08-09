package charter.charter_safe.service;

import charter.charter_safe.authority.TokenInfo;
import charter.charter_safe.dto.LoginDto;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.response.MemberInfoResponse;

public interface MemberService {
    String join(MemberDto memberDto);
    TokenInfo login(LoginDto loginDto);
    MemberInfoResponse memberInfo(Long id);
}
