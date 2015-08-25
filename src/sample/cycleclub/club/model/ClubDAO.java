package sample.cycleclub.club.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sample.cycleclub.member.model.MemberVO;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:57
 */
public class ClubDAO implements IClubDAO {
	
	public MemberVO ClubWhoMember(String mid){
		Connection con = null;
		MemberVO member = new MemberVO();
		String sql = "select * from cyclemember where mid = ?";
		try{
			con= getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			ResultSet rs = pstmt.executeQuery();
			/*private String mcode;
			private double mgpsx;
			private double mgpsy;
			private String mid;
			private int mjoin;
			private String mname;
			private String mphone;
			private String mpw;
			private String regid;*/
			while(rs.next()){
				 String mgpsx = rs.getString("mgpsx");
				 String mgpsy = rs.getString("mgpsy");
				 Double gpslat = Double.parseDouble(mgpsx);
				 Double gpslon = Double.parseDouble(mgpsy);
				 String mid1 = rs.getString("mid");
				 String mcode = rs.getString("mcode");
				 String mname = rs.getString("mname");
				 String mphone = rs.getString("mphone");
				 String mpw = rs.getString("mpw");
				 String regid = rs.getString("regid");
				 member = new MemberVO(mcode, gpslat, gpslon, mid1, 1, mname, mphone, mpw, regid);
			}
		}catch(SQLException e){
			throw new RuntimeException(e.getMessage());
		}finally{
			closeConnection(con);
		}
		return member;
	}

