package member;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet("*.mem")
public class Join_Controller extends javax.servlet.http.HttpServlet
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
		if (command.equals("/joinForm.mem")) {
			System.out.println("회원가입으로 가기위해 컨트롤러 접속 성공");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Member/Join/JoinForm.jsp");
	
			//forward.setPath("../C_Board/Sleep/sleep_design.jsp");
			
		// 메인페이지로 이동	
		} else if(command.equals("/mem/Main.mem")) {
			System.out.println("메인페이지로 들어가기 위해 /Main.mem 입력성공 ");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/index.jsp");
		
		// 회원가입 액션단으로 이동	
		} else if(command.equals("/joinInsert.mem")){
			action = new Jinsert_action();
			System.out.println("회원가입 추가 액션으로 이동하였습니다.");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		// 회원정보 수정을 위한 정보 불러오기	
		} else if(command.equals("/memModify.mem")){
			action = new JModify_view();
			System.out.println("수정될 회원정보를 불러 오겠습니다.");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		// 수정되기 전& 수정된 후 정보 jsp화면으로 띄우기	
		} else if(command.equals("/Memmodify_pro.mem")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Member/Join/Memmodify.jsp");
		
		} /*else if(command.equals("/memModify_action.mem")){
			action = new JModify_view();
			System.out.println("회원 정보 수정을 위한 데이터 베이스 접속합니다. ");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		// 수정하기 위해서 정보 입력한걸 데이터 베이스에 넣기	
		} */else if(command.equals("/memModify_action.mem")){
			action = new JModify_action();
			System.out.println("수정 할 정보들을 데이터베이스에 넣겠습니다..");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/Memmodify_go.mem")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/index.jsp");
		
		} else if (command.equals("/Login.mem")) {
			System.out.println("멤버 - 로그인 컨트롤러 진입");
			System.out.println("Member Controller로 넘어온 haknum = "+request.getParameter("haknum"));
			action = new Login_Action();
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