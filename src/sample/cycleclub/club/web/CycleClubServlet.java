package sample.cycleclub.club.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.google.gson.Gson;

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

			request.setAttribute("message", "에러페이지입니다.");
		}

		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���옣 �슂泥�, �꽌踰꾩뿉 �뜲�씠�꽣瑜� �쟾�넚(���옣)�븯�뒗 肄붾뱶 �옉�꽦
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		Sender sender = new Sender("AIzaSyD-I6yxO-P9oBZJJyJG-IQ0J8lRtX8yFe8");
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
		} else if("Ainsert".equals(action)){
			ClubVO cvo = new ClubVO();

			String cname = URLDecoder.decode(request.getParameter("cname"), "UTF-8") ;
			String cplace = URLDecoder.decode(request.getParameter("cplace"), "UTF-8") ;
			String ctime = URLDecoder.decode(request.getParameter("ctime"), "UTF-8") ;
			String mid = URLDecoder.decode(request.getParameter("mid"), "UTF-8") ;

			cvo = new ClubVO(null, cname, cplace, ctime, mid);
			service.insertClub(cvo);
			response.getWriter().println("등록되었습니다."); //스마트폰에서 출력

		} else if("Ajoin".equals(action)){
			// 모임 참가
			String mid = request.getParameter("mid");
			String ccodestr = request.getParameter("ccode");
			int ccode = Integer.parseInt(ccodestr);
			System.out.println(mid);
			System.out.println(ccodestr);
			MemberVO mvo = service.selectMember(mid);
			ClubVO cvo = service.selectClub(ccode);
			service.joinClub(mvo, cvo);
			response.getWriter().println("모임이 참여 되었습니다.");
		} else if("Aunjoin".equals(action)){
			// 모임 취소 
			String mid = request.getParameter("mid");
			MemberVO mvo = service.selectMember(mid);
			service.unjoinClub(mvo);

			response.getWriter().println("모임이 취소 되었습니다.");
		} else if ("Alist".equals(action)){
			ArrayList<ClubVO> clist = service.listClub();
			Gson gson = new Gson();
			String jsonStr = gson.toJson(clist);
			String jsonMsg = URLEncoder.encode(jsonStr, "UTF-8") ;
			response.getWriter().print(jsonMsg);
		} else if("Adelete".equals(action)){
			// 모임 삭제
			HttpSession session=request.getSession(true);
			String mid = (String)session.getAttribute("mid");
			String ccodestr = request.getParameter("ccode");
			ClubVO cvo = new ClubVO(ccodestr,null,null,null,mid);
			service.deleteclubmember(cvo);
			service.deleteClub(cvo);
		}else if("Asave".equals(action)){
			String mid = URLDecoder.decode(request.getParameter("mid"), "UTF-8") ;
			MemberVO mvo = service.selectMember(mid);
			Gson gson = new Gson();
			String jsonStr = gson.toJson(mvo);
			String jsonMsg = URLEncoder.encode(jsonStr, "UTF-8") ;
			response.getWriter().print(jsonMsg);
		}else if("Ajoinlist".equals(action)){
			String ccode = (request.getParameter("ccode") ) ;
			//System.out.println(ccode);
			ArrayList<MemberVO> mlist = service.aJoinClubList(ccode);
			Gson gson = new Gson();
			String jsonStr = gson.toJson(mlist);
			String jsonMsg = URLEncoder.encode(jsonStr, "UTF-8") ;
			response.getWriter().print(jsonMsg);
		}else if("Aupdate".equals(action)){
			ClubVO cvo = new ClubVO();

			String cname = URLDecoder.decode(request.getParameter("cname"), "UTF-8") ;
			String cplace = URLDecoder.decode(request.getParameter("cplace"), "UTF-8") ;
			String ctime = URLDecoder.decode(request.getParameter("ctime"), "UTF-8") ;
			String mid = URLDecoder.decode(request.getParameter("mid"), "UTF-8") ;

			cvo = new ClubVO(null, cname, cplace, ctime, mid);
			service.updateClub(cvo);
			response.getWriter().println("수정되었습니다."); //스마트폰에서 출력

		}else if("Apush".equals(action)){

			String mid = URLDecoder.decode(request.getParameter("mid"),"UTF-8" );
			String ccode = URLDecoder.decode(request.getParameter("ccode"),"UTF-8" );
			ArrayList<MemberVO> mlist = service.aJoinClubList(ccode);
			MemberVO myvo = service.selectMember(mid);

			List<String> list = new ArrayList<String>();
			for(MemberVO mvo:mlist){
				System.out.println(mvo.getRegid());
				list.add(mvo.getRegid());
			}

			String msg = URLEncoder.encode(myvo.getMname()+" : 응급 상황 입니다.","UTF-8");
			Message message = new Message.Builder().addData("msg", msg)
					.build();
			MulticastResult multiResult = sender.send(message, list, 5);

			if (multiResult != null) {

				List<Result> resultList = multiResult.getResults();

				for (Result result : resultList) {

					System.out.println(result.getMessageId());

				}

			}
		}else if("Apart".equals(action)){
			String mid = URLDecoder.decode(request.getParameter("mid"),"UTF-8" );
			MemberVO myvo = service.selectMember(mid);
			System.out.println(myvo.getRegid());
			String msg = URLEncoder.encode(myvo.getMname()+"님 경로를 이탈 하였습니다.","UTF-8");
			Message message = new Message.Builder().addData("msg", msg)
					.build();
			Result Result = sender.send(message, myvo.getRegid(), 5);

			if (Result != null) {
				System.out.println(Result.getMessageId());
			}
		}else if("AclubWhoGPS".equals(action)){
			//클럽 주최사 GPS가져오려고 
			ArrayList<ClubVO> clist = service.listClub();
			String mcode = request.getParameter("ccode"); //폰에서 받은 것
			for(ClubVO cvo : clist){
				if(mcode.equals(cvo.getCcode())){
					String clubWho = cvo.getMid(); //주최자 MID
					MemberVO mvo = service.ClubWhoMember(clubWho);
					Gson gson = new Gson();
					String jsonStr = gson.toJson(mvo);
					String jsonMsg = URLEncoder.encode(jsonStr, "UTF-8") ;
					response.getWriter().print(jsonMsg);
				}else{
					System.out.println("??");
				}
			}				
		}
	}
}
