package board.fac;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import net.board.db.BoardDAO1;
import db.board.fac.BoardBean;
import db.board.fac.BoardDAOImpl;

public class BoardReplyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
//			BoardDAO1 boarddao=new BoardDAO1();
		 	BoardDAOImpl boarddao=new BoardDAOImpl();
	   		BoardBean boarddata=new BoardBean();
	   		
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
	   		forward.setPath("./C_Board/Fac/fac_board_reply.jsp");
	   		return forward;
	}
}