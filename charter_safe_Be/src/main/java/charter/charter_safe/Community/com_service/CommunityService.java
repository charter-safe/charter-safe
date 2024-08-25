package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommunityService {
//    Long save(CommunityWriteRequestDto dto);
    Long save(CommunityWriteRequestDto dto, String email);
    Long update(Long post_id, CommunityWriteRequestDto dto);
    List<CommunityWriteRequestDto> findAll();
}
