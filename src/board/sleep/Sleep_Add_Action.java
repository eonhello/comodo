package board.sleep;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.sleep.BoardBean;
import db.board.sleep.BoardDAOImpl;

public class Sleep_Add_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//System.out.println("액션진입");
		BoardDAOImpl boarddao=new BoardDAOImpl();
	   	BoardBean boarddata=new BoardBean();
	   	
	   	ActionForward forward=new ActionForward();
	   	
   		
   		boolean result=false;
   		request.setCharacterEncoding("utf-8");
   		try{
   			
   			boarddata.setS_haknum(Integer.parseInt(request.getParameter("S_BOARD_HAKNUM").trim()));
//   			String temp=enc.Encrypt_SHA(request.getParameter("S_BOARD_PASSWORD").trim());
//   			System.out.println(temp);
   			boarddata.setS_password(request.getParameter("S_BOARD_PASSWORD").trim());
   			boarddata.setS_name(request.getParameter("S_BOARD_NAME").trim());
   			
   			boarddata.setS_major(request.getParameter("S_BOARD_MAJOR").trim());
	   		boarddata.setS_subject(request.getParameter("S_BOARD_SUBJECT").trim());
	   		
	   		boarddata.setS_sleep_type(request.getParameter("S_SLEEP_TYPE"));
	   		boarddata.setS_content(request.getParameter("S_BOARD_CONTENT").trim());
	   		
	   		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
	   		boarddata.setS_start_date(transFormat.parse(request.getParameter("S_START_DATE")));
	   		
	   		//System.out.println(boarddata.getS_start_date());
	   		System.out.println(request.getParameter("S_START_DATE"));
	   		boarddata.setS_end_date(transFormat.parse(request.getParameter("S_END_DATE")));
	   		//sysdate로 쿼리문상에서 넣어줌. 필요없음.
	   		//boarddata.setS_board_date(transFormat.parse(request.getParameter("S_BOARD_DATE")));
	   		boarddata.setS_confirm(Integer.parseInt(request.getParameter("S_CONFIRM")));
	   		boarddata.setS_confirm_date(request.getParameter("S_CONFIRM_DATE"));
	   		boarddata.setS_cancel(Integer.parseInt(request.getParameter("S_CANCEL")));
	   		
			System.out.println("name="+boarddata.getS_name());
			System.out.println("pass="+boarddata.getS_password());
			System.out.println("subject="+boarddata.getS_subject());
			System.out.println("content="+boarddata.getS_content());

 		
			boarddao.boardInsert(boarddata);
//	   		result=boarddao.boardInsert(boarddata);
	   		
	   		
	   		/*if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");*/
	   		System.out.println("AddAction 진입");
	   		forward.setRedirect(true);
	   		//나중에 상세보기로 전환
	   		forward.setPath("/sleep/Sleep_List_Action.sl");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}