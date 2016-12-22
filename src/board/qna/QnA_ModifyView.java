package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_ModifyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("utf-8");
	   		
		 	QBoardDAOImpl boarddao=new QBoardDAOImpl();
//			BoardDAO boarddao=new BoardDAO();
		   	QBoardBean boarddata=new QBoardBean();
		   	
			int num=Integer.parseInt(request.getParameter("num"));
			String page = request.getParameter("page");
//		   	boarddata=boarddao.getDetail(num);
			boarddata=boarddao.getBoardCont(num);//글 내용 
			
		   	if(boarddata==null){
		   		System.out.println("(수정)상세보기 실패");
		   		return null;
		   	}
		   	System.out.println("(수정)상세보기 성공");
		   	
		   	request.setAttribute("boarddata", boarddata);
		    request.setAttribute("page", page);
		   	forward.setRedirect(false);
	   		forward.setPath("../C_Board/QnA/QBoard_Modify.jsp");
	   		return forward;
	 }
}