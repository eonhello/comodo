package db.board.qna;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class QBoardDAOImpl {
	
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
	public void boardInsert(QBoardBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");
			//System.out.println("name1="+board.getQboard_name());
			System.out.println("pass1="+board.getQ_pass());
			System.out.println("subject1="+board.getQ_subject());
			System.out.println("content1="+board.getQ_content());
			System.out.println("file1="+board.getQ_file());	
			
			result=session.insert("Qboard.Qboard_insert", board);
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
		count = ((Integer) session.selectOne("Qboard.Qboard_count")).intValue();	
		 
		return count;
	}
	
	/* 게시물 목록 */
	public List<QBoardBean> getBoardList(int  page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<QBoardBean>  list = session.selectList("Qboard.Qboard_list", page);
	    return list;
	}	

	/* 게시판 조회수 증가 */
	public void boardHit(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("Qboard.Qboard_hit", board_num);
	}
	
	
	/* 게시판 글내용보기 */
	public QBoardBean getBoardCont(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (QBoardBean) session.selectOne("Qboard.Qboard_cont", board_num);
	}	
	
	/* 게시물 삭제 */
	public void boardDelete(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("Qboard.Qboard_del", board_num);
	}
	
	/* 게시물 수정 */
	public void boardEdit(QBoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("Qboard.Qboard_edit", board);
	}

	/* 답변글 레벨 증가 */
	public void refEdit(QBoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("Qboard.Qboard_Level", board);
	}

	/* 답변글 저장 */
	public void boardReplyOk(QBoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.insert("Qboard_reply", board);
	}
	
	
	
	
	/*===============================*/
	/*===============================*/
	/*============  검   색  ============*/
	/*===============================*/
	/*===============================*/
	
	/* 게시판 총 게시물 수 */
	public int getSearchListCount(String search,String find_field) throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		QBoardBean b = new QBoardBean();
		b.setSearch("%"+search+"%");
		b.setFind_field(find_field);
		count = ((Integer) session.selectOne("Qboard.Qboard_Search_count",b)).intValue();	
		 
		return count;
	}
	
	/* 게시물 목록 */
	public List<QBoardBean> getSearchBoardList(int  page,String search,String find_field)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		
		QBoardBean b = new QBoardBean();
		b.setSearch("%"+search+"%");
		b.setPage(page);
		b.setFind_field(find_field);
		List<QBoardBean>  list = session.selectList("Qboard.Qboard_Search_list",b);
	    return list;
	}	
}
