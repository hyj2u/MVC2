package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.User;

public class ReplyDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ReplyDAO() {

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
	
	public int insertReply(Reply reply) {
		String SQL ="insert into bbsreply values(bbsreply_seq.nextVal,?,?,sysdate,?)";
		try {
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, reply.getBr_writer());
			pstmt.setString(2, reply.getBr_content());
			pstmt.setInt(3, reply.getBr_sabun());
		
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Reply> getList(int br_sabun){
		ArrayList<Reply> replyList = new ArrayList<>();
		String SQL = "SELECT * FROM  bbsreply WHERE br_sabun=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, br_sabun);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setBr_num(rs.getInt(1));
				reply.setBr_writer(rs.getString(2));
				reply.setBr_content(rs.getString(3));
				reply.setBr_date(rs.getDate(4));
				reply.setBr_sabun(rs.getInt(5));
				replyList.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return replyList;
	}
}
