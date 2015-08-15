package sample.cycleclub.member.service;

import sample.cycleclub.member.model.IMemberDAO;
import sample.cycleclub.member.model.MemberDAO;
import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:58
 */
public class MemberService implements IMemberService {

	public IMemberDAO mdao = new MemberDAO();

	public boolean joinMember(MemberVO mvo){
		return mdao.joinMember(mvo);
	}

	public String loginMember(MemberVO mvo){
		return mdao.loginMember(mvo);
	}
}