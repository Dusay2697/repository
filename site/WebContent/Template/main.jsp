<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main.jsp</title>
<link href="main.css?asf" rel="stylesheet" type="text/css">
</head>
<body>
<%--��� �޴�--%>
<table width="960" height="200" align="center">
 <tr>
  <td height="43" align="center"  >
     <a class="left" id="notice" href="notice.jsp">��������</a>
     <a class="left" id="faq" href="faq.jsp">FAQ</a>
     <a class="left" id="review" href="review.jsp">����</a>
     <%
	     String userId = (String)session.getAttribute("userId");
	     if( ("").equals(userId) || userId == null ){ 
     %>
    	<a class="right" id="agree" href="agree.jsp">ȸ������</a> 
  	    <a class="right" id="login1" href="login.jsp">�α���</a> 
     <%	}else{ %>
     	<a class="right" id="myinfo" style="position: relative; left: 200px;" href="#"><%=session.getAttribute("userId") %>��</a>
    	<a class="right" id="logout" style="position: relative; left: 230px;" href="logoutAction.jsp">�α׾ƿ�</a>
     <%	} %>
     <a class="right" id="basket" href="#">��ٱ���</a>
     <a class="right" id="order" href="#">�ֹ���ȸ</a>
    <%--�ΰ� �̹���--%>
    <jsp:include page="top.jsp"/>   
  </td>
 </tr>
</table>
 <%--�޴�--%>
<table width="1600"  align="center">
 <tr id="menu" >
  <td align="left" width="100%">
   <a class="sub" id="site" href="siteInfo.jsp">����Ʈ �Ұ�</a>
   <a class="sub" id="club" href="clubMall.jsp">Ŭ����</a>
   <a class="sub" id="view" href="groupViewing.jsp">��ü ����</a>
   <a class="sub" id="sale" href="sale.jsp">Ư�� ����</a>
    <a class="sub" id="event" href="toto.jsp">�̺�Ʈ</a>
    <% if ( "admin".equals(userId) ) { %>
    <a class="sub" id="admin" href="admin.jsp">������������</a>
    <% } %>
  </td>
 </tr>
</table>
 <%--���� ����--%>
<table width="960"  align="center">
 <tr>
  <td height="500" align="center">
   <jsp:include page="mainPage.jsp"/>
  </td>
 </tr>
  <%--FOOTER--%>
 <tr>
  <td id="bm" >
   <jsp:include page="bottom.jsp"/>		
  </td>
</tr>

</table>
</body>
</html>