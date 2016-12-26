package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;




public class JModify_view implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	HttpSession session = request.getSession();
		 	request.setCharacterEncoding("utf-8");
	   		
		 	BoardDAOImpl boarddao=new BoardDAOImpl();
		 	MemberBean boarddata=new MemberBean();
		   	
		 	System.out.println(session.getAttribute("sessionHaknum"));
		 	int num=Integer.parseInt(session.getAttribute("sessionHaknum").toString());
		 	System.out.println("로그인하신 학번은 : " + num);
			boarddata=boarddao.getMemContent(num);
			
		   	if(boarddata==null){
		   		System.out.println("받을 데이터가 없습니다.");
		   		return null;
		   	}
		   	System.out.println("수정할 데이터 불러왔어요");
		   	System.out.println("주소는 : " + boarddata.getAddress());
		   	
		   	request.setAttribute("boarddata", boarddata);
		   	forward.setRedirect(false);
	   		forward.setPath("/Memmodify_pro.mem");
	   		return forward;
	 }
}