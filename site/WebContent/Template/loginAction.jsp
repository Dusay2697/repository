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
		  session.setAttribute("userId", member.getMember_id()); // �α��� ���� �� ���ǿ� ���̵� ����
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("location.href = 'main.jsp'");
	      script.println("</script>");
	  }
	  else if (result == 0){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
	      script.println("history.back()");    // ���� �������� ����ڸ� ����
	      script.println("</script>");
	  }
	  else if (result == -1){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('�������� �ʴ� ���̵��Դϴ�.')");
	      script.println("history.back()");    // ���� �������� ����ڸ� ����
	      script.println("</script>");
	  }
	  else if (result == -2){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('DB ������ �߻��߽��ϴ�.')");
	      script.println("history.back()");    // ���� �������� ����ڸ� ����
	      script.println("</script>");
	  }
   %>
</body>
</html>