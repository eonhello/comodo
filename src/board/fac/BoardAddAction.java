package board.fac;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.board.fac.BoardBean;
import db.board.fac.BoardDAOImpl;

public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		BoardDAOImpl boarddao=new BoardDAOImpl();
	   	BoardBean boarddata=new BoardBean();
	   	
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
   			
   			boarddata.setFac_board_name(multi.getParameter("FAC_BOARD_NAME").trim());
   			boarddata.setFac_board_email(multi.getParameter("FAC_BOARD_EMAIL").trim());
	   		boarddata.setFac_board_subject(multi.getParameter("FAC_BOARD_SUBJECT").trim());
	   		boarddata.setFac_board_content(multi.getParameter("FAC_BOARD_CONTENT").trim());
	   		boarddata.setFac_board_filename(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		
System.out.println("name="+boarddata.getFac_board_name());
System.out.println("email="+boarddata.getFac_board_email());
System.out.println("subject="+boarddata.getFac_board_subject());
System.out.println("content="+boarddata.getFac_board_content());
System.out.println("file="+boarddata.getFac_board_filename());
 		
			boarddao.boardInsert(boarddata);
//	   		result=boarddao.boardInsert(boarddata);
	   		
	   		
	   		/*if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");*/
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./BoardList.bo");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}