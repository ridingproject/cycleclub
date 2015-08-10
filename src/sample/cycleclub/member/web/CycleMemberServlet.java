package sample.cycleclub.member.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sample.cycleclub.member.service.IMemberService;
import sample.cycleclub.member.service.MemberService;

@WebServlet("/cycleclub/member/member.do")
public class CycleMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 서비스를 실행하기 위해 객체 생성
	private IMemberService service = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력 양식 요청, 서버로부터 데이터를 가져오는 코드 작성
		
		String action = request.getParameter("action");
		String url = "";
		
		if("join".equals(action)){
			// 회원가입
		} else if("login".equals(action)){
			// 로그인
		} else {
			
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 저장 요청, 서버에 데이터를 전송(저장)하는 코드 작성
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if("join".equals(action)){
			// 회원가입
		}
	}

}
