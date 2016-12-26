package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		 HttpSession session = request.getSession();
		 boolean result = false;
		 
		 System.out.println("수정 될 정보를 받아오기위한 학번 : "+session.getAttribute("sessionHaknum"));
		 int num=Integer.parseInt(session.getAttribute("sessionHaknum").toString()); 
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
				System.out.println("받은 학번 : " + boarddata.getHaknum());
				boarddata.setPassword(request.getParameter("password"));
				System.out.println("수정 될비밀번호 : " + boarddata.getPassword());
				boarddata.setName(request.getParameter("name"));
				System.out.println("수정 될 이름 : " + boarddata.getName());
				boarddata.setMajor(request.getParameter("major"));
				System.out.println("수정 될 학과 : " + boarddata.getMajor());
				boarddata.setAddress(request.getParameter("address"));
				System.out.println("수정 될 주소 : " + boarddata.getAddress());
				boarddata.setCall_num(Integer.parseInt(request.getParameter("call_num")));
				System.out.println("수정 될 번호 : " + boarddata.getCall_num());
				boarddata.setMail(request.getParameter("mail"));
				System.out.println("수정 될 메일 : " + boarddata.getMail());

				boarddao.boardEdit(boarddata);
				
					System.out.println("수정페이지 접속 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("/Memmodify_go.mem");
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }
}