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
/*		String sql = "select * from cycleclub where ccode=?";

		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, cvo.getCcode());
			ResultSet rs = stmt.executeQuery();
			cvo.setCcode(rs.getString("ccode"));
			cvo.setCname(rs.getString("cname"));
			cvo.setCplace(rs.getString("cplace"));
			cvo.setCtime(rs.getString("ctime"));
			cvo.setMid(rs.getString("mid"));

		} catch (Exception e){
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return cvo;*/
	}

	public void insertClub(ClubVO cvo) {
		String sql = "insert into cycleclub values(?,?,?,?,?)";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, cvo.getCcode());
			stmt.setString(2, cvo.getCname());
			stmt.setString(3, cvo.getCplace());
			stmt.setString(4, cvo.getCtime());
			stmt.setString(5, cvo.getMid());
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

	public ClubVO selectClub(int ccode){
			String sql = "select * from cycleclub where ccode=?";
			ClubVO club = new ClubVO();
			Connection con = null;
			try {
				con = getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setInt(1, ccode);
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