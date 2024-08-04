package charter.charter_safe.service;

import charter.charter_safe.domain.Member;
import charter.charter_safe.repository.MemberRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@Transactional
public class MemberServiceTest {

    @Autowired MemberService memberService;
    @Autowired MemberRepository memberRepository;

    @Test
    public void 회원가입() throws Exception{
        //given
        Member member = new Member();
        member.createMemberInfo("silver00", "1234", "박세훈", "silver00", "01098588621", LocalDateTime.now(), LocalDateTime.now());

        //when
        Long saveId = memberService.join(member);

        //then
        Assertions.assertEquals(member, memberRepository.findOne(saveId));
    }

}