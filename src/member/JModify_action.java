package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;


 public class JModify_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 response.setContentType("text/html;charset=utf-8");	
		 request.setCharacterEncoding("utf-8");
		 PrintWriter out=response.getWriter();
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("haknum"));
		 String pass = request.getParameter("password");
		
		 BoardDAOImpl boarddao=new BoardDAOImpl();

		 MemberBean boarddata=new MemberBean();
		 
		 MemberBean board = boarddao.getMemContent(num); // 수정시 비밀번호 유효성 검사 실행
		   	if(!board.getPassword().equals(pass)){ 
		   		out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
		   		out.close();
		   		return null;
		   	}
		 
		 try{
				boarddata.setHaknum(num);
				boarddata.setPassword("password");
				boarddata.setName("name");
				boarddata.setMajor("major");
				boarddata.setAddress("address");
				boarddata.setCall_num(Integer.parseInt("call_num"));
				boarddata.setMail(request.getParameter("mail"));
			 

				boarddao.boardEdit(boarddata);
				
					System.out.println("수정페이지 접속 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("");
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}