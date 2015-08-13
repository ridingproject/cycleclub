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

	public void joinMember(MemberVO mvo){
		String sql = "insert into cyclemember values(?,?,?,?,?,?,?,?)";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, mvo.getMname());
			stmt.setString(2, mvo.getMid());
			stmt.setString(3, mvo.getMpw());
			stmt.setString(4, mvo.getMphone());
			stmt.setDouble(5, 0);
			stmt.setDouble(6, 0);
			stmt.setString(7, mvo.getMjoin()+"");
			stmt.setString(8, null);
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			closeConnection(con);
		}
	}

	public String loginMember(MemberVO mvo){
		String sql = "select * from cyclemember where mid=?";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, mvo.getMid());
			ResultSet rs = stmt.executeQuery();
			String pw = null;
			if(rs.next()){
				pw = rs.getString("mpw");
			}
			return pw;
		} catch (Exception e) {
			return "error";
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