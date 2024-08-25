package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_domain.Community;
import charter.charter_safe.Community.com_dto.CommunityDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommunityService {
//    Long save(CommunityDto dto);
    Long save(CommunityDto dto, String email);
    Long update(Long post_id, CommunityDto dto);
    List<CommunityDto> findAll();
    Long remove(Long post_id);
   // Community communityDetail(Long post_id, CommunityDto dto);
}
