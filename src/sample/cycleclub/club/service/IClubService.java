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

	public void deleteClub(ClubVO cvo);

	public void insertClub(ClubVO cvo);

	public java.util.ArrayList<MemberVO> joinClubList();

	public java.util.ArrayList<ClubVO> listClub();

	public ClubVO selectClub(int ccode);

	public void updateClub(ClubVO cvo);

}