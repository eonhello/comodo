package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_ReplyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	request.setCharacterEncoding("utf-8");
		 	ActionForward forward = new ActionForward();
		 	
//			BoardDAO1 boarddao=new BoardDAO1();
		 	QBoardDAOImpl boarddao=new QBoardDAOImpl();
	   		QBoardBean boarddata=new QBoardBean();
	   		int result=0;
	   		String page = request.getParameter("page");
	   		
	   		boarddata.setQ_re_ref(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
	   		boarddata.setQ_re_seq(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
	   		
	   		//기존 댓글의 board_re_seq값을 1증가 시킴
	   		boarddao.refEdit(boarddata);
	   		
	   		//새로운 댓글의 board_re_lev값과 board_re_seq값을 부모보다 1증가된 값을 다시할당
	   		boarddata.setQ_re_lev(Integer.parseInt(request.getParameter("BOARD_RE_LEV"))+1);
	   		boarddata.setQ_re_seq(Integer.parseInt(request.getParameter("BOARD_RE_SEQ"))+1);
	   		
	   		boarddata.setQ_board_num(Integer.parseInt(request.getParameter("BOARD_NUM")));
	   		//boarddata.setBoard_name(request.getParameter("BOARD_NAME"));
	   		boarddata.setQ_pass(request.getParameter("BOARD_PASS"));
	   		boarddata.setQ_subject(request.getParameter("BOARD_SUBJECT"));
	   		boarddata.setQ_content(request.getParameter("BOARD_CONTENT"));	   		
	   		
//	   		result=boarddao.boardReply(boarddata);
	   		boarddao.boardReplyOk(boarddata);
//	   		if(result==0){
//	   			System.out.println("답장 실패");
//	   			return null;
//	   		}
	   		System.out.println("답장 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./QnA_DetailAction.qa?num="+boarddata.getQ_board_num()+"&page="+page);
//	   		forward.setPath("./BoardDetailAction.bo?num="+result+"&page="+page);
	   		return forward;
	}  	
}