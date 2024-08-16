package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.domain.Role;
import charter.charter_safe.dto.MemberDto;
import charter.charter_safe.repository.MemberRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDate;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ExtendWith(SpringExtension.class)
class MemberServiceImplTest {

    @Autowired MemberRepository memberRepository;
    @Autowired MemberService memberService;

    @Test
    public void 회원가입() throws Exception{
        //given
        MemberDto member = new MemberDto();
        Member.builder()
                .email("silver")
                .password("1234")
                .name("박세훈")
                .address("test")
                .phone_number("000")
                .birthday(LocalDate.now())
                .create_day(LocalDateTime.now())
                .role(Role.ADMIN)
                .build();

        //when
        String memberId = memberService.join(member);

        //then
        assertNotNull(memberId);
       }
}