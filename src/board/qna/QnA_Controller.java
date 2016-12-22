package board.qna;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet("*.qa")
public class QnA_Controller extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("RequestURI=" + RequestURI);
		System.out.println("contextPath=" + contextPath);
		System.out.println("command=" + command);

		if (command.equals("/qna/QnA_Write.qa")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../C_Board/QnA/QBorad_Write.jsp");
		} else if (command.equals("/qna/QnA_AddAction.qa")) {
			action = new QnA_AddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/qna/QnA_List.qa")){
			action = new QnA_ListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/qna/QnA_DetailAction.qa")){
			action = new QnA_DetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/qna/QnA_Delete.qa")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("../C_Board/QnA/QBoard_delete.jsp");
		}else if (command.equals("/qna/QnA_DeleteAction.qa")) {
			action = new QnA_DeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/qna/QnA_Modify.qa")) {
			action = new QnA_ModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qna/QnA_ModifyAction.qa")) {
			action = new QnA_ModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/qna/QnA_ReplyAction.qa")) {
			action = new QnA_ReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/qna/QnA_ReplyView.qa")) {
			action = new QnA_ReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		if (forward != null) {
			if (forward.getRedirect()) { // true
				response.sendRedirect(forward.getPath());
			} else { // false 값전달이 가능함
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}// doprocess() end

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}