package sample.cycleclub.club.service;

import sample.cycleclub.club.model.ClubDAO;
import sample.cycleclub.club.model.ClubVO;
import sample.cycleclub.club.model.IClubDAO;
import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public class ClubService implements IClubService {


	public IClubDAO cdao = new ClubDAO();

	public ClubVO detailClub(ClubVO cvo){
		return cdao.detailClub(cvo);
	}

	public void deleteClub(ClubVO cvo){
		cdao.deleteClub(cvo);
	}

	public void insertClub(ClubVO cvo){
		cdao.insertClub(cvo);
	}

	public java.util.ArrayList<MemberVO> joinClubList(){
		return cdao.joinClubList();
	}

	public java.util.ArrayList<ClubVO> listClub(){
		return cdao.listClub();
	}

	public ClubVO selectClub(int ccode){
		return cdao.selectClub(ccode);
	}
	
	public MemberVO selectMember(String mid){
		return cdao.selectMember(mid);
	}

	public void updateClub(ClubVO cvo){
		cdao.updateClub(cvo);
	}
	
	public void joinClub(MemberVO mvo, ClubVO cvo){
		cdao.joinClub(mvo, cvo);
	}
	
	public void unjoinClub(MemberVO mvo){
		cdao.unjoinClub(mvo);
	}
	public void deleteclubmember(ClubVO cvo){
		cdao.deleteclubmember(cvo);
	}
}