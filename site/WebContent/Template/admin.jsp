<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard Template for Bootstrap</title>
    <link href="http://bootstrapk.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://bootstrapk.com/examples/dashboard/dashboard.css" rel="stylesheet">
    <script src="http://bootstrapk.com/assets/js/ie-emulation-modes-warning.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">관리자페이지</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">회원관리 <span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">회원관리</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>회원ID</th>
                  <th>회원이름</th>
                  <th>회원주소</th>
                  <th>이메일</th>
                  <th>생년월일</th>
                </tr>
              </thead>
              <tbody>
          <%
			  MemberDAO memberDao = new MemberDAO();
			  List<MemberDto> result = memberDao.memberList();
			  
			  if ( !result.isEmpty() ){
				  for ( int i = 0; i < result.size(); i++){
					  out.write("<tr>");
					  out.write("<td>");
					  out.print(result.get(i).getMember_id());
					  out.write("</td>");
					  out.write("<td>");
					  out.print(result.get(i).getMember_name());
					  out.write("</td>");
					  out.write("<td>");
					  out.print(result.get(i).getMember_address());
					  out.write("</td>");
					  out.write("<td>");
					  out.print(result.get(i).getMember_email());
					  out.write("</td>");
					  out.write("<td>");
					  out.print(result.get(i).getMember_birth());
					  out.write("</td>");
					  out.write("</tr>");
					  
				  }
			  }
			%>
               
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
