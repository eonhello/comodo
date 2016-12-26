package db.board.fac;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAOImpl {
	
	private SqlSession getSession() {
		SqlSession session=null;
		Reader reader=null;
		try {
			reader = Resources.getResourceAsReader("./SqlMapConfig.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}	
	
	
	/* 게시판 저장 */
	public void boardInsert(BoardBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");
			
			System.out.println("name1="+board.getFac_board_name());
			System.out.println("email1="+board.getFac_board_email());
			System.out.println("subject1="+board.getFac_board_subject());
			System.out.println("content1="+board.getFac_board_content());
			System.out.println("file1="+board.getFac_board_filename());			
			
			result=session.insert("fac_board.board_insert", board);
			System.out.println("result="+result);
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}		
	}	
	
	/* 게시판 총 게시물 수 */
	public int getListCount() throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		count = ((Integer) session.selectOne("fac_board.board_count")).intValue();	
		 
		return count;
	}
	
	/* 게시물 목록 */
	public List<BoardBean> getBoardList(int  page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoardBean>  list = session.selectList("fac_board.board_list", page);
	    return list;
	}	

	/* 게시판 조회수 증가 */
	public void boardHit(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("fac_board.board_hit", board_num);
	}
	
	
	/* 게시판 글내용보기 */
	public BoardBean getBoardCont(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoardBean) session.selectOne("fac_board.board_cont", board_num);
	}	

	/* 게시물 수정 */
	public void boardEdit(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("fac_board.board_edit", board);
	}

	/* 게시물 삭제 */
	public void boardDelete(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("fac_board.board_del", board_num);
	}

	/* 답변글 레벨 증가 */
	public void refEdit(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("fac_board.board_Level", board);
	}

	/* 답변글 저장 */
	public void boardReplyOk(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.insert("fac_board.board_reply", board);
	}
	
}
