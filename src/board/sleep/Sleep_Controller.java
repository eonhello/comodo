package board.sleep;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet("*.sl")
public class Sleep_Controller extends javax.servlet.http.HttpServlet
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
//
		if (command.equals("/sleep/Sleep_List_Action.sl")) {
			action = new Sleep_List_Action();
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			//forward.setPath("../C_Board/Sleep/sleep_design.jsp");
		}	else if(command.equals("/sleep/Sleep_Write_Action.sl")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/C_Board/Sleep/sleep_write.jsp");
		}
		else if (command.equals("/sleep/Sleep_Delete.sl")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/C_Board/Sleep/sleep_delete.jsp");
		} else if (command.equals("/sleep/Sleep_Modify.sl")) {
			action = new Sleep_Modify_View();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sleep/Sleep_Add_Action.sl")) {
			System.out.println("AddController 진입");
			action = new Sleep_Add_Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}/* else if (command.equals("/BoardReplyView.bo")) {
			action = new BoardReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} */else if (command.equals("/sleep/Sleep_Modify_Action.sl")) {
			action = new Sleep_Modify_Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sleep/Sleep_Delete_Action.sl")) {
			action = new Sleep_Delete_Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} /*else if (command.equals("/BoardList.bo")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Sleep_Detail_Action.sl")) {
			action = new Sleep_Detail_Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/	else if (command.equals("/sleep/Sleep_Confirm_Action.sl")) {
			Sleep_Confirm_Action sca = new Sleep_Confirm_Action();
			try {
				sca.AjaxOut(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sleep/Sleep_Cancel_Action.sl")) {
			Sleep_Cancel_Action cancel_a = new Sleep_Cancel_Action();
			try {
				cancel_a.AjaxOut(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sleep/Sleep_Disapprove_Action.sl")) {
			Sleep_Disapprove_Action sda = new Sleep_Disapprove_Action();
			try {
				sda.AjaxOut(request, response);
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