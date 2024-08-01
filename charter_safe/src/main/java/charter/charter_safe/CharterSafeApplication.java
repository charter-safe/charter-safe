package charter.charter_safe;

import charter.charter_safe.domain.Member;
import jakarta.persistence.EntityManager;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CharterSafeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharterSafeApplication.class, args);
	}

}
