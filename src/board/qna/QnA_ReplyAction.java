package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_ReplyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	//request.setCharacterEncoding("utf-8");
		 	
		 	ActionForward forward = new ActionForward();
	 	
		 	
		 	QBoardDAOImpl boarddao=new QBoardDAOImpl();
	   		QBoardBean boarddata=new QBoardBean();
	   		//int result=0;

	   		
	   		String realFolder="";
	   		String saveFolder="boardUpload";   		
	   		int fileSize=5*1024*1024;   		
	   		realFolder=request.getRealPath(saveFolder);
	   		
	   		boolean result=false;
	   		
	   		try{
	   			
	   			MultipartRequest multi=null;
	   			
	   			multi =new MultipartRequest(request,
	   					realFolder,
	   					fileSize,
	   					"utf-8",
	   					new DefaultFileRenamePolicy());		   		

		   		String page = multi.getParameter("page");
	   			
	   		boarddata.setQ_re_ref(Integer.parseInt(multi.getParameter("BOARD_RE_REF")));
	   		boarddata.setQ_re_seq(Integer.parseInt(multi.getParameter("BOARD_RE_SEQ")));
	   		
	   		//기존 댓글의 board_re_seq값을 1증가 시킴
	   		boarddao.refEdit(boarddata);
	   		
	   		//새로운 댓글의 board_re_lev값과 board_re_seq값을 부모보다 1증가된 값을 다시할당
	   		boarddata.setQ_re_lev(Integer.parseInt(multi.getParameter("BOARD_RE_LEV"))+1);
	   		boarddata.setQ_re_seq(Integer.parseInt(multi.getParameter("BOARD_RE_SEQ"))+1);
	   		
	   		boarddata.setQ_board_num(Integer.parseInt(multi.getParameter("BOARD_NUM")));
	   		//boarddata.setBoard_name(request.getParameter("BOARD_NAME"));
	   		boarddata.setHaknum(multi.getParameter("BOARD_HAKNUM"));
	   		boarddata.setQ_pass(multi.getParameter("BOARD_PASS"));
	   		boarddata.setQ_subject(multi.getParameter("BOARD_SUBJECT"));
	   		boarddata.setQ_content(multi.getParameter("BOARD_CONTENT"));	  
	   		
	   		boarddata.setQ_file(multi.getFilesystemName((String)multi.getFileNames().nextElement()));

			System.out.println("pass="+boarddata.getQ_pass());
			System.out.println("subject="+boarddata.getQ_subject());
			System.out.println("content="+boarddata.getQ_content());
			System.out.println("file="+boarddata.getQ_file());
 			   		
	   		
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
	   		
	  		}catch(Exception ex){
	   			ex.printStackTrace();
	   		}
	   		return null;
	}  	
}