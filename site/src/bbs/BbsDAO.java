package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	//접근에 있어 마찰이 생기지 않도록 preparestatedment 삭제
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	  }
	  //현재 시간을 보여주는 함수
	  public String getDate() {
		  String SQL = "SELECT NOW()";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  rs = pstmt.executeQuery();
			  if (rs.next()) {
				  return rs.getString(1);
			  }
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return ""; //데이터베이스 오류가 났을때 retutn
	  }
	  //최근에 쓴 글이 위에 나오도록 하는 함수
	  public int getNext() {
		  String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";//최근에 쓰인 글이 나오도록 하는 것
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  rs = pstmt.executeQuery();
			  if (rs.next()) {
				  return rs.getInt(1) + 1;//그 다음 게시글번호가 들어가도록 하는것
			  }
			  return 1; //첫번째 게시물인 경우
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스 오류가 났을때 return
	  }
	  //글을 쓸 수 있도록 하는 함수
	  public int write(String bbsTitle, String userID, String bbsContent) {
		  String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext());
			  pstmt.setString(2, bbsTitle);
			  pstmt.setString(3, userID);
			  pstmt.setString(4, getDate());
			  pstmt.setString(5, bbsContent);
			  pstmt.setInt(6, 1);//글이 삭제되지않고 보여지는 형태이기때문에 1을 넣는다.
			  return pstmt.executeUpdate();	
			 
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스 오류가 났을때 return
	  }
	  //게시물 수를 제한하기 위한 함수
	  public ArrayList<Bbs> getList(int pageNumber){
		  String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";//한번에 글 목록을 10개까지만 보여준다.
		  ArrayList<Bbs> list = new ArrayList<Bbs>();
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext() - (pageNumber - 1) *10);//페이지 번호가 6을 넘기지 않는다.
			  rs = pstmt.executeQuery();
			  while(rs.next()) {
				  Bbs bbs = new Bbs();
				  bbs.setBbsID(rs.getInt(1));
				  bbs.setBbsTitle(rs.getString(2));
				  bbs.setUserID(rs.getString(3));
				  bbs.setBbsDate(rs.getString(4));
				  bbs.setBbsContent(rs.getString(5));
				  bbs.setBbsAvailable(rs.getInt(6));
				  list.add(bbs);
				
			  }
		  }catch(Exception e) {
			 e.printStackTrace();
		  }
		  return list;  
	  }
	  //페이징 처리를 위한 함수
	  public boolean nextPage(int pageNumber) {//페이징처리를 위함,또한 게시물이 10개밖에 없을땐 페이지가 1개가 보이도록한다.
		  String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";//한번에 글 목록을 10개까지만 보여준다.
	
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, getNext() - (pageNumber - 1) *10);//페이지 번호가 6을 넘기지 않는다.
			  rs = pstmt.executeQuery();
			  if (rs.next()) {
				  return true;
			  }
		  }catch(Exception e) {
			 e.printStackTrace();
		  }
		  return false;  
		  
	  }
	  //게시물 상세페이지 볼 수 있도록 하는 함수
	  public Bbs getBbs(int bbsID) {
		  String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
			
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, bbsID);
			  rs = pstmt.executeQuery();
			  if (rs.next()) {
				  Bbs bbs = new Bbs();
				  bbs.setBbsID(rs.getInt(1));
				  bbs.setBbsTitle(rs.getString(2));
				  bbs.setUserID(rs.getString(3));
				  bbs.setBbsDate(rs.getString(4));
				  bbs.setBbsContent(rs.getString(5));
				  bbs.setBbsAvailable(rs.getInt(6));
				  return bbs;
			  }
		  }catch(Exception e) {
			 e.printStackTrace();
		  }
		  return null;  
		  
	  }
	  //게시물을 수정하는 함수
	  public int update(int bbsID, String bbsTitle, String bbsContent) {
		  String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent= ? WHERE bbsID = ?" ;
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setString(1, bbsTitle);
			  pstmt.setString(2, bbsContent);
			  pstmt.setInt(3, bbsID);
			 
			  return pstmt.executeUpdate();	
			 
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스 오류가 났을때 return
	  }
	  //게시물을 삭제하는 함수
	  public int delete(int bbsID) {
		  String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?" ;
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);
			  pstmt.setInt(1, bbsID);
	
			  return pstmt.executeUpdate();	
			 
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		  return -1; //데이터베이스 오류가 났을때 return
	  }
	  
	}
	


