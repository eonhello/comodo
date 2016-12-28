package board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardBean;
import db.board.free.BoardDAOImpl;



public class FWrite_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 
		request.setCharacterEncoding("utf-8");
		BoardDAOImpl boarddao=new BoardDAOImpl();
	   	BoardBean boarddata=new BoardBean();
	   	
	   	ActionForward forward=new ActionForward();
	   	
//		String realFolder="";
//   		String saveFolder="boardUpload";   		
//   		int fileSize=5*1024*1024;   		
//   		realFolder=request.getRealPath(saveFolder);
//   		
//   		boolean result=false;
//   		
   		try{
//   			
//   			MultipartRequest multi=null;
//   			
//   			multi=new MultipartRequest(request,
//   					realFolder,
//   					fileSize,
//   					"utf-8",
//   					new DefaultFileRenamePolicy());
   			
   		/*	boarddata.setFboard_name(multi.getParameter("Fboad_name").trim());*/
//   			boarddata.setBoard_pass(multi.getParameter("Fboad_pass").trim());
//	   		boarddata.setBoard_title(multi.getParameter("Fboad_title").trim());
//	   		boarddata.setBoard_content(multi.getParameter("Fboad_content").trim());
	   		
/*			System.out.println("name="+boarddata.getFboard_name());
			System.out.println("pass="+boarddata.getFboard_pass());
			System.out.println("subject="+boarddata.getFboard_title());
			System.out.println("content="+boarddata.getFboard_content());*/
   			
   			
   			boarddata.setHaknum(request.getParameter("haknum").trim());
   			boarddata.setBoard_name(request.getParameter("board_name"));
   			boarddata.setBoard_pass(request.getParameter("board_pass").trim());
	   		boarddata.setBoard_subject(request.getParameter("board_subject").trim());
	   		boarddata.setBoard_content(request.getParameter("board_content").trim());
	   	
 		
			boarddao.boardInsert(boarddata);
			System.out.println("리스트로 값을 보내준다");
	   		forward.setRedirect(true);
	   		forward.setPath("/free/FList.fr"); 	
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}