package charter.charter_safe.Member.service;

import charter.charter_safe.Member.authority.CustomUser;
import charter.charter_safe.Member.repository.MemberRepository;
import charter.charter_safe.Member.domain.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CustomUserDetailService implements UserDetailsService {

    private final MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Member member = memberRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다."));

        return createUserDetails(member);
    }

    private UserDetails createUserDetails(Member member) {
        List<SimpleGrantedAuthority> authorities = member.getMemberRoles().stream()
                .map(role -> new SimpleGrantedAuthority("ROLE_" + role.getRole()))
                .toList();
        return new CustomUser(member.getId(), member.getEmail(), member.getPassword(), authorities);
    }
}
