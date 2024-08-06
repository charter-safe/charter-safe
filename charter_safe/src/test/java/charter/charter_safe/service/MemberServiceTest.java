package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.dto.MemberDto;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@ExtendWith(SpringExtension.class)
class MemberServiceTest {

    @Autowired MemberService memberService;
    @Autowired PasswordEncoder passwordEncoder;

    public Member createMember() {
        MemberDto member = new MemberDto();
        member.setEmail("test@naver");
        member.setPassword("1234");
        member.setName("dsf");
        member.setAddress("1234");
        member.setPhone_number("123");
        member.setCreate_day(LocalDateTime.now());
        member.setBirthday(Date.from(Instant.now()));
        return Member.createMember(member, passwordEncoder);
    }

    @Test
    public void 회원가입() throws Exception{
        Member member1 = createMember();
        Member saveMember = memberService.join(member1);
        assertEquals(member1.getEmail(), saveMember.getEmail());
        assertEquals(member1.getPassword(), saveMember.getPassword());
        assertEquals(member1.getName(), saveMember.getName());
        assertEquals(member1.getAddress(), saveMember.getAddress());
        assertEquals(member1.getPhone_number(), saveMember.getPhone_number());
        assertEquals(member1.getCreate_day(), saveMember.getCreate_day());
        assertEquals(member1.getBirthday(), saveMember.getBirthday());
    }
}