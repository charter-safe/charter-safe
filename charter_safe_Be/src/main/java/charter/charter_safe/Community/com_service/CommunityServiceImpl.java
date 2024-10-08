package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_domain.Image;
import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_repo.CommunityRepository;
import charter.charter_safe.Community.com_repo.ImageRepository;
import charter.charter_safe.Member.domain.Member;
import charter.charter_safe.Member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{

    private final CommunityRepository communityRepository;
    private final MemberRepository memberRepository;
    private final ImageRepository imageRepository;

    @Value("${file.ImagePath}")
    private String imageDir;

    @Override
    @Transactional
    public Long writeCommunity(final CommunityDto dto, MultipartFile files, String email) throws IOException{
        Member member = memberRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("이메일이 존재하지 않습니다."));
        Community result = Community.builder()
                .title(dto.getTitle())
                .content(dto.getContent())
                .likes(0)
                .views(0)
                .author(member.getName())
                .member(member)
                .build();
        communityRepository.save(result);

        if (files.isEmpty()) {return null;}
        String origin_name = files.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String extension = origin_name.substring(origin_name.lastIndexOf("."));
        String save_name = uuid + extension;
        String save_path = imageDir + save_name;

        Image image = Image.builder()
                .origin_name(origin_name)
                .save_name(save_name)
                .url(save_path)
                .community(result)
                .build();
        files.transferTo(new File(save_path));
        imageRepository.save(image);

        return result.getPost_id();
    }

    @Override
    @Transactional
    public Long updateCommunity(Long post_id, CommunityDto dto) {
        Community community = communityRepository.findById(post_id).orElseThrow(() -> new RuntimeException("게시글을 찾을 수 없습니다."));
        community.update(dto.getTitle(), dto.getContent());
        return post_id;
    }

    @Override
    @Transactional
    public List<CommunityDto> findAll() {
        List<Community> communities = communityRepository.findAll();
        return communities.stream().map(CommunityDto::new).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public CommunityDto findCommunity(Long post_id) {
        Community community = communityRepository.findById(post_id).orElseThrow(()
                -> new IllegalArgumentException("게시글이 존재하지 않습니다."));
        community.increaseViews();
        return new CommunityDto(community);
    }

    @Override
    @Transactional
    public Long removeCommunity(Long post_id) {
        Community community = communityRepository.findById(post_id).orElseThrow(()
                -> new IllegalArgumentException("게시글이 존재하지 않습니다."));
        communityRepository.delete(community);
        return post_id;
    }
}
