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

		if (command.equals("/free/FWrite.fr")) {			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../C_Board/Free/FBoard_Write.jsp");
		
		// �� �ۼ�	
		} else if (command.equals("/free/FWrite_action.fr")) {
			System.out.println("글쓰기 액션으로 들어왔어요.");
			action = new FWrite_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FList.fr")) {
			System.out.println("리스트로 들어왔다~");
			action = new FList_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/free/FDetail_action.fr")) {
			System.out.println("글보기 액션으로 들어왔어요.");
			action = new FDetail_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FModify.fr")) {
			System.out.println("글수정 액션으로 들어왔어요.");
			action = new FModify_view();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FModify_action.fr")) {
			System.out.println("글 수정 액션으로 들어옴");
			action = new FModify_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FDelete.fr")) {
			System.out.println("글 삭제로 가자");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/C_Board/Free/FBoard_Delete.jsp");
			
		} else if (command.equals("/free/FDeleteAction.fr")) {
			System.out.println("글삭제 액션으로 들어옴 ");
			action = new FDelete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FReply.fr")) {
			System.out.println("답변 달기 클릭 후 서블릿 접속 함");
			action = new FReply_action();		// 답변 달기 액션 실행
			System.out.println("답변 달기 액션 실행 완료");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/free/FReplylist.fr")) {
			System.out.println("답변 목록 서블릿 접속 ");
			action = new FReplylist_action();
			System.out.println("답변 목록 액션 실행 완료");
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