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
 <%--메뉴--%>
<table width="1600"  align="center">
 <tr id="menu" >
  <td align="left" width="100%">
   <a class="sub" id="site" href="siteInfo.jsp">사이트 소개</a>
   <a class="sub" id="club" href="clubMall.jsp">클럽몰</a>
   <a class="sub" id="view" href="groupViewing.jsp">단체 관람</a>
   <a class="sub" id="sale" href="sale.jsp">특별 세일</a>
    <a class="sub" id="event" href="toto.jsp">이벤트</a>
    <% if ( "admin".equals(userId) ) { %>
    <a class="sub" id="admin" href="admin.jsp">관리자페이지</a>
    <% } %>
  </td>
 </tr>
</table>
 <%--메인 내용--%>
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