package charter.charter_safe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class CharterSafeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharterSafeApplication.class, args);

	}
}
