package board.free;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;


@WebServlet("*.fr")
public class FController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("RequestURI=" + RequestURI);
		System.out.println("contextPath=" + contextPath);
		System.out.println("command=" + command);

		if (command.equals("/FWrite.fr")) {			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/Free_Board2/C_Board/Free/FBoard_Write.jsp");
		
		// 글 작성	
		} else if (command.equals("/FWrite_action.fr")) {
			System.out.println("게시판 쓰기");
			action = new FWrite_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FList.fr")) {
			System.out.println("게시판 리스트");
			action = new FList_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/FDetail_action.fr")) {
			System.out.println("게시판 상세보기");
			action = new FDetail_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FModify.fr")) {
			System.out.println("게시판 수정 실행");
			action = new FModify_view();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FModify_action.fr")) {
			System.out.println("게시판 수정완료버튼 클릭 후 콘트롤러로 들어왔습니다.");
			action = new FModify_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FDelete.fr")) {
			System.out.println("게시판 삭제 버튼 클릭 후 삭제페이지로 이동하였습니다");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/C_Board/Free/FBoard_Delete.jsp");
			
		} else if (command.equals("/FDeleteAction.fr")) {
			System.out.println("게시판 삭제 버튼 클릭 후 컨트롤러로 들어왔습니다.");
			action = new FDelete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FReply.fr")) {
			System.out.println("댓글 달기 서블릿 접속 성공");
			action = new FReply_action();		// 댓글 달기위한 액션 실행
			System.out.println("답변달기 액션파일 로드 성공");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FReplylist.fr")) {
			System.out.println("답변글 리스트");
			action = new FReplylist_action();
			System.out.println("답변리스트 액션파일 접속 성공");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 

		/*
		 * else if (command.equals("/FWrite_action.fr")) { action = new
		 * FWrite_action(); try { forward = action.execute(request, response); }
		 * catch (Exception e) { e.printStackTrace(); }
		 */

		/*
		 * else if (command.equals("/BoardDelete.b")) { forward = new
		 * ActionForward(); forward.setRedirect(false);
		 * forward.setPath("./board/qna_board_delete.jsp"); } if
		 * (command.equals("/BoardModify.bo")) { action = new BoardModifyView();
		 * try { forward = action.execute(request, response); } catch (Exception
		 * e) { e.printStackTrace(); } } else if
		 * (command.equals("/BoardReplyView.bo")) { action = new
		 * BoardReplyView(); try { forward = action.execute(request, response);
		 * } catch (Exception e) { e.printStackTrace(); } } else if
		 * (command.equals("/BoardModifyAction.bo")) { action = new
		 * BoardModifyAction(); try { forward = action.execute(request,
		 * response); } catch (Exception e) { e.printStackTrace(); } } else if
		 * (command.equals("/BoardDeleteAction.bo")) { action = new
		 * BoardDeleteAction(); try { forward = action.execute(request,
		 * response); } catch (Exception e) { e.printStackTrace(); } }
		 */

		if (forward != null) {
			if (forward.getRedirect()) { // true
				response.sendRedirect(forward.getPath());
			} else { 
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}// doprocess() end
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}