<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>faq.jsp</title>
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

 <%--faq게시판 화면 내용--%>
 <div id="banner" align="center">
   <img src="<%=request.getContextPath()%>/image/banner2.jpg" width="1000" height="110" >
 </div>
 <div id="help" >홈 > FAQ게시판</div>
 <div>
  <div class="row">
   <table id="tb" style="text-align: center;" width="960" >
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
         
     %>
      <tr>
       <td>1</td>
       <td><a href="#">배송관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-01</td>
      </tr>
      <tr>
       <td>2</td>
       <td><a href="#">결제관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-08</td>
      </tr>
      <tr>
       <td>3</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>4</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>5</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>6</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>7</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>8</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>9</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>10</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
      <tr>
       <td>11</td>
      <td><a href="#">환불관련 faq입니다.</td></a>
       <td>관리자</td>
       <td>2018-07-11</td>
      </tr>
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



