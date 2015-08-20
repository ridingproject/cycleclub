package sample.cycleclub.member.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

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
		request.setAttribute("next", "login");

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
			String mname = request.getParameter("mname"); //폰에서 받은 것
			String mid = request.getParameter("mid");//폰에서 받은 것
			String mpw = request.getParameter("mpw");//폰에서 받은 것
			String mphone = request.getParameter("mphone");//폰에서 받은 것
			mvo = new MemberVO(null, 0, 0, mid, 0, mname, mphone, mpw);

			boolean join = service.joinMember(mvo);
			if(join){
				request.setAttribute("next", "join");
				response.sendRedirect("member.do?action=login");
			}else{
				request.setAttribute("msg", "동일한 아이디가 존재합니다.");
				request.setAttribute("next", "join");
				RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/cycleclub/member/joinMember.jsp");
				disp.forward(request, response);	
			}
		}else if("login".equals(action)){
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");

			mvo = new MemberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);

			String login = service.loginMember(mvo);

			if("error".equals(login)){
				//System.out.println("Error!!");
				request.setAttribute("msg", "아이디가 다릅니다.");
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
					request.setAttribute("msg", "비밀번호가 다릅니다.");
					request.setAttribute("next", "login");
					RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/cycleclub/member/loginMember.jsp");
					disp.forward(request, response);
				}
			}
		}else if("Ajoin".equals(action)){
			String mname = URLDecoder.decode(request.getParameter("mname"),"UTF-8"); //폰에서 받은 것
			String mid = URLDecoder.decode(request.getParameter("mid"),"UTF-8"); //폰에서 받은 것
			String mpw = URLDecoder.decode(request.getParameter("mpw"),"UTF-8"); //폰에서 받은 것
			String mphone = URLDecoder.decode(request.getParameter("mphone"),"UTF-8"); //폰에서 받은 것

			mvo = new MemberVO(null, 0, 0, mid, 0, mname, mphone, mpw);

			boolean join = service.joinMember(mvo);

			if(join){
				response.getWriter().print("1");
			}else{
				response.getWriter().print("0");
			}

		}else if("Alogin".equals(action)){
			String mid = URLDecoder.decode(request.getParameter("mid"),"UTF-8");
			String mpw = URLDecoder.decode(request.getParameter("mpw"),"UTF-8");

			mvo = new MemberVO();
			
			mvo.setMid(mid);
			mvo.setMpw(mpw);

			String login = service.loginMember(mvo);

			if("error".equals(login)){
			/*	//System.out.println("Error!!");
				request.setAttribute("msg", "아이디가 다릅니다.");
				request.setAttribute("next", "login");
				RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/cycleclub/member/loginMember.jsp");
				disp.forward(request, response);*/
				 response.getWriter().print("0");
			}else{
				if(login.equals(mpw)){
					//로그인 성공
/*					HttpSession session=request.getSession(true);
					session.setAttribute("mid", mid);
					response.sendRedirect("/CycleClub/cycleclub/club/club.do?action=clublist");*/
					 response.getWriter().print("1");
				}else{
/*					request.setAttribute("msg", "비밀번호가 다릅니다.");
					request.setAttribute("next", "login");
					RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/cycleclub/member/loginMember.jsp");
					disp.forward(request, response);*/
					 response.getWriter().print("-1");
				}
			}
		}
	}
}
