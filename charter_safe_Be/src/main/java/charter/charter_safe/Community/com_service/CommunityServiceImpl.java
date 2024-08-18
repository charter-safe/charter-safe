package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import charter.charter_safe.Community.com_repo.CommunityRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{

    private final CommunityRepository communityRepository;
    private final MemberRepository memberRepository;

    @Override
    public Long saveCom(CommunityWriteRequestDto communityWriteRequestDto, String email) {
        Member member = memberRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("회원이 존재하지 않습니다."));
        Community result = Community.builder()
                .title(communityWriteRequestDto.getTitle())
                .content(communityWriteRequestDto.getContent())
                .member(member)
                .build();
        communityRepository.save(result);

        return result.getPost_id();
    }
}
