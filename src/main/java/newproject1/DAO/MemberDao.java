package newproject1.DAO;

import java.util.HashMap;
import newproject1.Domain.Member;

public interface MemberDao {
  int insert(Member member);
  //int delete(int meno);
  
  int findemacount(String email);
  Member logindo(HashMap<String, Object> findva);
}
