<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDto" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.MemberDto" scope="page"></jsp:useBean>
<jsp:setProperty name="member" property="member_id"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>idCheckAction.jsp</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<input id="member_id" name="member_id" type="text" disabled="disabled" value="<%=member.getMember_id() %>"/>  
<input id="idConfirm" type="hidden" value="N"/>  
<br/>


<div id="btnBox"></div>
<script type="text/javascript">
	//사용
	function useId(){
		var member_id = $("input[name=member_id]").val();
		member_id = $.trim( member_id );
		
		if( member_id == "" ){
		    alert("ID를 입력하세요.");
		    $("input[name=member_id]").focus();
		    return; // 밑의 내용은 실행이 되지 않는다.
		};
		if( $("#idConfirm").val == 'N' ){
			alert("ID를 확인해주세요");
			return; // 밑의 내용은 실행이 되지 않는다.
		};
		
		opener.document.getElementById('idConfirm').value = 'Y';
		close();
	};
	
	//취소
	function cancelBtn(){
		close();
	};

  <%
	  MemberDAO MemberDAO = new MemberDAO();
	  boolean result = MemberDAO.idCheck(member.getMember_id());
	  if (!result){// 사용 가능한 id 
  %>
      alert('사용가능한 아이디입니다.');
      document.getElementById('idConfirm').value = 'Y';
      var btnItem = "<input type='button' id='useBtn' value='사용' onclick='useId();'/>"
    	  +"<input type='button' id='cancelBtn' value='취소' onclick='cancelBtn();'/>";  
	  $("#btnBox").html(btnItem);
  <% } else { %>//이미 있는 id
 		alert('이미 사용중인 아이디입니다.');
 		$("#btnBox").html("<input type='button' id='cancelBtn' value='취소' onclick='cancelBtn();'/>");
  <% } %> 
  
</script>
</body>
</html>