package db.board.free;

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
	
	
	/* 게시글 입력 */
	public void boardInsert(BoardBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("데이터 베이스 접속 성공 데이터 가져와야함");
			
/*			System.out.println("name1="+board.getFboard_name());
			System.out.println("pass1="+board.getFboard_pass());
			System.out.println("subject1="+board.getFboard_title());
			System.out.println("content1="+board.getFboard_content());
			System.out.println("file1="+board.getFboard_file());*/			
			
			result=session.insert("board.board_insert", board);
			System.out.println("result="+result);
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}		
	}	
	
	/* 게시?��?�� 게시�? ?�� 조회 */
	public int getListCount() throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		count = ((Integer) session.selectOne("board.board_count")).intValue();	
		 
		return count;
	}
	
	/* 게시글 목록 불러오기 */
	public List<BoardBean> getBoardList(int page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoardBean>  list = session.selectList("board.board_list", page);
	    return list;
	}	

	/* 게시글 조회수 증가 */
	public void boardHit(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("board.board_hit", board_num);
	}
	
	
	/* 게시판 내용 보기 */
	public BoardBean getBoardCont(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoardBean) session.selectOne("board.board_cont", board_num);
	}	

	/* 게시?�� ?��?�� ?��?��?���?*/
	public void boardEdit(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("board.board_edit", board);
	}

	/* 게시?�� ?��?��?���? */
	public void boardDelete(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("board.board_del", board_num);
	}
	
	/* ?���? �??���? */
	public void replyInsert(CommentBean comment) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("답변글을 달기 위한 쿼리 문입니다.");
			result=session.insert("comment.comment_insert", comment);
			System.out.println("result="+result);
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}		
	}
	
	/* ?���?�? 목록 불러?���? */
	public List<CommentBean> getReplylist(int num)	throws SQLException {
		SqlSession session=null;
		session = getSession();		
		List<CommentBean> list = session.selectList("comment.comment_list", num);
	    return list;
	}	

	/* �??��?���? 쿼리�? ?��리기 */
	public List<BoardBean> getSearchList(int page, String keyword, String keyField)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		Map M = new HashMap();
		M.put("page", page);
		M.put("keyword", '%'+keyword+'%');
		M.put("keyField", keyField);
		List<BoardBean>  list = session.selectList("board.search_list", M);
	    return list;
	}
	
	public int getSearchCount(String keyword, String keyField) throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		Map M = new HashMap();
		M.put("keyword", '%'+keyword+'%');
		M.put("keyField", keyField);
		System.out.println("입력한 키워드입니다. : "+M.get(keyword));
		System.out.println("선택한 카테고리입니다. : "+M.get(keyField));
		count = ((Integer) session.selectOne("board.search_count", M)).intValue();	
		 
		return count;
	}

	/* ?���??�?? ???�� */
	public void boardReplyOk(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.insert("board_reply", board);
	}
	
}
