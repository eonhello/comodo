package db.board.sleep;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class BoardDAOImpl {
	//
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
	
	
	// 게시판 저장 
	public void boardInsert(BoardBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");
			
			System.out.println("게시글 번호 = "+board.getS_board_num());	//게시글 번호
			System.out.println("학번 = "+board.getS_haknum());	//학번
			System.out.println("이름 = "+board.getS_name());	//이름
			System.out.println("전공 = "+board.getS_major());	//전공
			System.out.println("제목 = "+board.getS_subject());	//제목
			System.out.println("외박 타입 = "+board.getS_sleep_type());	//외박 타입
			System.out.println("내용 = "+board.getS_content());	//내용
			System.out.println("시작 날짜 = "+board.getS_start_date());	//외박 시작날짜
			System.out.println("종료 날짜 = "+board.getS_end_date());	//외박 종료날짜
			System.out.println("게시 날짜 = "+board.getS_board_date());	//게시 날짜
			System.out.println("허용 여부 = "+board.getS_confirm());	//허용 여부
			System.out.println("허용 날짜 = "+board.getS_confirm_date());	//허용 날짜
			System.out.println("취소 여부 = "+board.getS_cancel());	//취소 여부
			
			result=session.insert("sleep_board.board_insert", board);
			System.out.println("result="+result);
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}		
	}	
	
	// 게시판 총 게시물 수 
	public int getListCount() throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		count = ((Integer) session.selectOne("sleep_board.board_count")).intValue();
		//System.out.println("count = "+count);
		 
		return count;
	}
	
	// 게시물 목록 
	public List<BoardBean> getBoardList(int  page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoardBean>  list = session.selectList("sleep_board.board_list", page);
	    return list;
	}	
	/*
	// 게시판 조회수 증가 
	public void boardHit(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("sleep_board.board_hit", board_num);
	}
	
	*/
	// 게시판 글내용보기 
	public BoardBean getBoardContent(int s_board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoardBean) session.selectOne("sleep_board.board_content", s_board_num);
	}	

	// 게시물 수정 
	public void boardEdit(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		System.out.println(board.getS_board_num());
		System.out.println(board.getS_subject());
		System.out.println(board.getS_content());
		session.update("sleep_board.board_edit", board);
	}
	
	//외박 승인
	public void boardConfirm(BoardBean board) throws SQLException{
		SqlSession session=null;
		session=getSession();
		System.out.println("승인 index = "+board.getS_board_num());
		session.update("sleep_board.board_confirm", board);
		//쿼리문 두번날릴수있으면 승인일시에 insert 해보자
	}
	//외박 불허
		public void boardDisapprove(BoardBean board) throws SQLException{
			SqlSession session=null;
			session=getSession();
			System.out.println("불허 index = "+board.getS_board_num());
			session.update("sleep_board.board_disapprove", board);
	}
		//취소통과
		public void boardCancel(BoardBean board) throws SQLException{
			SqlSession session=null;
			session=getSession();
			System.out.println("취소 index = "+board.getS_board_num());
			session.update("sleep_board.board_cancel", board);
	}
	// 게시물 삭제 
	public void boardDelete(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("board.board_del", board_num);
	}
	/*
	// 답변글 레벨 증가 
	public void refEdit(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("board.board_Level", board);
	}

	// 답변글 저장 
	public void boardReplyOk(BoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.insert("board_reply", board);
	}	*/
//	public boolean isBoardWriter(int num, String compareToPassword) throws SQLException{
//		
//		BoardBean board=null;
//		SqlSession session=null;
//		session = getSession();
//		board = (BoardBean) session.selectOne("sleep_board.board_modify_pass");
//		//System.out.println("count = "+count);
//		System.out.println(board.getS_password());
//		if(compareToPassword.equals(board.getS_password())){
//			return true;
//		} else {
//			return false;
//		}
//	}
}