	public void deleteClub(ClubVO cvo) {
		Connection con=null;
		//ClubVO club = new ClubVO();
		String sql = "delete from cycleclub where (ccode=?) and (mid=?)"; //"delete from cycleclub where (ccode ,mid) values(?,?)";
		try{
			con= getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cvo.getCcode());
			pstmt.setString(2, cvo.getMid());
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			throw new RuntimeException(e.getMessage());
		}finally{
			closeConnection(con);
		}
		return;
	}

	public ClubVO detailClub(ClubVO cvo) {
		//모임 상세
		Connection con = null;
		ClubVO club = new ClubVO();
		String sql = "select * from cycleclub where ccode = ?";
		try{
			con= getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cvo.getCcode());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				 String cname = rs.getString("cname");
				 String cplace = rs.getString("cplace");
				 String ctime = rs.getString("ctime");
				 String mid = rs.getString("mid");
				 //현재참여인물..? 따로구현해야할듯.
				 club = new ClubVO(cvo.getCcode(), cname, cplace, ctime, mid);
			}
		}catch(SQLException e){
			throw new RuntimeException(e.getMessage());
		}finally{
			closeConnection(con);
		}
		return club;
	}

	public void insertClub(ClubVO cvo) {
		String sql = "insert into cycleclub values(?,?,?,?,?)";
		String sql1 = "select ifnull(max(ccode),0)+1 from cycleclub";
		String sql2 = "update cyclemember set mcode=?,mjoin=? where mid=?";
		Connection con = null;
		String numSet=null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql1);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
				if(Integer.parseInt(rs.getString("ifnull(max(ccode),0)+1"))<10){
					numSet="000"+rs.getString("ifnull(max(ccode),0)+1");
				}else if(Integer.parseInt(rs.getString("ifnull(max(ccode),0)+1"))<100){
					numSet="00"+rs.getString("ifnull(max(ccode),0)+1");
				}else if(Integer.parseInt(rs.getString("ifnull(max(ccode),0)+1"))<1000){
					numSet="0"+rs.getString("ifnull(max(ccode),0)+1");
				}else {
					numSet=rs.getString("ifnull(max(ccode),0)+1");
				}
			  cvo.setCcode(numSet);
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, cvo.getCcode());
			stmt.setString(2, cvo.getCname());
			stmt.setString(3, cvo.getCplace());
			stmt.setString(4, cvo.getCtime());
			stmt.setString(5, cvo.getMid());
			stmt.executeUpdate();
			
			stmt = con.prepareStatement(sql2);
			stmt.setString(1, numSet);
			stmt.setString(2, "1");
			stmt.setString(3, cvo.getMid());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}

	public java.util.ArrayList<MemberVO> joinClubList() {
		ArrayList<MemberVO> mlist = new ArrayList<MemberVO>();
		String sql = "select * from cyclemember";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setMcode(rs.getString("mcode"));
				mvo.setMgpsx(rs.getDouble("mgpsx"));
				mvo.setMgpsy(rs.getDouble("mgpsy"));
				mvo.setMid(rs.getString("mid"));
				mvo.setMjoin(rs.getInt("mjoin"));
				mvo.setMname(rs.getString("mname"));
				mvo.setMphone(rs.getString("mphone"));
				mvo.setMpw(rs.getString("mpw"));
				mlist.add(mvo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return mlist;
	}
	
	public java.util.ArrayList<MemberVO> aJoinClubList(String ccode) {
		ArrayList<MemberVO> mlist = new ArrayList<MemberVO>();
		String sql = "select * from cyclemember where mcode=?";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, ccode);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setMcode(rs.getString("mcode"));
				mvo.setMgpsx(rs.getDouble("mgpsx"));
				mvo.setMgpsy(rs.getDouble("mgpsy"));
				mvo.setMid(rs.getString("mid"));
				mvo.setMjoin(rs.getInt("mjoin"));
				mvo.setMname(rs.getString("mname"));
				mvo.setMphone(rs.getString("mphone"));
				mvo.setMpw(rs.getString("mpw"));
				mvo.setRegid(rs.getString("regid"));
				mlist.add(mvo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return mlist;
	}

	public java.util.ArrayList<ClubVO> listClub() {
		ArrayList<ClubVO> clist = new ArrayList<ClubVO>();
		String sql = "select * from cycleclub";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				ClubVO cvo = new ClubVO();
				cvo.setCcode(rs.getString("ccode"));
				cvo.setCname(rs.getString("cname"));
				cvo.setCplace(rs.getString("cplace"));
				cvo.setCtime(rs.getString("ctime"));
				cvo.setMid(rs.getString("mid"));
				clist.add(cvo);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return clist;
	}

	public ClubVO selectClub(String ccode){
			String sql = "select * from cycleclub where ccode=?";
			ClubVO club = new ClubVO();
			Connection con = null;
			try {
				con = getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, ccode);
				ResultSet rs = stmt.executeQuery();
				if(rs.next()){
					club.setCcode(rs.getString("ccode"));
					club.setCname(rs.getString("cname"));
					club.setCplace(rs.getString("cplace"));
					club.setCtime(rs.getString("ctime"));
					club.setMid(rs.getString("mid"));
				}
			} catch (Exception e){
				throw new RuntimeException(e.getMessage());
			} finally {
				closeConnection(con);
			}
			return club;
		}
	
	public MemberVO selectMember(String mid){
		String sql = "select * from cyclemember where mid=?";
		MemberVO member = new MemberVO();
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, mid);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				member.setMcode(rs.getString("mcode"));
				member.setMgpsx(rs.getDouble("mgpsx"));
				member.setMgpsy(rs.getDouble("mgpsy"));
				member.setMid(rs.getString("mid"));
				member.setMjoin(rs.getInt("mjoin"));
				member.setMname(rs.getString("mname"));
				member.setMphone(rs.getString("mphone"));
				member.setMpw(rs.getString("mpw"));
				member.setRegid(rs.getString("regid"));
			}
		} catch (Exception e){
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return member;
	}
	
	public void updateClub(ClubVO cvo) {
		 Connection con = null;
	        String sql = "update cycleclub set cname=?, cplace=?, ctime=?"
	                + "where mid=?";
	        try{
	            con= getConnection();
	            PreparedStatement pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, cvo.getCname());
	            pstmt.setString(2, cvo.getCplace());
	            pstmt.setString(3, cvo.getCtime());
	            pstmt.setString(4, cvo.getMid());
	            pstmt.executeUpdate();
	             
	        }catch(SQLException e){
	            throw new RuntimeException(e.getMessage());
	        }finally{
	            closeConnection(con);
	        }
	}
	
	public void joinClub(MemberVO mvo, ClubVO cvo) {
		Connection con = null;
		String sql = "update cyclemember set mjoin=?, mcode=? where mid=?";
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, cvo.getCcode());
			pstmt.setString(3, mvo.getMid());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	} 
	
	public void unjoinClub(MemberVO mvo) {
		Connection con = null;
		String sql = "update cyclemember set mjoin=?, mcode=? where mid=?";
		try {
			con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, null);
			pstmt.setString(3, mvo.getMid());
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}
	
	public void deleteclubmember(ClubVO cvo) {
		String sql = "update cyclemember set mcode=null, mjoin=0 where (mcode=?) and (mid=?)";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, cvo.getCcode());
			stmt.setString(2, cvo.getMid());
			stmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}

	public Connection getConnection() {
		DataSource ds = null; // javax.sql.DataSource
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MariaDB");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// nothing
			}
		}
	}// end closeConnection
}