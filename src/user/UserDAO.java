package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// IMPORT문 SQL 과 연동하기위한 객체들 선언.
public class UserDAO {
	private Connection conn;  //데이터베이스와 연동하기위한conn 선언
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";//도메인주소
			String dbID = "root"; //데이터베이스에 등록된 db아이디 
			String dbPassword="root"; //데이터베이스에 등록된db패스워드
			Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc드라이버와 연결.
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword); //url,id,password를 입력받아 sql과연결.
			 //db와 연결하는 과정
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword){ //실질적인 로그인 메서드 
		String SQL = "SELECT userPassword FROM USER WHERE userID=?"; //sql명령문 선언 
		try {
			pstmt = conn.prepareStatement(SQL); //pstmt 변수에 sql문장 저장. 
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; //로그인성공
			
				else
					return 0; // 비밀번호 불일치 
			}
			return -1; //아이디가없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
		    pstmt.setString(1, user.getUserID());
		    pstmt.setString(2, user.getUserPassword());
		    pstmt.setString(3, user.getUserName());
		    pstmt.setString(4, user.getUserGender());
		    pstmt.setString(5, user.getUserEmail());
		    return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	

}
