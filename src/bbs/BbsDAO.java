package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;  //�����ͺ��̽��� �����ϱ�����conn ����

	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";//�������ּ�
			String dbID = "root"; //�����ͺ��̽��� ��ϵ� db���̵� 
			String dbPassword="root"; //�����ͺ��̽��� ��ϵ�db�н�����
			Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc����̹��� ����.
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword); //url,id,password�� �Է¹޾� sql������.
			 //db�� �����ϴ� ����
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
		return "";//�����ͺ��̽� ����
		
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
		return -1;//�����ͺ��̽� ����
		
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

		return -1;//�����ͺ��̽� ����
	
	}

}