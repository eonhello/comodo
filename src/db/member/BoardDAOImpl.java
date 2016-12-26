package db.member;

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
	
	// 회원가입 저장
	
	public void joinInsert(MemberBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("회원가입 저장 시도");

			result=session.insert("join_board.join_insert", board);
			System.out.println("성공결과result="+result);
		}catch(Exception e){
			System.out.println("실패결과result="+result);
			System.out.println(e.getMessage());
		}		
	}
	
	// 회원정보보기 
	public MemberBean getMemContent(int haknum) throws SQLException {
		SqlSession session=null;
		session = getSession();
		System.out.println("데이터베이스에서 기존 회원정보를 가져오기위한 접속 성공!");
		return (MemberBean) session.selectOne("join_board.join_content", haknum);
	}	
	
	// 회원정보 수정 
	public void boardEdit(MemberBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();
/*		System.out.println(board.getS_board_num());
		System.out.println(board.getS_subject());
		System.out.println(board.getS_content());*/
		session.update("join_board.member_edit", board);
	}
	
	// 로그인 정보 가져오기
	public MemberBean getLoginInformation(int haknum) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (MemberBean) session.selectOne("join_board.login_inform", haknum);
	}
	
	
	// 게시판 저장 
	public void boardInsert(MemberBean board) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");

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
	public List<MemberBean> getBoardList(int  page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<MemberBean>  list = session.selectList("sleep_board.board_list", page);
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
	public MemberBean getBoardContent(int s_board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (MemberBean) session.selectOne("sleep_board.board_content", s_board_num);
	}	
	
	//외박 승인
	public void boardConfirm(MemberBean board) throws SQLException{
		SqlSession session=null;
		session=getSession();
/*		System.out.println("승인 index = "+board.getS_board_num());*/
		session.update("sleep_board.board_confirm", board);
		//쿼리문 두번날릴수있으면 승인일시에 insert 해보자
	}
	//외박 불허
		public void boardDisapprove(MemberBean board) throws SQLException{
			SqlSession session=null;
			session=getSession();
	/*		System.out.println("불허 index = "+board.getS_board_num());*/
			session.update("sleep_board.board_disapprove", board);
	}
		//취소통과
		public void boardCancel(MemberBean board) throws SQLException{
			SqlSession session=null;
			session=getSession();
/*			System.out.println("취소 index = "+board.getS_board_num());*/
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
