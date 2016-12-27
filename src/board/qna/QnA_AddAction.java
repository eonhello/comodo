package board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardBean;
import db.board.qna.QBoardDAOImpl;

public class QnA_AddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		QBoardDAOImpl boarddao=new QBoardDAOImpl();
	   	QBoardBean boarddata=new QBoardBean();
	   	
	   	ActionForward forward=new ActionForward();
	   	
		String realFolder="";
   		String saveFolder="boardUpload";   		
   		int fileSize=5*1024*1024;   		
   		realFolder=request.getRealPath(saveFolder);
   		
   		boolean result=false;
   		
   		try{
   			
   			MultipartRequest multi=null;
   			
   			multi=new MultipartRequest(request,
   					realFolder,
   					fileSize,
   					"utf-8",
   					new DefaultFileRenamePolicy());
   			
   			//boarddata.setQboard_name(multi.getParameter("BOARD_NAME").trim());
   			//boarddata.setQ_pass(multi.getParameter("BOARD_PASS").trim());
   			boarddata.setHaknum(multi.getParameter("BOARD_HAKNUM").trim());
	   		boarddata.setQ_subject(multi.getParameter("BOARD_SUBJECT").trim());
	   		boarddata.setQ_content(multi.getParameter("BOARD_CONTENT").trim());
	   		boarddata.setQ_file(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		
	   		//System.out.println("name="+boarddata.getBoard_name());
			System.out.println("pass="+boarddata.getQ_pass());
			System.out.println("subject="+boarddata.getQ_subject());
			System.out.println("content="+boarddata.getQ_content());
			System.out.println("file="+boarddata.getQ_file());
 		
			boarddao.boardInsert(boarddata);
//	   		result=boarddao.boardInsert(boarddata);
	   		
	   		
	   		/*if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");*/
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./QnA_List.qa");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}