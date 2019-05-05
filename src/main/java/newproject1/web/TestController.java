package newproject1.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import newproject1.Domain.Board;
import newproject1.Domain.Member;
import newproject1.Service.BoardService;
import newproject1.Service.MemberService;

@Controller
@RequestMapping("/member")
public class TestController {
  
  MemberService memberService;
  BoardService boardService;
  ServletContext sc;
  
  public TestController(MemberService memberService, ServletContext sc
      ,BoardService boardService) {
    this.memberService = memberService;
    this.boardService = boardService;
    this.sc = sc;
  }
  
  @RequestMapping("join")
  public void join(Member member) {
    System.out.println("join 호출됨");
    member.setName("t3");
    member.setAge(11);
    member.setBas_addr("경기도");
    member.setDet_addr("성남시");
    member.setEmail("test4@test.com");
    member.setPhone("010-1234-1234");
    member.setPwd("1111");
    
    memberService.insert(member);
  }
  
  @RequestMapping("board")
  public void board(Model model) {
    
    List<Board> boardlist = boardService.list();
    
    model.addAttribute("boardlist", boardlist);
    
  }
}
