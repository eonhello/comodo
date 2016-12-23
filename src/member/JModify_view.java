package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;




public class JModify_view implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("utf-8");
	   		
		 	BoardDAOImpl boarddao=new BoardDAOImpl();
		 	MemberBean boarddata=new MemberBean();
		   	
			int num=Integer.parseInt(request.getParameter("haknum"));
			boarddata=boarddao.getMemContent(num);
			
		   	if(boarddata==null){
		   		System.out.println("받을 데이터가 없습니다.");
		   		return null;
		   	}
		   	System.out.println("수정할 데이터 불러왔어요");
		   	
		   	request.setAttribute("boarddata", boarddata);
		   	forward.setRedirect(false);
	   		forward.setPath("../Member/Join/Memmodify.jsp");
	   		return forward;
	 }
}