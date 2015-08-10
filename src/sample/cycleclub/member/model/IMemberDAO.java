package sample.cycleclub.member.model;


/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public interface IMemberDAO {

	public void joinMember(MemberVO mvo);

	public void loginMember(MemberVO mvo);

}