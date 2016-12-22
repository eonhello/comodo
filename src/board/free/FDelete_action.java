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

	   	BoardBean board = boarddao.getBoardCont(num);	// ������ ��й�ȣ ��ȿ�� �˻� ����
	   	if(!board.getBoard_pass().equals(pass)){ 
	   		out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
	   		out.close();
	   		return null;
	   		
	   	}else{   	
	   	

	   		boarddao.boardDelete(num);
	   	}
	   	
	   	forward.setRedirect(true);
	   	forward.setPath("/free/FList.fr?page="+page);
	   	return forward;	   	
	   	
	 }
}