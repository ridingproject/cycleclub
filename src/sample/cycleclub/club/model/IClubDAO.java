package sample.cycleclub.club.model;

import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public interface IClubDAO {

	public void deleteClub(ClubVO cvo);

	public ClubVO detailClub(ClubVO cvo);

	public void insertClub(ClubVO cvo);

	public java.util.ArrayList<MemberVO> joinClubList();

	public java.util.ArrayList<ClubVO> listClub();

	public ClubVO selectClub(int ccode);

	public void updateClub(ClubVO cvo);

}