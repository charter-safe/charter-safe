package charter.charter_safe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
<<<<<<< HEAD
=======
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
>>>>>>> d28c33569dcd568fdbff45acfaa1bcd0146fe6c9


@SpringBootApplication
@EnableJpaAuditing
public class CharterSafeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharterSafeApplication.class, args);
<<<<<<< HEAD

=======
>>>>>>> d28c33569dcd568fdbff45acfaa1bcd0146fe6c9
	}
}
