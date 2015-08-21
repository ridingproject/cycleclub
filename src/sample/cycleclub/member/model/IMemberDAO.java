package sample.cycleclub.member.model;


/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public interface IMemberDAO {

	public void updateMember(String mid,Double mgpsx,Double mgpsy);
	
	public boolean joinMember(MemberVO mvo);

	public String loginMember(MemberVO mvo);
	
	public void registRegid(MemberVO mvo);
}