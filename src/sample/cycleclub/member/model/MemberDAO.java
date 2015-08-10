package sample.cycleclub.member.model;

import java.sql.Connection;

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

	}

	public void loginMember(MemberVO mvo){

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