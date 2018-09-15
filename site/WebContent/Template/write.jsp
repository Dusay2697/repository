<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>write.jsp</title>
 <link href="board.css" rel="stylesheet" type="text/css">
 </head>
 <body>
  <%
      String userID = null;
      if (session.getAttribute("userID") != null){
    	  userID = (String) session.getAttribute("userID");
      }
 
 
 
 %>
 <%--상단 메뉴--%>
<table width="960" height="200" align="center">
 <tr>
  <td height="43" align="center"  >
     <a class="left" id="notice" href="notice.jsp">공지사항</a>
     <a class="left" id="faq" href="faq.jsp">FAQ</a>
     <a class="left" id="review" href="review.jsp">리뷰</a>
     
     <a class="right" id="agree" href="agree.jsp">회원가입</a>
     <a class="right" id="login1" href="login.jsp">로그인</a>
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
   <a class="sub" id="site" href="siteInfo">사이트 소개</a>
   <a class="sub" id="club" href="clubMall">클럽몰</a>
   <a class="sub" id="view" href="groupViewing">단체 관람</a>
   <a class="sub" id="sale" href="sale">특별 세일</a>
    <a class="sub" id="event" href="event">이벤트</a>
  </td>
 </tr>
</table>

 <%--리뷰게시판 글쓰기 화면 내용--%>
 <div id="banner" align="center">
   <img src="<%=request.getContextPath()%>/image/banner2.jpg" width="1000" height="110" >
 </div>
 <div id="help" >홈 > 리뷰게시판 > 글쓰기</div>
  <div class="container">
  <div class="row">
   <form method="post" action="writeAction.jsp">
    <table  style="text-align: center; border: 1px solid #ddddd ">
     <thead>
      
      </thead>
      <tbody>
       <tr>
        <td><input type="text"  placeholder="글 제목" name="bbsTitle" maxlength="50" style="width:1000px;"></td>
       </tr>
       
       <tr>
        <td><textarea placeholder="글  내용" name="bbsContent" maxlength="2048" style="height: 600px; width:1000px;"></textarea></td>
       </tr>
      </tbody>
   
     
     </table>
     <input type="submit"  value="글쓰기">
   </form>
  </div>
 </div>

 
  <%--FOOTER--%>
  <table width="960" align="center">
 <tr>
  <td id="bm" >
   <jsp:include page="bottom.jsp"/>		
  </td>
</tr>
</table>

</body> 
</html>