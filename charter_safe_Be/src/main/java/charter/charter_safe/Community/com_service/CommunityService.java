package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_dto.CommunityDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public interface CommunityService {
    Long writeCommunity(CommunityDto dto, MultipartFile files, String email) throws IOException;
    Long updateCommunity(Long post_id, CommunityDto dto);
    List<CommunityDto> findAll();
    Long removeCommunity(Long post_id);
    CommunityDto findCommunity(Long post_id);
}
