package charter.charter_safe;

import charter.charter_safe.domain.Member;
import charter.charter_safe.repository.MemberRepository;
import charter.charter_safe.service.MemberService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import lombok.Builder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDateTime;

@SpringBootApplication
public class CharterSafeApplication {
	public static void main(String[] args) {
		SpringApplication.run(CharterSafeApplication.class, args);
	}
}
