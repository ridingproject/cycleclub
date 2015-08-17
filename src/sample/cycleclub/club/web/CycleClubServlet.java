package sample.cycleclub.club.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sample.cycleclub.club.model.ClubDAO;
import sample.cycleclub.club.model.ClubVO;
import sample.cycleclub.club.model.IClubDAO;
import sample.cycleclub.club.service.ClubService;
import sample.cycleclub.club.service.IClubService;
import sample.cycleclub.member.model.MemberVO;

@WebServlet("/cycleclub/club/club.do")
public class CycleClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IClubService service = new ClubService();
	IClubDAO dao = new ClubDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �엯�젰 �뼇�떇 �슂泥�, �꽌踰꾨줈遺��꽣 �뜲�씠�꽣瑜� 媛��졇�삤�뒗 肄붾뱶 �옉�꽦
		String action = request.getParameter("action");
		String url = "/WEB-INF/cycleclub/member/loginMember.jsp";
		if("insert".equals(action)){
			// 모임 입력
			request.setAttribute("next", "insert");
			url = "/WEB-INF/cycleclub/club/insertClub.jsp";
		} else if("update".equals(action)){
			// 모임 수정
			request.setAttribute("next", "update");
			String ccodestr = request.getParameter("ccode");
			System.out.println(ccodestr); //detail에서 ccode넘어옴
			int ccode = Integer.parseInt(ccodestr);
			ClubVO cvo = service.selectClub(ccode);
			request.setAttribute("cvo", cvo); //cvo넘겨줌
			url = "/WEB-INF/cycleclub/club/updateClub.jsp";
		} else if("delete".equals(action)){
			// 모임 삭제
			HttpSession session=request.getSession(true);
			String mid = (String)session.getAttribute("mid");
			String ccodestr = request.getParameter("ccode");
			ClubVO cvo = new ClubVO(ccodestr,null,null,null,mid);
			service.deleteClub(cvo);
			ArrayList<ClubVO> clist = service.listClub();
			request.setAttribute("clist", clist);
			request.setAttribute("next", "insert");
			url = "/WEB-INF/cycleclub/club/listClub.jsp";
		} else if("clublist".equals(action)){
			// 모임 목록
			ArrayList<ClubVO> clist = service.listClub();
			request.setAttribute("clist", clist);
			request.setAttribute("next", "insert");
			
			ArrayList<MemberVO> mlist = service.joinClubList();
			request.setAttribute("mlist", mlist);
			
			
			url = "/WEB-INF/cycleclub/club/listClub.jsp";
		} else if("joinlist".equals(action)){
			// 모임 참가 리스트
			request.setAttribute("next","clublist");
			request.setAttribute("ccode",request.getParameter("ccode"));
			ArrayList<MemberVO> mlist = service.joinClubList();
			request.setAttribute("mlist", mlist);
			url = "/WEB-INF/cycleclub/club/joinClubList.jsp";
		} else if("detail".equals(action)){
			// 모임 상세내용
			String ccodestr = request.getParameter("ccode");
			int ccode = Integer.parseInt(ccodestr);
			ClubVO cvo = service.selectClub(ccode);
			request.setAttribute("cvo", cvo);
			request.setAttribute("next", "update");
			
			url = "/WEB-INF/cycleclub/club/detailClub.jsp";
		} else if("join".equals(action)){
			// 모임 참가
		
			String mid = request.getParameter("mid");
			MemberVO mvo = service.selectMember(mid);
			service.joinClub(mvo);
			System.out.println("조인");
			request.setAttribute("message", "모임 참가가 되었습니다.");  // 메세지 안넘어감
			request.setAttribute("next", "clublist");
			response.sendRedirect("club.do?action=clublist");
			return;
		} else if("unjoin".equals(action)){
			// 모임 취소 
			
			String mid = request.getParameter("mid");
			MemberVO mvo = service.selectMember(mid);
			service.unjoinClub(mvo);
			System.out.println("조인");
			request.setAttribute("message", "모임 참가를 쉬소 하엿습니다.");  // 메세지 안넘어감
			request.setAttribute("next", "clublist");
			response.sendRedirect("club.do?action=clublist");
			return;
		} else{
			// �뿉�윭�럹�씠吏�
			request.setAttribute("message", "에러페이지입니다.");
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���옣 �슂泥�, �꽌踰꾩뿉 �뜲�씠�꽣瑜� �쟾�넚(���옣)�븯�뒗 肄붾뱶 �옉�꽦
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if ("insert".equals(action)) {
			// 紐⑥엫 �벑濡�
			// �뜲�씠�꽣 ���옣 泥섎━
			ClubVO cvo = new ClubVO();

			String ccode = request.getParameter("ccode");
			String cname = request.getParameter("cname");
			String cplace = request.getParameter("cplace");
			String ctime = request.getParameter("ctime");
			HttpSession session = request.getSession(true);
			String mid = (String) session.getAttribute("mid");
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
			// 紐⑥엫 �닔�젙
			String cname = request.getParameter("cname");
			String cplace = request.getParameter("cplace");
			String ccode = request.getParameter("ccode");
			String mid = request.getParameter("mid");
			String ctime = request.getParameter("ctime");
//			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Date to = transFormat.parse(request.getParameter("ctime"));
			ClubVO updatevo = new ClubVO(ccode, cname, cplace, ctime, mid);
			service.updateClub(updatevo);
			response.sendRedirect("club.do?action=clublist");
		}  else if ("join".equals(action)){
			System.out.println("조인포스트");
			String mcode = request.getParameter("mcode");
			String mgpsx = request.getParameter("mgpsx");
			String mgpsy = request.getParameter("mgpsy");
			String mid = request.getParameter("mid");
			String mjoin = request.getParameter("mjoin");
			String mname = request.getParameter("mname");
			String mphone = request.getParameter("mphone");
			String mpw = request.getParameter("mpw");
			MemberVO mvo = new MemberVO(null, 0, 0, mid, 0, mname, mphone, mpw);
			// 자료형을 어떻게 할것인가??..


		}
		
	}
	
	

}
