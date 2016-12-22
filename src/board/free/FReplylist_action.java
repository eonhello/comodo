package board.free;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;



public class FReplylist_action implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{



		BoardDAOImpl boarddao=new BoardDAOImpl();
		List boardlist=new ArrayList();
		
		int brdno = Integer.parseInt(request.getParameter("brdno"));

		
		BoardBean boardBean = new BoardBean();
		boardBean.setBoard_num(brdno);

		//�� ������ ��
		System.out.println("답변 글 갯수 입니다. : " + boardlist);
		request.setAttribute("boardlist", boardlist);		

		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("/free/FDetail_action.fr");
 		return forward;
	 }
}
