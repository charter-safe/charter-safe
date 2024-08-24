package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import charter.charter_safe.Community.com_repo.CommunityRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{

    private final CommunityRepository communityRepository;

    @Override
    @Transactional
    public Long save(final CommunityWriteRequestDto dto) {
        Community community = dto.toEntity();
        communityRepository.save(community);
        return community.getPost_id();
    }
}
