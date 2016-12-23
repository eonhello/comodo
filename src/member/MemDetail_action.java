package member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.member.BoardDAOImpl;
import db.member.MemberBean;

public class MemDetail_action implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
  		
		BoardDAOImpl boarddao=new BoardDAOImpl();
		MemberBean boarddata=new MemberBean();
	   	
		int num=Integer.parseInt(request.getParameter("haknum"));	

		boarddata=boarddao.getMemContent(num);//내용보기
		
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
/*	   	request.setAttribute("boarddata", boarddata);
	   	request.setAttribute("page", page);
	   	request.setAttribute("replydlist", replylist); // 댓글 불러오기
	   	
	   	
	   	System.out.println("조회수검색입니다 : "+boarddata.getBoard_readcount());
	   	System.out.println("작성날짜입니다 : "+boarddata.getBoard_date());*/
	   
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("../C_Board/Free/FBoard_View.jsp");
  		return forward;

	 }
}
