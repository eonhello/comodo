package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_ReplyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
//			BoardDAO1 boarddao=new BoardDAO1();
		 	QBoardDAOImpl boarddao=new QBoardDAOImpl();
	   		QBoardBean boarddata=new QBoardBean();
	   		
	   		int num=Integer.parseInt(request.getParameter("num"));
	   		String page = request.getParameter("page");
	   		
//	   		boarddata=boarddao.getDetail(num);
	   		boarddata=boarddao.getBoardCont(num);
	   		
	   		if(boarddata==null){
	   			System.out.println("답장 페이지 이동 실패");
	   			return null;
	   		}
	   		System.out.println("답장 페이지 이동 완료");
	   		
	   		request.setAttribute("boarddata", boarddata);
	   		request.setAttribute("page", page);
	   		
	   		forward.setRedirect(false);
	   		forward.setPath("../C_Board/QnA/QBoard_Reply.jsp");
	   		return forward;
	}
}