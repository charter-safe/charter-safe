package charter.charter_safe.Member.service;

import charter.charter_safe.Member.authority.TokenInfo;
import charter.charter_safe.Member.dto.LoginDto;
import charter.charter_safe.Member.dto.MemberDto;
import charter.charter_safe.Member.response.MemberInfoResponse;

public interface MemberService {
    String join(MemberDto memberDto);
    TokenInfo login(LoginDto loginDto);
    MemberInfoResponse memberInfo(Long id);
}
