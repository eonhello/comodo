package board.free;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;




 public class FDetail_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		BoardDAOImpl boarddao=new BoardDAOImpl();
	   	BoardBean boarddata=new BoardBean();
	   	List replylist=new ArrayList(); 		// 댓글들을 담기 위한 리스트 생성
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");		

		boarddao.boardHit(num); //조회수 증가
		boarddata=boarddao.getBoardCont(num);//내용보기	
		replylist = boarddao.getReplylist(num);		// 부모글 번호가 같은 댓글들을 담아준다.
		
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	request.setAttribute("page", page);
	   	request.setAttribute("replydlist", replylist); // 댓글 불러오기
	   	
	   	
	   	System.out.println("조회수검색입니다 : "+boarddata.getBoard_readcount());
	   	System.out.println("작성날짜입니다 : "+boarddata.getBoard_date());
	   
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("../C_Board/Free/FBoard_View.jsp");
   		return forward;

	 }
}