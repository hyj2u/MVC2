package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class FileDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	//create table file(fileName varchar(200),
		//	   fileRealName varchar(200));
	
	//alter table file add(downloadCount int);
	public FileDAO() {
		String dbURL="jdbc:oracle:thin:@127.0.0.1:1521:XE";//oracle url
		String dbID="system";
		String dbPassword ="oracle";
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
	}
	
	public int upload(String fileName, String fileRealName) {
		
		String SQL ="insert into files values(?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, fileName);
			ps.setString(2, fileRealName);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류 
	}
	
	
	public ArrayList<FileDTO> getList(){
		String SQL ="select * from files";
		PreparedStatement ps;
		ArrayList<FileDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(SQL);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				FileDTO file = new FileDTO(rs.getString(1), rs.getString(2));
				list.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;//데이터베이스 오류 
	}
}
