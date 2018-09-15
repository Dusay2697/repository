<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDto" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberDto" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="member_id"/>
<jsp:setProperty name="member" property="member_pwd"/>
<jsp:setProperty name="member" property="member_name"/>
<jsp:setProperty name="member" property="member_postcode"/>
<jsp:setProperty name="member" property="member_address"/>
<jsp:setProperty name="member" property="member_address2"/>
<jsp:setProperty name="member" property="member_number"/>
<jsp:setProperty name="member" property="member_email"/>
<jsp:setProperty name="member" property="member_team"/>
<jsp:setProperty name="member" property="member_birth"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>joinAction.jsp</title>
</head>
<body>
  <%
	  MemberDAO MemberDAO = new MemberDAO();
	  int result = MemberDAO.join(member.getMember_id(), member.getMember_pwd(), member.getMember_name(), member.getMember_postcode(),
			  member.getMember_address(), member.getMember_address2(), member.getMember_number(), member.getMember_email(), member.getMember_team(), member.getMember_birth());
	  if (result == -1){//만약 result가 -1이라면 회원가입 실패
 		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
      	 script.println("alert('회원가입에 실패했습니다.')");
      	 script.println("history.back()");
      	 script.println("</script>");
 		 
 	 }else {
 		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
      	 script.println("location.href='joinDone.jsp'");
      	 script.println("</script>");
 	 }
   %>
</body>
</html>