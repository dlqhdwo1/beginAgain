package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// IMPORT�� SQL �� �����ϱ����� ��ü�� ����.
public class UserDAO {
	private Connection conn;  //�����ͺ��̽��� �����ϱ�����conn ����
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword){ //�������� �α��� �޼��� 
		String SQL = "SELECT userPassword FROM USER WHERE userID=?"; //sql��ɹ� ���� 
		try {
			pstmt = conn.prepareStatement(SQL); //pstmt ������ sql���� ����. 
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; //�α��μ���
			
				else
					return 0; // ��й�ȣ ����ġ 
			}
			return -1; //���̵𰡾���
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ���� 
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
		return -1; //�����ͺ��̽� ����
	}
	

}
