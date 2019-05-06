package newproject1.Service.impl;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import newproject1.DAO.MemberDao;
import newproject1.Domain.Member;
import newproject1.Service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

  @Autowired MemberDao memberDao;
  
  @Override
  public void insert(Member member) {
    
    member.setStat("N");
    
    memberDao.insert(member);
  }

  @Override
  public int findemacount(String email) {
    
    return memberDao.findemacount(email);
  }

  @Override
  public Member logindo(String email, String pwd) {
    System.out.println("serviceimpl");
    HashMap<String, Object> findva = new HashMap<>();
    
    findva.put("email", email);
    findva.put("pwd", pwd);
    return memberDao.logindo(findva);
  }
}
