package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	String url, user, pass;
	
	public MemberDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		user = "arang";
		pass = "arang";
	}
	
	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "select name from memberex where ssn1=? and ssn2=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ssn1);
			pstmt.setString(2, ssn2);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			return false;
		}finally {
			if(rs != null)rs.close();
			if(conn != null)conn.close();
		}
	}
	
	public int insertMember(MemberDTO dto) throws SQLException {
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "insert into memberex values"
					+ "(member_seq.nextval, ?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getSsn1());
			pstmt.setString(5, dto.getSsn2());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getHp1());
			pstmt.setString(8, dto.getHp2());
			pstmt.setString(9, dto.getHp3());
			int res = pstmt.executeUpdate();
			return res;
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	protected List<MemberDTO> makeList(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSsn1(rs.getString("ssn1"));
			dto.setSsn2(rs.getString("ssn2"));
			dto.setEmail(rs.getString("email"));
			dto.setHp1(rs.getString("hp1"));
			dto.setHp2(rs.getString("hp2"));
			dto.setHp3(rs.getString("hp3"));
			dto.setJoindate(rs.getString("joindate"));
			list.add(dto);
		}
		return list;
	}
	
	public List<MemberDTO> listMember() throws SQLException {
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "select * from memberex";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int deleteMember(int no) throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "delete from memberex where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			int res = pstmt.executeUpdate();
			return res;
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "select * from memberex where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public int updateMember(MemberDTO dto) throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "update memberex set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHp1());
			pstmt.setString(4, dto.getHp2());
			pstmt.setString(5, dto.getHp3());
			pstmt.setInt(6, dto.getNo());
			int res = pstmt.executeUpdate();
			return res;
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
}
