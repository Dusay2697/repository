<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>review.jsp</title>
 <link href="board.css" rel="stylesheet" type="text/css">
 <style type="text/css">
     a,a:hover {
       color: #000000;
       text-decoration: none;
     }
 </style>
 
 </head>
 <body>
 <%
      String userID = null;
      if (session.getAttribute("userID") != null){
    	  userID = (String) session.getAttribute("userID");
      }
      int pageNumber = 1;
      if (request.getParameter("pageNumber") != null){
    	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
 
 
 %>
 <%--상단 메뉴--%>
<table width="960" height="200" align="center">
 <tr>
  <td height="43" align="center"  >
     <a class="left" id="notice" href="notice.jsp">공지사항</a>
     <a class="left" id="faq" href="faq.jsp">FAQ</a>
     <a class="left" id="review" href="review,jsp">리뷰</a>
     
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

 <%--리뷰 게시판 화면 내용--%>
 <div id="banner" align="center">
   <img src="<%=request.getContextPath()%>/image/banner2.jpg" width="1000" height="110" >
 </div>
 <div id="help" >홈 > 리뷰게시판</div>
<div>
  <div class="row">
   <table id="tb" style="text-align: center;" width="960">
    <thead>
     <tr>
      <th style="background-color: #eeeee; text-align: center;">번호</th>
      <th style="background-color: #eeeee; text-align: center;">제목</th>
      <th style="background-color: #eeeee; text-align: center;">작성자</th>
      <th style="background-color: #eeeee; text-align: center;">작성일</th>
     </tr>
     </thead>
     <tbody>
     <%
          BbsDAO bbsDAO = new BbsDAO();
          ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
          for(int i =0; i <list.size(); i++) {
     %>
      <tr>
         <td><%=list.get(i).getBbsID() %></td>
         <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle() %></a></td><%--제목을 클릭하면 게시물상세내용을 볼수 있도록한다.--%>
         <td><%=list.get(i).getUserID() %></td>
         <td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td><%--시간을 깔끔하게 볼 수 있도록한다.--%>
      </tr>
      <%
          }
      %>
     </tbody>
   </table>
   <%
       if(pageNumber != 1){//1이상일때
   %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>   
  <%
       }if(bbsDAO.nextPage(pageNumber + 1)){
  %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>   
  <%
       }
  %>
  <a href="write.jsp" id="btn">글쓰기</a>
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



