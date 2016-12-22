package board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;




public class FModify_view implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("utf-8");
	   		
		 	BoardDAOImpl boarddao=new BoardDAOImpl();
		   	BoardBean boarddata=new BoardBean();
		   	
			int num=Integer.parseInt(request.getParameter("num"));
			String page = request.getParameter("page");
			boarddata=boarddao.getBoardCont(num);
			
		   	if(boarddata==null){
		   		System.out.println("받을 데이터가 없습니다.");
		   		return null;
		   	}
		   	System.out.println("수정할 데이터 불러왔어요");
		   	
		   	request.setAttribute("boarddata", boarddata);
		    request.setAttribute("page", page);
		   	forward.setRedirect(false);
	   		forward.setPath("../C_Board/Free/FBoard_Update.jsp");
	   		return forward;
	 }
}