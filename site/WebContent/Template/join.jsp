<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();  //콘텍스트명 얻어오기.
 
response.setHeader("Pragma-directive", "no-cache");
response.setHeader("Cache-directive", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>
<title>join.jsp</title>
<meta name="viewport"
       content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />

<link href="join.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.color_red {
		color: red;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">
var rand;
 
//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
function changeCaptcha() {
       rand = Math.random();
       $('#catpcha').html('<img src="simple/CaptChaImg.jsp?rand=' + rand + '"/>');
}
 
$(document).ready(function() {
      
       changeCaptcha(); //캡차 이미지 요청
      
       $('#reLoad').click(function(){ changeCaptcha(); }); //새로고침버튼에 클릭이벤트 등록
      
       //확인 버튼 클릭시
       $('#frmSubmit').click(function(){
             if ( !$('#answer').val() ) {
                    alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
             } else {
                    $.ajax({
                           url: 'simple/captchaSubmit.jsp',
                           type: 'POST',
                           dataType: 'text',
                           data: 'answer=' + $('#answer').val(),
                           async: false,      
                           success: function(resp) {
                                 alert(resp);
                                 $('#reLoad').prop("disabled", true);
                                 $('#answer').prop("disabled", true);
                                 $('#answerChk').val("Y");
                                 $('#frmSubmit').prop("disabled", true);
                           }
                    });
             }
       });
});
</script>
<script type="text/javascript">
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('member_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('member_address2').focus();
            }
        }).open();
    };
    
	$(document).ready( function() {
        
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        $("input[name=member_id]").on("keyup",function(){
        	$("#idConfirm").val("N");
        });
		
		$("#idCheck").on("click",function(){
			
			var member_id = $("input[name=member_id]").val();
            member_id = $.trim( member_id );
            
            if( member_id == "" ){
                alert("ID를 입력하세요.");
                $("input[name=member_id]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var pop_title = "popupOpener";
            
            window.open("", pop_title,"width=600, height=200, resizable=no, scrollbars=no");
             
            var frmData = document.dataform;
            frmData.target = pop_title;
            frmData.action = "idCheckAction.jsp";
             
            frmData.submit();
            
		});
		
        $("#join").on("click",function(){
            //Validation Check
            // input 태그는 반드시 val()을 써준다.
            var member_id = $("input[name=member_id]").val();
            member_id = $.trim( member_id );
            
            if( member_id == "" ){
                alert("ID를 입력하세요.");
                $("input[name=member_id]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            //중복체크 여부
            if( $("#idConfirm").val() == 'N'){
                alert("아이디 중복체크를 하세요.");
                $("input[name=member_id]").focus();   
                return;
            };
            
            var member_pwd = $("input[name=member_pwd]").val();
            member_pwd = $.trim( member_pwd );
            
            if( member_pwd == "" ){
                alert("패스워드를 입력하세요.");
                $("input[name=member_pwd]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var chkPwd = $("input[name=chkPwd]").val();
            chkPwd = $.trim( chkPwd );
            
            if( chkPwd == "" ){
                alert("패스워드확인을 입력하세요.");
                $("input[name=chkPwd]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            if( chkPwd != member_pwd ){
                alert("패스워드가 불일치합니다.");
                $("input[name=chkPwd]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
          
            var member_name = $("input[name=member_name]").val();
            member_name = $.trim( member_name );
            
            if( member_name == "" ){
                alert("이름을 입력하세요.");
                $("input[name=member_name]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var member_postcode = $("input[name=member_postcode]").val();
            member_postcode = $.trim( member_postcode );
            
            if( member_postcode == "" ){
                alert("우편번호를 입력하세요.");
                $("input[name=member_postcode]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var member_address = $("input[name=member_address]").val();
            member_address = $.trim( member_address );
            
            if( member_address == "" ){
                alert("주소를 입력하세요.");
                $("input[name=member_address]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var member_number = $("input[name=member_number]").val();
            member_number = $.trim( member_number );
            
            if( member_number == "" ){
                alert("휴대폰 번호를 입력하세요.");
                $("input[name=member_number]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

            if ( !regExp.test( member_number ) ) {
                  alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
                  $("input[name=member_number]").focus();
                  return;
            };
            
            var member_email = $("input[name=member_email]").val();
            member_email = $.trim( member_email );
            
            if( member_email == "" ){
                alert("이메일을 입력하세요.");
                $("input[name=member_email]").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            };
            
            var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 

            if ( !regExp.test( member_email ) ) {
                  alert("잘못된 이메일입니다. 이메일 형식은 ex) abc123@naver.com ");
                  $("input[name=member_email]").focus();
                  return;
            };
            
            if ( $("#answerChk").val() == 'N' ){
            	alert("자동등록 방지를 입력하고 확인버튼을 클릭해주세요.")
            	return;
            }
            
            $("#dataform").attr("action", "joinAction.jsp");
            $("#dataform").submit();
            
      	});
	});
</script>
</head>
<body>
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

 <%--회원가입 화면 내용--%>
 <div id="banner" align="center">
   <img src="<%=request.getContextPath()%>/image/banner2.jpg" width="1000" height="110" >
 </div>
 <div id="help" >홈 > 회원가입</div>
 <p id="ment21">회원 정보</p>
 <p id="line1"></p>
<form id="dataform" name="dataform" action="joinAction.jsp" method="post"><!-- 회원가입 완료 시 메인화면인 main.jsp파일로 넘어간다. -->
 <table id="form"  width="720" align="center" style=" position : relative; top: 80px; background-color: rgb(246, 239, 239);">
  <tr>
   <td align="left">아이디<span class="color_red">*</span></td>
   <td>
   		<input type="text" name="member_id"> <input id="idCheck" type="button" value="아이디 중복확인"/>
   		<input id="idConfirm" type="hidden" value="N"/>   
   </td>
  </tr>
  <tr>
   <td align="left">비밀번호<span class="color_red">*</span></td>
   <td><input type="password" name="member_pwd"></td>
  </tr>
  <tr>
   <td align="left">비밀번호 확인<span class="color_red">*</span></td>
   <td><input type="password" name="chkPwd"></td>
  </tr>
  <tr>
   <td align="left" >이름<span class="color_red">*</span></td>
   <td><input type="text" name="member_name"></td>
  </tr>
  <tr>
   <td align="left" >주소<span class="color_red">*</span></td>
   <td>
   		<input type="text" id="member_postcode" name="member_postcode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="member_address" name="member_address" placeholder="주소">
		<input type="text" id="member_address2" name="member_address2" placeholder="상세주소">
	</td>
  </tr>
  <tr>
   <td align="left" >휴대 전화<span class="color_red">*</span></td>
   <td><input type="text" name="member_number"></td>
  </tr>
  <tr>
   <td align="left" >이메일<span class="color_red">*</span></td>
   <td><input type="text" name="member_email"></td>
  </tr>
 </table>
</form>
 <p id="ment21">추가정보</p>
 <p id="line1"></p>
 <table width="720" align="center" style="background-color: rgb(246, 239, 239); position : relative; top: 80px;">
  <tr>
   <td align="left" style="width: 186px;" >응원하는 팀</td>
   <td><input type="text" name="member_team"></td>
  </tr>
  <tr>
   <td align="left" style="width: 186px;">생년월일</td>
   <td><input type="text" name="member_birth" placeholder="YYYY-MM-DD"></td>
  </tr>
 </table>
 <br/>
 <table width="720" align="center" style="background-color: rgb(246, 239, 239); position : relative; top: 80px;">
 	<tr>
	   <td align="left">이메일 수신동의</td>
	   <td><input type="checkbox" name="member_spam" checked="checked"/><small>정보 메일을 받겠습니다.</small></td>
	  </tr>
	  <tr>
	   <td align="left">sms수신 동의</td>
	   <td><input type="checkbox" name="member_sms" checked="checked" /><small>휴대폰 문자 메시지를 받겠습니다.</small></td>
	  </tr>
	  <tr>
	   <td align="left">자동등록 방지</td>
	   <td>
	   	<div id="catpcha"></div>
	       <div id="audiocatpch" style="display: block;"></div>
	 
	       <input id="reLoad" type="button" value="새로고침" />
	       <br />
	       <input type="text" id="answer" name="answer" value="" />
	       <input type="hidden" id="answerChk" name="answerChk" value="N" />
	       <input type="button" id="frmSubmit" value="확인" />	   	
	   <br/>
	   	<small>자동등록 방지 숫자를 순서대로 입력하세요.</small>
	   </td>
	  </tr>
 </table>
 <br/>
 
 <div style="position: relative; top: 100px; left: 600px;">
	<button id="join" type="button" style="font-size: 16px; color: rgb(241, 196, 15); text-align: center; line-height: 2.5em; background-color: rgb(28, 32, 95);">회원가입</button>
	<button id="cancel" type="button" style="font-size: 16px; color: rgb(241, 196, 15); text-align: center; line-height: 2.5em; background-color: rgb(28, 32, 95);">취소</button> 
 </div>
<!-- </form> -->
 
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