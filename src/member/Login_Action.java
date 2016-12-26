package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;


 public class Login_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

//		BoardDAO boarddao=new BoardDAO();
		BoardDAOImpl memberdao=new BoardDAOImpl();
		MemberBean mem = new MemberBean();
		
 		//***********DB에서 꺼내온값 request로 setAttribute!*************

		int result = 0;
		System.out.println("Login Action로 넘어온 haknum = "+request.getParameter("haknum"));
		
		HttpSession  session = request.getSession();
		//session.setAttribute("sessionName", Value);
		String referrer= (String)request.getParameter("referrer");
		System.out.println("======= " + referrer +" =====");
		
		try {
			if(memberdao.getLoginInformation(Integer.parseInt(request.getParameter("haknum")))!=null){
				mem=memberdao.getLoginInformation(Integer.parseInt(request.getParameter("haknum")));
				System.out.println("Action Test DB Password = "+mem.getPassword());
				System.out.println("Action Test Input Password = "+request.getParameter("password"));
				if(mem.getPassword().equals(request.getParameter("password"))){
					
					request.setAttribute("result", 0);
					session.setAttribute("sessionHaknum", mem.getHaknum());
					session.setAttribute("sessionName", mem.getName());
					session.setAttribute("sessionPermission", mem.getPermission());
					
					System.out.println("session 셋팅 후 = "+session.getAttribute("sessionHaknum"));
					System.out.println("비밀번호 일치");
				} else {
					request.setAttribute("result", 2);
					
					System.out.println("비밀번호 틀림");
				}
				System.out.println(mem.getName());	//mem이 DB에서 꺼내온값
			} else {	// 아이디 틀렸을 때. (haknum을 where절에 넣어 select 했는데 결과가 없으면 아이디 틀림
				request.setAttribute("result", 1);
				System.out.println("아이디 틀림");
			}
//			if (mem.getId().equals(member.getId())) {	//member.getId() == DB에서 꺼내온값
//				result = -1;
//				if (mem.getPassword().equals(member.getPassword())) {
//					result = 1;
//				}
//			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		//forward.setPath("/Sleep_List_Action.sl");
	 	forward.setPath("./Member/Login/LoginPro.jsp?referrer="+referrer);
 		System.out.println(forward.getPath());
 		return forward;
	 }
 }