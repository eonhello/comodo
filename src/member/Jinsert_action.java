package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;

public class Jinsert_action implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
			
		 
			request.setCharacterEncoding("utf-8");
			BoardDAOImpl boarddao=new BoardDAOImpl();
			MemberBean boarddata=new MemberBean();
		   	
		   	ActionForward forward=new ActionForward();
		   	   		
	   		try{

		   		boarddata.setHaknum(Integer.parseInt(request.getParameter("haknum")));
		   		boarddata.setPassword(request.getParameter("password"));
		   		boarddata.setName(request.getParameter("name"));
		   		boarddata.setMajor(request.getParameter("major"));
		   		boarddata.setAddress(request.getParameter("address"));
		   		boarddata.setCall_num(Integer.parseInt(request.getParameter("call_num")));
		   		boarddata.setMail(request.getParameter("mail"));
		   		
/*		   		// 메일에서 @앞 값과 뒤의 값을 하나로 묶어서 데이터 베이스에 들어가게 하기위한 과정 
		   		String mail1 = request.getParameter("mail");
		   		String mail2 = request.getParameter("mail2");
		   		mail1 = mail1 +  "@" + mail2;
		   		
		   		boarddata.setMail(mail1);
		   		
		   		System.out.println(mail1);*/
		   		
		   		System.out.println("학번 : " + boarddata.getHaknum());
		   		System.out.println("비밀번호 : " + boarddata.getPassword());
		   		System.out.println("학과 : " + boarddata.getMajor());
		   		System.out.println("이름 : " + boarddata.getName());
		   		System.out.println("");
		   		
		   		boarddao.joinInsert(boarddata);
				System.out.println("리스트로 값을 보내준다");
		   		forward.setRedirect(true);
		   		forward.setPath("./mem/Main.mem"); 	
		   		return forward;
		   		
	  		}catch(Exception ex){
	   			ex.printStackTrace();
	   		}
	  		return null;
		}  	

}
