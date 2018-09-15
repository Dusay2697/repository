package member;

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
    
	public MemberDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberDto> memberList() {
        String SQL = "SELECT * FROM member WHERE member_id != \"admin\"";
        
        List<MemberDto> result = new ArrayList<MemberDto>();
        
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
				MemberDto member = new MemberDto();
				member.setMember_id(rs.getString("member_id"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_address(rs.getString("member_address"));
				member.setMember_email(rs.getString("member_email"));
				member.setMember_birth(rs.getString("member_birth"));
				result.add(member);
			}
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException s) {}
		}
        return result;
        
    }
	
	public int login(String member_id, String member_pwd) {
        String SQL = "SELECT member_pwd FROM member WHERE member_id = ?";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                if(rs.getString(1).equals(member_pwd))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException s) {}
		}
        return -2; // DB 오류
        
    }
	
	public int join(String member_id, String member_pwd, String member_name, String member_postcode, 
			String member_address, String member_address2, String member_number, String member_email, String member_team, String member_birth) {
		
		String SQL = "INSERT INTO member(member_id, member_pwd, member_name, member_postcode,"
				+ "member_address, member_address2, member_number, member_email, member_team, member_birth)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pwd);
			pstmt.setString(3, member_name);
			pstmt.setString(4, member_postcode);
			pstmt.setString(5, member_address);
			pstmt.setString(6, member_address2);
			pstmt.setString(7, member_number);
			pstmt.setString(8, member_email);
			pstmt.setString(9, member_team);
			pstmt.setString(10, member_birth);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException s) {}
		}
		return -1; // DB 오류
	}
	
	public boolean idCheck(String member_id) {
		
		boolean result = false;
		
		String SQL = "SELECT member_id FROM member WHERE member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException s) {}
		}
		
		return result;
	}
	
}
