package sample.cycleclub.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author LSH
 * @version 1.0
 * @created 09-8-2015 ���� 11:12:58
 */
public class MemberDAO implements IMemberDAO {

	public MemberDAO(){

	}

	public void updateMember(String mid,Double mgpsx,Double mgpsy){
		Connection con =null;
		String sql = "update cyclemember set mgpsx=?,mgpsy=? where mid=?";
		try{
			con=getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, mgpsx);
			pstmt.setDouble(2, mgpsy);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
			//System.out.println("updatemember 실행됐움~~~~~~~");
		}catch(SQLException e){
			throw new RuntimeException(e.getMessage());
        }finally{
            closeConnection(con);
        }		
	}
	public boolean joinMember(MemberVO mvo){
		String sql1 = "select count(*) as cnt from cyclemember where mid=?";
		String sql2 = "insert into cyclemember values(?,?,?,?,?,?,?,?,?)";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql1);
			stmt.setString(1, mvo.getMid());
			ResultSet rs = stmt.executeQuery();
			int cnt = 0;
			while(rs.next()){
				cnt = rs.getInt("cnt");
			}
			if(cnt!=0){
				return false;
			}else{
				stmt = con.prepareStatement(sql2);
				stmt.setString(1, mvo.getMname());
				stmt.setString(2, mvo.getMid());
				stmt.setString(3, mvo.getMpw());
				stmt.setString(4, mvo.getMphone());
				stmt.setDouble(5, 0);
				stmt.setDouble(6, 0);
				stmt.setString(7, "0");
				stmt.setString(8, "0000");
				stmt.setString(9, null);
				stmt.executeUpdate();
				return true;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}

	public String loginMember(MemberVO mvo){
		String sql1 = "select count(*) as cnt from cyclemember where mid=?";
		String sql2 = "select * from cyclemember where mid=?";
		Connection con = null;
		String pw = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql1);
			stmt.setString(1, mvo.getMid());
			ResultSet rs = stmt.executeQuery();
			int cnt = 0;
			while(rs.next()){
				cnt = rs.getInt("cnt");
			}
			if(cnt!=1) {
				return "error";
			}else{
				stmt = con.prepareStatement(sql2);
				stmt.setString(1, mvo.getMid());
				rs = stmt.executeQuery();
				if(rs.next()){
					pw = rs.getString("mpw");
				}
			}
		} catch (Exception e) {
			new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
		return pw;
	}
	
	public void registRegid(MemberVO mvo){
		String sql = "update cyclemember set regid=? where mid=?";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, mvo.getRegid());
			stmt.setString(2, mvo.getMid());
			stmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}

	public Connection getConnection() {
		DataSource ds = null; //javax.sql.DataSource
		Connection con = null;
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MariaDB");
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}

	public void closeConnection(Connection con) {
		if(con!=null) {
			try {
				con.close();
			}catch(Exception e) {
				//nothing
			}
		}
	}//end closeConnection
}