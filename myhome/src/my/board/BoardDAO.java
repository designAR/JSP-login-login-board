package my.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	String url, user, pass;
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		user = "arang";
		pass = "arang";
	}
	
	protected List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			list.add(dto);
		}
		return list;
	}
	
	public List<BoardDTO> listBoard() throws SQLException {
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "select * from boardex order by num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<BoardDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int insertBoard(BoardDTO dto) throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "insert into boardex values(board_seq.nextval, ?,?,?,?,sysdate,0,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getIp());
			int res = pstmt.executeUpdate();
			return res;
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	
	protected void plusReadcount(int num)throws SQLException{
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "update boardex set readcount = readcount + 1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public BoardDTO getBoard(int num, String mode) throws SQLException {
		try {
			if (mode.equals("content")) {
				plusReadcount(num);
			}
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "select * from boardex where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			List<BoardDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int deleteBoard(int num, String passwd) throws SQLException {
		try {
			BoardDTO dto = getBoard(num, "password");
			if (dto.getPasswd().equals(passwd)) {
				conn = DriverManager.getConnection(url, user, pass);
				String sql = "delete from boardex where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				int res = pstmt.executeUpdate();
				return res;
			}else {
				return -1;
			}
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	public int updateBoard(BoardDTO dto) throws SQLException {
		try {
			BoardDTO dto2 = getBoard(dto.getNum(), "password");
			if (dto2.getPasswd().equals(dto.getPasswd())) {
				conn = DriverManager.getConnection(url, user, pass);
				String sql = "update boardex set writer=?, subject=?, "
									+ "email=?, content=? where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getContent());
				pstmt.setInt(5, dto.getNum());
				int res = pstmt.executeUpdate();
				return res;
			}else {
				return -1;
			}
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
	
	
}
