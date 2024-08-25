package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_repo.CommunityRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{

    private final CommunityRepository communityRepository;
    private final MemberRepository memberRepository;
    @Override
    @Transactional
    public Long save(final CommunityDto dto, String email) {
        Member member = memberRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("이메일이 존재x"));
        Community result = Community.builder()
                .title(dto.getTitle())
                .content(dto.getContent())
                .likes(0)
                .views(0)
                .author(member.getName())
                .member(member)
                .build();
        communityRepository.save(result);

        return result.getPost_id();
    }
    @Override
    @Transactional
    public Long update(Long post_id, CommunityDto dto) {
        Community community = communityRepository.findById(post_id).orElseThrow(() -> new RuntimeException("게시글을 찾을 수 없습니다."));
        community.update(dto.getTitle(), dto.getContent());
        return post_id;
    }

//    @Override
//    @Transactional
//    public Community communityDetail(Long post_id, CommunityDto dto) {
//        Community community = communityRepository.findById(post_id).orElseThrow(()
//                -> new IllegalArgumentException("존재하지 않는 게시글입니다."));
//        Community result = dto.toEntity();
//
//        return result;
//    }

    @Override
    @Transactional
    public List<CommunityDto> findAll() {
        Sort sort = Sort.by(Sort.Direction.DESC, "post_id", "post_create_date");
        List<Community> communities = communityRepository.findAll(sort);
        return communities.stream().map(CommunityDto::new).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public Long remove(Long post_id) {
        Community community = communityRepository.findById(post_id).orElseThrow(()
                -> new IllegalArgumentException("삭제할 수 있는 권한이 없습니다."));
        communityRepository.delete(community);
        return post_id;
    }

//    @Override
//    @Transactional
//    public void remove(Long post_id) {
//        Community community = communityRepository.findById(post_id).orElseThrow(()
//                -> new IllegalArgumentException("존재하지 않는 게시글입니다."));
//        communityRepository.delete(community);
//    }
}
