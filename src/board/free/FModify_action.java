package board.free;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;


 public class FModify_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 response.setContentType("text/html;charset=utf-8");	
		 request.setCharacterEncoding("utf-8");
		 PrintWriter out=response.getWriter();
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 String page = request.getParameter("page");
		 String pass = request.getParameter("password");
		
		 BoardDAOImpl boarddao=new BoardDAOImpl();

		 BoardBean boarddata=new BoardBean();
		 
		 BoardBean board = boarddao.getBoardCont(num); // 수정시 비밀번호 유효성 검사 실행
		   	if(!board.getBoard_pass().equals(pass)){ 
		   		out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
		   		out.close();
		   		return null;
		   	}
		 
		 try{
			 boarddata.setBoard_num(num);
			 boarddata.setBoard_subject(request.getParameter("subject"));
			 boarddata.setBoard_content(request.getParameter("content"));
			 

			 boarddao.boardEdit(boarddata);

		   	 System.out.println("수정페이지 접속 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("/free/FDetail_action.fr?num="+boarddata.getBoard_num()+"&page="+page);
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}