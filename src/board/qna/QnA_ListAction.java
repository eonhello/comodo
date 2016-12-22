package board.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.qna.QBoardDAOImpl;

 public class QnA_ListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

//		BoardDAO boarddao=new BoardDAO();
		QBoardDAOImpl boarddao=new QBoardDAOImpl();
		List Qboardlist=new ArrayList();
		
		int page=1; // 현재 페이지 번호
		int limit=10; // 한 화면에 출력할 레코드 갯수
		String search ="";
		String find_field ="";
		
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("searchData") != null){
			search = request.getParameter("searchData");
		}
		if(request.getParameter("find_field") !=null){
			find_field = request.getParameter("find_field");
		}
		
		System.out.println(search);
		System.out.println(find_field);
		
		
		int listcount=1;
		if(!search.equals("")){
			listcount=boarddao.getSearchListCount(search,find_field); //총 리스트 수를 받아옴
			Qboardlist = boarddao.getSearchBoardList(page,search,find_field);
			//Qboardlist = boarddao.getBoardList(page);
		}else{
			listcount=boarddao.getListCount(); //총 리스트 수를 받아옴
			Qboardlist = boarddao.getBoardList(page);
		}
		//총 페이지 수
 		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
 		
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage+10-1;

 		if(endpage> maxpage) endpage= maxpage;
 		
 		int number = listcount-(page-1)*10; 		
 		
 		request.setAttribute("page", page); //현재 페이지 수
 		request.setAttribute("maxpage", maxpage); //최대 페이지 수
 		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수
 		request.setAttribute("endpage", endpage); //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount); //글 수
		request.setAttribute("boardlist", Qboardlist);		
		request.setAttribute("search", search);
		request.setAttribute("find_field", find_field);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("/C_Board/QnA/QBorad_List.jsp");
 		return forward;
	 }
 }