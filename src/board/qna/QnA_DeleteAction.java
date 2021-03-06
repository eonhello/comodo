package board.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_DeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		response.setContentType("text/html;charset=utf-8");			
		PrintWriter out=response.getWriter();//출력 스트림 객체생성
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
//	   	boolean result=false;
//	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	String page = request.getParameter("page");
	   	String pass = request.getParameter("BOARD_PASS");
	   	
	   	QBoardDAOImpl boarddao=new QBoardDAOImpl();
//	   	BoardDAO1 boarddao=new BoardDAO1();	   	
//	   	usercheck=boarddao.isBoardWriter(num, pass);//	   	
//	   	if(usercheck==false){
//	   		response.setContentType("text/html;charset=utf-8");
//	   		PrintWriter out=response.getWriter();
//	   		out.println("<script>");
//	   		out.println("alert('삭제할 권한이 없습니다.');");
////	   		out.println("location.href='./BoardList.bo';");
//	   		out.println("history.go(-1)");
//	   		out.println("</script>");
//	   		out.close();
//	   		return null;
//	   	}
	   	
	   	QBoardBean board = boarddao.getBoardCont(num);
 	
	   	
//	   	    result=boarddao.boardDelete(num);
	   		boarddao.boardDelete(num);

	   	
//	   	if(result==false){
//	   		System.out.println("게시판 삭제 실패");
//	   		return null;
//	   	}
	   	
//	   	System.out.println("게시판 삭제 성공");
//	   	System.out.println("page="+page);
	   	
	   	forward.setRedirect(true);
	   	forward.setPath("./QnA_List.qa?page="+page);
	   	return forward;	   	
	   	
	 }
}