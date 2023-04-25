package my.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginCheck {
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public int checkLogin() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1", "arang", "arang");
			String sql = "select passwd from memberex where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch(SQLException e) {}
		}
	}
}


