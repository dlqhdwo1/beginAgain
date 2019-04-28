package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;  //데이터베이스와 연동하기위한conn 선언

	private ResultSet rs;
	
	public BbsDAO() {
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
	
	public String getDate(){
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
		
	}
	public int getNext(){
		String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
		
	}
	public int write(String bbsTitle, String userID,String bbsContent) {
		String SQL="INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,bbsTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4,getDate());
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1;//데이터베이스 오류
	
	}

}
