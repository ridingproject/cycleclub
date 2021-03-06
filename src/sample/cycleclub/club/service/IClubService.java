package sample.cycleclub.club.service;

import sample.cycleclub.club.model.ClubVO;
import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public interface IClubService {

	public ClubVO detailClub(ClubVO cvo);

	public MemberVO ClubWhoMember(String mid);
	
	public void deleteClub(ClubVO cvo);

	public void insertClub(ClubVO cvo);

	public java.util.ArrayList<MemberVO> joinClubList();

	public java.util.ArrayList<ClubVO> listClub();

	public ClubVO selectClub(String ccode);
	
	public MemberVO selectMember(String mid);

	public void updateClub(ClubVO cvo);

	public void joinClub(MemberVO mvo, ClubVO cvo);
	
	public void unjoinClub(MemberVO mvo);
	
	public void deleteclubmember(ClubVO cvo);
	
	public java.util.ArrayList<MemberVO> aJoinClubList(String ccode);
}