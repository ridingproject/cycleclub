package sample.cycleclub.club.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sample.cycleclub.club.model.ClubVO;
import sample.cycleclub.club.service.ClubService;
import sample.cycleclub.club.service.IClubService;

@WebServlet("/cycleclub/club/club.do")
public class CycleClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IClubService service = new ClubService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력 양식 요청, 서버로부터 데이터를 가져오는 코드 작성
		String action = request.getParameter("action");
		String url = "/WEB-INF/error.jsp";
		if("insert".equals(action)){
			// 모임 등록
			request.setAttribute("next", "insert");
			url = "/WEB-INF/cycleclub/club/insertClub.jsp";
			HttpSession session=request.getSession(true);/////현재 존재하는 세션값을 얻어온다.
			session.setAttribute("mid", "masang");///////
		} else if("update".equals(action)){
			// 모임 수정
			 request.setAttribute("next", "update");
	            String ccodeupdate = request.getParameter("ccode");
	            int ccode = Integer.parseInt(ccodeupdate);
	            ClubVO cvo = service.selectClub(ccode);
	            request.setAttribute("cvo", cvo);
	            url = "/WEB-INF/cycleclub/club/updateClub.jsp";
		} else if("delete".equals(action)){
			// 모임 삭제
			HttpSession session=request.getSession(true);/////현재 존재하는 세션값을 얻어온다.
			session.setAttribute("mid", "masang");//////
			String mid = (String)session.getAttribute("mid");
			String ccodestr = request.getParameter("ccode");
			ClubVO cvo = new ClubVO(ccodestr,null,null,null,mid);
			service.deleteClub(cvo);
			ArrayList<ClubVO> clist = service.listClub();
			request.setAttribute("clist", clist);
			request.setAttribute("next", "insert");
			url = "/WEB-INF/cycleclub/club/listClub.jsp";
		} else if("clublist".equals(action)){
			// 모임 목록 조회
			HttpSession session=request.getSession(true);////현재 존재하는 세션값을 얻어온다.
			session.setAttribute("mid", "masang");//////
			ArrayList<ClubVO> clist = service.listClub();
			request.setAttribute("clist", clist);
			request.setAttribute("next", "insert");
			url = "/WEB-INF/cycleclub/club/listClub.jsp";
		} else if("joinlist".equals(action)){
			// 모임 참가회원 조회
			url = "/WEB-INF/cycleclub/club/joinClubList.jsp";
		} else if("detail".equals(action)){
			// 모임 상세 조회
			String ccodestr = request.getParameter("ccode");
			int ccode = Integer.parseInt(ccodestr);
			ClubVO cvo = service.selectClub(ccode);
			request.setAttribute("cvo", cvo);
			url = "/WEB-INF/cycleclub/club/detailClub.jsp";
		} else{
			// 에러페이지
			request.setAttribute("message", "잘못 된 액션입니다.");
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 저장 요청, 서버에 데이터를 전송(저장)하는 코드 작성
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if ("insert".equals(action)) {
			// 모임 등록
			// 데이터 저장 처리
			ClubVO cvo = new ClubVO();

			String ccode = request.getParameter("ccode");
			String cname = request.getParameter("cname");
			String cplace = request.getParameter("cplace");
			String ctime = request.getParameter("ctime");
			String mid = request.getParameter("mid");
			/*
			 * String time = request.getParameter("ctime"); SimpleDateFormat
			 * transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date
			 * ctime = null; try { ctime = transFormat.parse(time); } catch
			 * (ParseException e) {}
			 */
			cvo = new ClubVO(ccode, cname, cplace, ctime, mid);
			service.insertClub(cvo);
			
			response.sendRedirect("club.do?action=clublist");
		} else if ("update".equals(action)) {
			// 모임 수정
			 String cname = request.getParameter("cname");
	            String cplace = request.getParameter("cplace");
	            String ccode = request.getParameter("ccode");
	            String mid = request.getParameter("mid");
	            String ctime = request.getParameter("ctime");
//	          SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	          Date to = transFormat.parse(request.getParameter("ctime"));
	            ClubVO updatevo = new ClubVO(ccode, cname, cplace, ctime, mid);
	            service.updateClub(updatevo);
	            response.sendRedirect("club.do?action=clublist");
		}
		
	}
	
	

}
