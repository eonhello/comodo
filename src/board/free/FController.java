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
		
		// �� �ۼ�	
		} else if (command.equals("/FWrite_action.fr")) {
			System.out.println("�Խ��� ����");
			action = new FWrite_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FList.fr")) {
			System.out.println("�Խ��� ����Ʈ");
			action = new FList_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/FDetail_action.fr")) {
			System.out.println("�Խ��� �󼼺���");
			action = new FDetail_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FModify.fr")) {
			System.out.println("�Խ��� ���� ����");
			action = new FModify_view();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FModify_action.fr")) {
			System.out.println("�Խ��� �����Ϸ��ư Ŭ�� �� ��Ʈ�ѷ��� ���Խ��ϴ�.");
			action = new FModify_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FDelete.fr")) {
			System.out.println("�Խ��� ���� ��ư Ŭ�� �� ������������ �̵��Ͽ����ϴ�");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/C_Board/Free/FBoard_Delete.jsp");
			
		} else if (command.equals("/FDeleteAction.fr")) {
			System.out.println("�Խ��� ���� ��ư Ŭ�� �� ��Ʈ�ѷ��� ���Խ��ϴ�.");
			action = new FDelete_action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FReply.fr")) {
			System.out.println("��� �ޱ� ���� ���� ����");
			action = new FReply_action();		// ��� �ޱ����� �׼� ����
			System.out.println("�亯�ޱ� �׼����� �ε� ����");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/FReplylist.fr")) {
			System.out.println("�亯�� ����Ʈ");
			action = new FReplylist_action();
			System.out.println("�亯����Ʈ �׼����� ���� ����");
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