package board.free;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import db.board.free.BoardDAOImpl;


//import net.board.db.BoardDAO1;


 public class FList_action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		request.setCharacterEncoding("utf-8");
		BoardDAOImpl boarddao=new BoardDAOImpl();
		List boardlist=new ArrayList();

		int page=1; // 현재 페이지 번호
		int limit=10; // 한 화면에 출력할 레코드 갯수
		
		if(request.getParameter("page") != null){
			try{
			page=Integer.parseInt(request.getParameter("page"));
			}
			catch (Exception e) {
				System.out.println("page번호 : " + request.getParameter("page"));
			}
		}
		
		int listcount = 1;
		String keyword="";
		String keyField="";
		
		// 검색을 했을 때 키워드 값이 있다면 검색한 값만 받아오기 위해서 if를 사용한다.
		if(request.getParameter("keyword") != null){
		
		keyField = request.getParameter("keyField");	// 선택한 검색 카테고리 값을 keyField에 넣는다
		System.out.println("키필드 : "+keyField);			
		keyword = request.getParameter("keyword");		// 검색한 내용을 keyword에 넣어준다.
		System.out.println("키워드 : "+keyword);
		listcount=boarddao.getSearchCount(keyword, keyField); //총 리스트 수를 받아옴
		System.out.println("총 게시물 수 : "+listcount);
		boardlist = boarddao.getSearchList(page, keyword, keyField);	// 전달해야할 값들을 전부 boardlist에 넣어준다
		//총 페이지 수
		System.out.println(boardlist);
		 
		// 검색한 키워드 값이 없다면 데이터베이스에 있는 리스트 전체를 가져오라고 할때
		} else {
				 listcount=boarddao.getListCount(); //총 리스트 수를 받아옴
				System.out.println("총 게시물 수 : "+listcount);
	
				boardlist = boarddao.getBoardList(page);
				//총 페이지 수
				System.out.println(boardlist);
		 }
		
 		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
 		
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage+10-1;

 		if(endpage> maxpage) endpage= maxpage;
 		
 		int number = listcount-(page-1)*10; 		
 		
 		request.setAttribute("page", page); 	//현재 페이지 수
 		request.setAttribute("maxpage", maxpage); 	//최대 페이지 수
 		request.setAttribute("startpage", startpage); 	//현재 페이지에 표시할 첫 페이지 수
 		request.setAttribute("endpage", endpage); 	//현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount); 	//글 수
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("keyword", keyword);	// 검색 한 내용
		request.setAttribute("keyField", keyField);	// 검색 카테고리
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("../C_Board/Free/FBoard_List.jsp");
 		return forward;
 		
	 }
	 
 }