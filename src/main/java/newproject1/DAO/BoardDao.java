package newproject1.DAO;

import java.util.List;
import newproject1.Domain.Board;

public interface BoardDao {
  int insert(Board board);
  //int delete(int meno);
  List<Board> list();
}
