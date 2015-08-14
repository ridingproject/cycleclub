package sample.cycleclub.member.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sample.cycleclub.member.model.MemberVO;
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
		String url = "/WEB-INF/cycleclub/member/loginMember.jsp";

		if("join".equals(action)){
			// 회원가입
			request.setAttribute("next", "join");
			url = "/WEB-INF/cycleclub/member/joinMember.jsp";
		} else if("login".equals(action)){
			// 로그인
			request.setAttribute("next", "login");
			url = "/WEB-INF/cycleclub/member/loginMember.jsp";
		} else {
			request.setAttribute("message", "에러페이지입니다.");
		}

		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 저장 요청, 서버에 데이터를 전송(저장)하는 코드 작성
		MemberVO mvo ;
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if("join".equals(action)){
			// 회원가입
			String mname = request.getParameter("mname");
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");
			String mphone = request.getParameter("mphone");
						
			mvo = new MemberVO(null, 0, 0, mid, 0, mname, mphone, mpw);
			service.joinMember(mvo);

			response.sendRedirect("member.do?action=login");
		}else if("login".equals(action)){
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");

			mvo = new MemberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);

			String login = service.loginMember(mvo);
			
			if("error".equals(login)){//이부분 아이디 DB에 없을경우 처리하는거 내일 다시 생각해봐야할듯.....
				System.out.println("Error!!");
				request.setAttribute("message", "아이디가 다릅니다.");
				request.setAttribute("next", "login");
				RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/cycleclub/member/loginMember.jsp");
				disp.forward(request, response);
			}else{
				if(login.equals(mpw)){
					//로그인 성공
					HttpSession session=request.getSession(true);
					session.setAttribute("mid", mid);
					response.sendRedirect("/CycleClub/cycleclub/club/club.do?action=clublist");
				}else{
					request.setAttribute("message", "비밀번호가 다릅니다.");
					RequestDispatcher disp = request.getRequestDispatcher("member.do?action=login");
					disp.forward(request, response);
				}
			}
		}
	}
}
