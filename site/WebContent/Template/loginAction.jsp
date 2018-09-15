<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.MemberDto" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="member_id"/>
<jsp:setProperty name="member" property="member_pwd"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>loginAction.jsp</title>
</head>
<body>
  <%
	  MemberDAO memberDao = new MemberDAO();
	  int result = memberDao.login(member.getMember_id(), member.getMember_pwd());
	  if (result ==1){
		  session.setAttribute("userId", member.getMember_id()); // 로그인 성공 시 세션에 아이디 저장
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("location.href = 'main.jsp'");
	      script.println("</script>");
	  }
	  else if (result == 0){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('비밀번호가 틀립니다.')");
	      script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	      script.println("</script>");
	  }
	  else if (result == -1){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('존재하지 않는 아이디입니다.')");
	      script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	      script.println("</script>");
	  }
	  else if (result == -2){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('DB 오류가 발생했습니다.')");
	      script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	      script.println("</script>");
	  }
   %>
</body>
</html>