package newproject1.Service;

import newproject1.Domain.Member;

public interface MemberService {
  void insert(Member member);
  
  int findemacount(String email);
  
  Member logindo(String email, String pwd);
  
  //Member getbyno(int no);
  Member kakaologin(String accessToken);
}
