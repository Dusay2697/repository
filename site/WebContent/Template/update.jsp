<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>write.jsp</title>
 <meta name="viewport" content="width=device-width" , initial-scale="1">
 <link rel="stylesheet" href="css/bootstrap.css">
 </head>
 <body>
  <%
      String userID = null;
      if (session.getAttribute("userID") != null){
    	  userID = (String) session.getAttribute("userID");
      }
      if (userID == null){
    		PrintWriter script = response.getWriter();
          	script.println("<script>");
          	script.println("alert('로그인을 하세요.')");
          	script.println("location.href = 'login.jsp'");
          	script.println("</script>");	  
      }
      int bbsID = 0;
      if (request.getParameter("bbsID") != null) {
    	  bbsID = Integer.parseInt(request.getParameter("bbsID"));
      }
      if(bbsID == 0) {
    	PrintWriter script = response.getWriter();
      	script.println("<script>");
      	script.println("alert('유효하지 않은 글입니다.')");
      	script.println("location.href = 'review.jsp'");
      	script.println("</script>");
      }
      Bbs bbs = new BbsDAO().getBbs(bbsID);
      if (!userID.equals(bbs.getUserID())){//게시물 작성자와 로그인한 사람이 같지 않다면 오류 출력
    	  PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('권한이 없습니다.')");
          script.println("location.href = 'review.jsp'");
          script.println("</script>");
      }
 
 
 
 %>
 <div class="container">
  <div class="row">
   <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
    <table class="table table-striped" style="text-align: center; border: 1px solid #ddddd ">
     <thead>
      <tr>
       <th colspan="2" style="background-color: #eeeee; text-align: center;">게시판 글 수정 양식</th>
      </tr>
      </thead>
      <tbody>
       <tr>
        <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
       </tr>
       
       <tr>
        <td><textarea  class="form-control" placeholder="글  내용" name="bbsContent" maxlength="2048" style="height: 350px;" value="<%= bbs.getBbsContent() %>"></textarea></td>
       </tr>
      </tbody>
   
     
     </table>
     <input type="submit" class="btn btn-primary pull-rignt" value="글 수정">
   </form>
  </div>
 </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body> 
</html>