package board.free;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;





public class FDelete_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		response.setContentType("text/html;charset=utf-8");			
		PrintWriter out=response.getWriter();
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	String page = request.getParameter("page");
	   	String pass = request.getParameter("password");
	   	
	   	BoardDAOImpl boarddao=new BoardDAOImpl();

	   	BoardBean board = boarddao.getBoardCont(num);	// 삭제시 비밀번호 유효성 검사 실행
	   	if(!board.getBoard_pass().equals(pass)){ 
	   		out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
	   		out.close();
	   		return null;
	   		
	   	}else{   	
	   	

	   		boarddao.boardDelete(num);
	   	}
	   	
	   	forward.setRedirect(true);
	   	forward.setPath("./FList.fr?page="+page);
	   	return forward;	   	
	   	
	 }
}