<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WriteAction.jsp</title>
</head>
<body>
  <%
    String userID = null;
    if (session.getAttribute("userID") != null) {
    	userID = (String) session.getAttribute("usrID");
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
    } else {
     if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
         || request.getParameter("bbsTitlet").equals("") || request.getParameter("bbsContent").equals("")) {
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
     	 script.println("alert('입력이 안 된 사항이 있습니다.')");
     	 script.println("history.back()");
     	 script.println("</script>");
     }else {
    	 BbsDAO bbsDAO = new BbsDAO();
    	 int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
    	 if (result == -1){
    		 PrintWriter script = response.getWriter();
        	 script.println("<script>");
         	 script.println("alert('글 수정에 실패했습니다.')");
         	 script.println("history.back()");
         	 script.println("</script>");
    		 
    	 }else {
    		 PrintWriter script = response.getWriter();
        	 script.println("<script>");
         	 script.println("location.href='review.jsp'");
         	 script.println("</script>");
    	 }
     }
    }
   %>
</body>
</html>