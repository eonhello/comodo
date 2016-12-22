package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

 public class QnA_DetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		QBoardDAOImpl boarddao=new QBoardDAOImpl();
//		BoardDAO boarddao=new BoardDAO();
	   	QBoardBean boarddata=new QBoardBean();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");

//		boarddao.setReadCountUpdate(num);		
//	   	boarddata=boarddao.getDetail(num);
		boarddao.boardHit(num); //조회수 증가
		boarddata=boarddao.getBoardCont(num);//내용보기
	   	
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	request.setAttribute("page", page);
	   
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("/C_Board/QnA/QBoard_View.jsp");
   		//forward.setPath("/C_Board/QnA/QBorad_List.jsp");
   		return forward;

	 }
}