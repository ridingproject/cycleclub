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

		String action = request.getParameter("action");
		String url = "/WEB-INF/cycleclub/club/listClub.jsp";
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
			String ccodeStr = request.getParameter("ccode");
			request.setAttribute("ccode",ccodeStr);
			ArrayList<MemberVO> mlist = service.joinClubList();
			request.setAttribute("mlist", mlist);

			url = "/WEB-INF/cycleclub/club/joinClubList.jsp";
			
		} else if("detail".equals(action)){
			// 모임 상세내용
			HttpSession session=request.getSession(true);
			String mid = (String)session.getAttribute("mid");
			String ccodestr = request.getParameter("ccode");
			int ccode = Integer.parseInt(ccodestr);
			ClubVO cvo = service.selectClub(ccode);
			request.setAttribute("cvo", cvo);
			request.setAttribute("next", "update");
			ArrayList<MemberVO> mlist = service.joinClubList();
			request.setAttribute("mlist", mlist);
			
			
			url = "/WEB-INF/cycleclub/club/detailClub.jsp";
			
		} else if("join".equals(action)){
			// 모임 참가
			String mid = request.getParameter("mid");
			String ccodestr = request.getParameter("ccode");
			int ccode = Integer.parseInt(ccodestr);
			MemberVO mvo = service.selectMember(mid);
			ClubVO cvo = service.selectClub(ccode);
			service.joinClub(mvo, cvo);
			request.getSession().setAttribute("next", "clublist");
			response.sendRedirect("club.do?action=clublist");
			return;
		} else if("unjoin".equals(action)){
			// 모임 취소 
			String mid = request.getParameter("mid");
			MemberVO mvo = service.selectMember(mid);
			service.unjoinClub(mvo);
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
		} else if("Ainsert".equals(action)){
			ClubVO cvo = new ClubVO();
			
			String cname = request.getParameter("cname");
			String cplace = request.getParameter("cplace");
			String ctime = request.getParameter("ctime");
			String mid = request.getParameter("mid");
			
			cvo = new ClubVO(null, cname, cplace, ctime, mid);
			service.insertClub(cvo);
			response.getWriter().println("등록되었습니다."); //스마트폰에서 출력

		} /*else if ("Alist".equals(action)){
			ArrayList<ClubVO> clist = service.listClub();
			request.setAttribute("clist", clist);
//			for(ClubVO cvo:clist){
//				System.out.println(cvo.toString());
				response.getWriter().println(cvo.toString()); //스마트폰에서 출력
//			}
		}*/
		
	}
	
	

}
