package newproject1.DAO;

import java.util.List;
import java.util.Map;

import newproject1.Domain.Board;

public interface BoardDao {
  int insert(Board board);
  //int delete(int meno);
  List<Board> list(Map<String, Object> params);
  Board findbyno(int no);
  int countbyno(int meno);
}
