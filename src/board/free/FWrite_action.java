package board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.BoardBean;
import db.BoardDAOImpl;

public class FWrite_action implements Action {
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
   			
   		/*	boarddata.setFboard_name(multi.getParameter("Fboad_name").trim());*/
   			boarddata.setFboard_pass(multi.getParameter("Fboad_pass").trim());
	   		boarddata.setFboard_title(multi.getParameter("Fboad_title").trim());
	   		boarddata.setFboard_content(multi.getParameter("Fboad_content").trim());
	   		
			System.out.println("name="+boarddata.getFboard_name());
			System.out.println("pass="+boarddata.getFboard_pass());
			System.out.println("subject="+boarddata.getFboard_title());
			System.out.println("content="+boarddata.getFboard_content());
 		
			boarddao.boardInsert(boarddata);
//	   		result=boarddao.boardInsert(boarddata);
	   		
	   		
	   		/*if(result==false){
	   			System.out.println("게시?�� ?���? ?��?��");
	   			return null;
	   		}
	   		System.out.println("게시?�� ?���? ?���?");*/
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("FBoard_List.jsp"); 	// ����Ʈ ���� �� ���� ���� ���� ��ũ ���ֱ�
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}