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
	//���
	function useId(){
		var member_id = $("input[name=member_id]").val();
		member_id = $.trim( member_id );
		
		if( member_id == "" ){
		    alert("ID�� �Է��ϼ���.");
		    $("input[name=member_id]").focus();
		    return; // ���� ������ ������ ���� �ʴ´�.
		};
		if( $("#idConfirm").val == 'N' ){
			alert("ID�� Ȯ�����ּ���");
			return; // ���� ������ ������ ���� �ʴ´�.
		};
		
		opener.document.getElementById('idConfirm').value = 'Y';
		close();
	};
	
	//���
	function cancelBtn(){
		close();
	};

  <%
	  MemberDAO MemberDAO = new MemberDAO();
	  boolean result = MemberDAO.idCheck(member.getMember_id());
	  if (!result){// ��� ������ id 
  %>
      alert('��밡���� ���̵��Դϴ�.');
      document.getElementById('idConfirm').value = 'Y';
      var btnItem = "<input type='button' id='useBtn' value='���' onclick='useId();'/>"
    	  +"<input type='button' id='cancelBtn' value='���' onclick='cancelBtn();'/>";  
	  $("#btnBox").html(btnItem);
  <% } else { %>//�̹� �ִ� id
 		alert('�̹� ������� ���̵��Դϴ�.');
 		$("#btnBox").html("<input type='button' id='cancelBtn' value='���' onclick='cancelBtn();'/>");
  <% } %> 
  
</script>
</body>
</html>