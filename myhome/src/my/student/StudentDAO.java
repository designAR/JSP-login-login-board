package my.student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.board.BoardDTO;

//DAO : Data Access Object - CRUD
public class StudentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public StudentDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			System.err.println("오라클 드라이버 검색 실패!!");
		}
		url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		user = "arang";
		pass = "arang";
	}
	
	public int insertStudent(StudentDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into studentex values(? , ? , ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPass());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected List<StudentDTO> makeList(ResultSet rs) throws SQLException {
		List<StudentDTO> list = new ArrayList<>();
		while(rs.next()) {
			String id = rs.getString("id");
			String pass = rs.getString("pass");
			String name = rs.getString("name");
			String cname = rs.getString("cname");
			StudentDTO dto = new StudentDTO();
			dto.setId(id);
			dto.setPass(pass);
			dto.setName(name);
			dto.setCname(cname);
			list.add(dto);
		}
		return list;
	}
	
	public List<StudentDTO> listStudent() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from studentex";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<StudentDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from studentex where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<StudentDTO> findStudent(String name) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from studentex where name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			List<StudentDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	
}












