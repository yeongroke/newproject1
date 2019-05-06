package newproject1.Service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import newproject1.DAO.BoardDao;
import newproject1.DAO.MemberDao;
import newproject1.Domain.Board;
import newproject1.Domain.Member;
import newproject1.Service.BoardService;
import newproject1.Service.MemberService;

@Service
public class BoardServiceImpl implements BoardService{

  @Autowired BoardDao boardDao;
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
  public void insert(Board board) {
    
    boardDao.insert(board);
    
  }

  @Override
  public List<Board> list() {
    
    return boardDao.list();
  }
}
