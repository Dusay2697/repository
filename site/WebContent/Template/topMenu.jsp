<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--상단 메뉴--%>
<table width="960" height="200" align="center">
 <tr>
  <td height="43" align="center"  >
     <a class="left" id="notice" href="notice.jsp">공지사항</a>
     <a class="left" id="faq" href="faq.jsp">FAQ</a>
     <a class="left" id="review" href="review.jsp">리뷰</a>
     <%
	     String userId = (String)session.getAttribute("userId");
	     if( ("").equals(userId) || userId == null ){ 
     %>
    	<a class="right" id="agree" href="agree.jsp">회원가입</a> 
  	    <a class="right" id="login1" href="login.jsp">로그인</a> 
     <%	}else{ %>
     	<a class="right" id="myinfo" style="position: relative; left: 200px;" href="#"><%=session.getAttribute("userId") %>님</a>
    	<a class="right" id="logout" style="position: relative; left: 230px;" href="logoutAction.jsp">로그아웃</a>
     <%	} %>
     <a class="right" id="basket" href="#">장바구니</a>
     <a class="right" id="order" href="#">주문조회</a>
    <%--로고 이미지--%>
    <jsp:include page="top.jsp"/>   
  </td>
 </tr>
</table>
</body>
</html>