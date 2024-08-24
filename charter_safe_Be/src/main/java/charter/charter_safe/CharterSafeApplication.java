package charter.charter_safe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;


@SpringBootApplication
@EnableJpaAuditing
public class CharterSafeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharterSafeApplication.class, args);
	}
}
