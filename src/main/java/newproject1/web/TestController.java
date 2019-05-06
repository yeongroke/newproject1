package newproject1.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
  
  @RequestMapping(value = "join")
  public void join(Member member) {
    
  }
  
  @RequestMapping(value = "join.do")
  public String joindo(Member member) {
    
    memberService.insert(member);
    return"redirect:../member/main";
  }
  
  @RequestMapping("board")
  public void board(Model model) {
    
    List<Board> boardlist = boardService.list();
    
    model.addAttribute("boardlist", boardlist);
    
  }
  
  @RequestMapping("login")
  public void login(String email, String pwd,HttpSession session) {
    
  }
  @RequestMapping(value="login.do", method = RequestMethod.POST)
  public @ResponseBody int logindo(String email, String pwd, HttpSession session) {
    System.out.println("controller service 호출 전");
    int yn = 0;
    
    Member loginuser = memberService.logindo(email, pwd);
    if(loginuser != null) {
      System.out.println(loginuser.getName());
      session.setAttribute("loginuser", loginuser);
      yn = 1;
    }else {
      session.invalidate();
      yn = 0;
    }
    System.out.println("controller service 호출 후");
    return yn;
  }
  
  @RequestMapping("main")
  public void main(Model model) {
    
  }
  
  @RequestMapping(value = "findemacount" , method = RequestMethod.POST)
  public @ResponseBody int findemacount(String email) {
    return memberService.findemacount(email);
  }
}
