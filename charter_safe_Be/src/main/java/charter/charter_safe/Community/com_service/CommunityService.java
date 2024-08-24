package charter.charter_safe.Community.com_service;

import charter.charter_safe.Community.com_dto.CommunityWriteRequestDto;
import org.springframework.stereotype.Service;

@Service
public interface CommunityService {
    Long save(CommunityWriteRequestDto dto);
}
