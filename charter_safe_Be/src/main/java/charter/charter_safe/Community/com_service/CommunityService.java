package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_dto.CommunityDto;
import charter.charter_safe.Community.com_dto.ImageDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommunityService {
    Long writeCommunity(CommunityDto dto, ImageDto imageDto, String email);
    Long updateCommunity(Long post_id, CommunityDto dto);
    List<CommunityDto> findAll();
    Long removeCommunity(Long post_id);
    CommunityDto findCommunity(Long post_id);
}
