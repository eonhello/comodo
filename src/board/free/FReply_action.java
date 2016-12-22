package board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardDAOImpl;
import db.board.free.CommentBean;


public class FReply_action	implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
			
			request.setCharacterEncoding("utf-8");
			BoardDAOImpl boarddao=new BoardDAOImpl();
			CommentBean boarddata=new CommentBean();
		   	
		   	ActionForward forward=new ActionForward();
		   	  		
	   		try{

	   			boarddata.setRewriter(request.getParameter("rewriter").trim());
		   		boarddata.setBrdno(request.getParameter("brdno").trim());
		   		boarddata.setRememo(request.getParameter("rememo").trim());
		   			
				boarddao.replyInsert(boarddata);
				
				System.out.println("들어온 게시글 사람은 : " + boarddata.getRewriter());
				System.out.println("들어온 게시판 번호는 : " + boarddata.getBrdno());
				System.out.println("들어온 게시판 내용은 : " + boarddata.getRememo());
	   		
		   		forward.setRedirect(false);
		   		forward.setPath("/FDetail_action.fr?num="+boarddata.getBrdno());
		   		return forward;
		   		
	  		}catch(Exception ex){
	   			ex.printStackTrace();
	   		}
	  		return null;
		}
}
