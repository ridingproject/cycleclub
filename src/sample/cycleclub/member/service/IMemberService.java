package sample.cycleclub.member.service;

import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public interface IMemberService {

	public boolean joinMember(MemberVO mvo);

	public String loginMember(MemberVO mvo);

}