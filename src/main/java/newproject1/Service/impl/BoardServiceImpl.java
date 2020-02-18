package newproject1.Service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import newproject1.DAO.BoardDao;
import newproject1.Domain.Board;
import newproject1.Service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

  @Autowired BoardDao boardDao;
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
  public void insert(Board board) {
    
    boardDao.insert(board);
    
  }

  @Override
  public List<Board> list(int pageNO,int pageSize , int meno) {
  	Map<String, Object> params = new HashMap<>();
  	params.put("pageNo", pageNO);
  	params.put("pageSize", pageSize);
  	params.put("meno" , meno);
    return boardDao.list(params);
  }

	@Override
	public Board findbyno(int no) {
		
		return boardDao.findbyno(no);
	}
	
	@Override
	public int countbyno(int meno) {
		
		return boardDao.countbyno(meno);
	}
}
