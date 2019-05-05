package newproject1.Service.impl;

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
    
    memberDao.insert(member);
    
  }
}
