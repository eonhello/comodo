package board.sleep;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import db.board.sleep.BoardBean;
import db.board.sleep.BoardDAOImpl;

 public class Sleep_Disapprove_Action {
	 public void AjaxOut(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("utf-8");
		 
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("num"));
		 String page = request.getParameter("page");
		 //String pass = request.getParameter("S_BOARD_PASSWORD");
		 System.out.println(num);
		
		 BoardDAOImpl boarddao=new BoardDAOImpl();
//		 BoardDAO boarddao=new BoardDAO();
		 BoardBean boarddata=new BoardBean();
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out=response.getWriter();
		 // 비밀번호 일치 여부 판별
//		 boolean usercheck=boarddao.isBoardWriter(num, pass);
//		 if(usercheck==false){ // 비밀번호가 일치하지 않는 경우
//		   		response.setContentType("text/html;charset=utf-8");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert('수정할 권한이 없습니다.');");
//		   	//	out.println("location.href='./BoardList.bo';");
//		   		out.println("history.go(-1)");
//		   		out.println("</script>");
//		   		out.close();
//		   		return null;
//		 }
		 
		 try{
			 boarddata.setS_board_num(num);
			 boarddata.setS_confirm(2);
			 request.setAttribute("boardlist", boarddata);
			 System.out.println("외박승인 게시글번호 = "+boarddata.getS_board_num());
			 System.out.println("외박승인 DISAPPROVE 번호 = "+boarddata.getS_confirm());
			 //System.out.println(boarddata.getS_content());
//			 boarddata.setS_subject(request.getParameter("S_BOARD_SUBJECT"));
//			 boarddata.setS_content(request.getParameter("S_BOARD_CONTENT"));
//			 boarddata.setS_major(request.getParameter("S_BOARD_MAJOR"));
//			 boarddata.setS_sleep_type(request.getParameter("S_SLEEP_TYPE"));
//			 
//			 SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
//			 boarddata.setS_start_date(transFormat.parse(request.getParameter("S_START_DATE")));
//			 boarddata.setS_end_date(transFormat.parse(request.getParameter("S_END_DATE")));
//			 System.out.println("!!==="+boarddata.getS_sleep_type());
//			 System.out.println("!!==="+boarddata.getS_start_date());
//			 System.out.println("!!==="+boarddata.getS_end_date());
//			 
//			 System.out.println("Modify_Action 번호 = "+num);
//			 System.out.println("Modify_Action 제목 = "+request.getParameter("S_BOARD_SUBJECT"));
//			 System.out.println("Modify_Action 내용 = "+request.getParameter("S_BOARD_CONTENT"));
			 
		//	 result = boarddao.boardModify(boarddata);
			// boarddao.boardEdit(boarddata);
			 boarddao.boardConfirm(boarddata);
			 /*if(result==false){
		   		System.out.println("게시판 수정 실패");
		   		return null;
		   	 }*/
		   	 //System.out.println("게시판 수정 완료");
		   	 out.print("불허 완료");
		   	 out.flush();
		   	 out.close();
		   
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		
	 }
}