package newproject1.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import newproject1.Domain.Board;
import newproject1.Domain.Member;
import newproject1.Domain.Paging;
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
  
  @RequestMapping("kakaologin")
  public void kakaologin() {
  	
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
  public void board(Model model , HttpSession session
  		, @RequestParam(required = false , defaultValue = "1") int pageNo
  		, @RequestParam(required = false , defaultValue = "10") int pageSize) {

  	Member loginuser = (Member)session.getAttribute("loginuser");
  	int meno =loginuser.getNo();
  	Paging paging = new Paging();
  	paging.setPageNo(pageNo);
  	paging.setPageSize(pageSize);
  	paging.setTotalCount(boardService.countbyno(meno));
  	
  	
    List<Board> boardlist = boardService.list(pageNo , pageSize , meno);
    session.setAttribute("loginuser", loginuser);
    model.addAttribute("boardlist", boardlist);
    model.addAttribute("paging",paging);
  }
  
  @RequestMapping("board.do")
  public @ResponseBody List<Board> boarddo(
  		@RequestParam(required = false , defaultValue = "10") int pageSize,
  		int pageNo , int meno){

  	Paging paging = new Paging();
  	paging.setPageNo(pageNo);
  	paging.setPageSize(pageSize);
  	paging.setTotalCount(boardService.countbyno(meno));
  	
  	
    List<Board> boardlist = boardService.list(pageNo , pageSize , meno);
    
    Map<String, Object> map = new HashMap<>();
    
    map.put("boardlist", boardlist);
    map.put("paging", paging);
    
    return boardlist;
  }
  
  @RequestMapping("detailbo")
  public void detailbo(int no , Model model) {
  	Board board = boardService.findbyno(no);
  	
  	model.addAttribute("board", board);
  }
  
  @RequestMapping("login")
  public void login(String email, String pwd,HttpSession session) {
    
  }
  @PostMapping(value="login.do")
  public @ResponseBody String logindo(String email, String pwd, HttpSession session , HttpServletResponse response) {
    
  	Cookie cookie = new Cookie("email", email);
  	cookie.setMaxAge(60 * 60 * 24 * 30);
  	response.addCookie(cookie);
  	
    Member loginuser = memberService.logindo(email, pwd);
    if(loginuser != null) {
      session.setAttribute("loginuser", loginuser);
      session.setMaxInactiveInterval(30*60);
      return "1";
    }else {
      session.invalidate();
      return "0";
    }
  }
  
	
	/*
	 * @GetMapping("logout") public String logout(HttpSession session) {
	 * session.removeAttribute("loginUser"); System.out.println("log out!"); return
	 * "redirect:../mainpage/mainpage"; }
	 */
	 
  
  @RequestMapping("main")
  public void main(Model model , HttpSession session) {
  	Member loginuser = (Member)session.getAttribute("loginuser");
  	session.setAttribute("loginuser", loginuser);
  }
  
  @RequestMapping(value = "findemacount" , method = RequestMethod.POST)
  public @ResponseBody int findemacount(String email) {
  	int answer = memberService.findemacount(email);
    return answer;
  }
  
  @RequestMapping("addboard")
  public void addboard(Model model , HttpSession session) {
  	Member loginuser = (Member)session.getAttribute("loginuser");
  	session.setAttribute("loginuser", loginuser);
  }
  
  @RequestMapping(value="addboard.do", method = RequestMethod.POST)
  public @ResponseBody void addboardo(String title , String note , HttpSession session) {
  	Member loginuser = (Member)session.getAttribute("loginuser");
  	session.setAttribute("loginuser", loginuser);
  	
  	Board board = new Board();
  	board.setTitle(title);
  	board.setNote(note);
  	board.setMeno(1);
  	boardService.insert(board);
  }
}
