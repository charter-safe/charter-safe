package charter.charter_safe.Community.com_dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class ImageDto {

    private List<MultipartFile> files;
}
