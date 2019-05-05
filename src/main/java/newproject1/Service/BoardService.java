package newproject1.Service;

import java.util.List;
import newproject1.Domain.Board;

public interface BoardService {
  void insert(Board board);
  List<Board> list();
}
