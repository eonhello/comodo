package board.fac;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import net.board.db.BoardDAO1;
import db.board.fac.BoardBean;
import db.board.fac.BoardDAOImpl;

public class BoardReplyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	request.setCharacterEncoding("utf-8");
		 	ActionForward forward = new ActionForward();
		 	
//			BoardDAO1 boarddao=new BoardDAO1();
		 	BoardDAOImpl boarddao=new BoardDAOImpl();
	   		BoardBean boarddata=new BoardBean();
	   		int result=0;
	   		String page = request.getParameter("page");
	   		
	   		boarddata.setFac_board_ref(Integer.parseInt(request.getParameter("FAC_BOARD_REF")));
	   		boarddata.setFac_board_re_step(Integer.parseInt(request.getParameter("FAC_BOARD_RE_STEP")));
	   		
	   		//기존 댓글의 board_re_seq값을 1증가 시킴
	   		boarddao.refEdit(boarddata);
	   		
	   		//새로운 댓글의 board_re_lev값과 board_re_seq값을 부모보다 1증가된 값을 다시할당
	   		boarddata.setFac_board_re_level(Integer.parseInt(request.getParameter("FAC_BOARD_RE_LEVEL"))+1);
	   		boarddata.setFac_board_re_step(Integer.parseInt(request.getParameter("FAC_BOARD_RE_STEP"))+1);
	   		
	   		boarddata.setFac_board_num(Integer.parseInt(request.getParameter("FAC_BOARD_NUM")));
	   		boarddata.setFac_board_name(request.getParameter("FAC_BOARD_NAME"));
	   		boarddata.setFac_board_email(request.getParameter("FAC_BOARD_EMAIL"));
	   		boarddata.setFac_board_subject(request.getParameter("FAC_BOARD_SUBJECT"));
	   		boarddata.setFac_board_content(request.getParameter("FAC_BOARD_CONTENT"));	   		
	   		
//	   		boarddao.boardReply(boarddata);
	   		boarddao.boardReplyOk(boarddata);
//	   		if(result==0){
//	   			System.out.println("답장 실패");
//	   			return null;
//	   		}
	   		System.out.println("답장 완료");
	   		
	   		forward.setRedirect(true);
//	   		forward.setPath("./BoardDetailAction.bo?num="+boarddata.getFac_board_num()+"&page="+page);
	   		forward.setPath("./BoardList.bo?num="+boarddata.getFac_board_num()+"&page="+page);
	   		return forward;
	}  	
}