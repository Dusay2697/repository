<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>mainPage.jsp</title>
<link href="mainPage.css" rel="stylesheet" type="text/css">
</head>
<body>


<div id="content_home" >
	<div id="homeing">
		<a href="/"><img src="<%=request.getContextPath()%>/image/banner2.jpg" style="height:100px;"/></a>
	</div>
	<br/>

	<div id="slide">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
	<input type="radio" name="pos" id="pos3">
	<input type="radio" name="pos" id="pos4">
	<ul>
		<li><a href="#"><img src="<%=request.getContextPath()%>/image/banner.png" style= "max-width:909px;"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/image/banner.png" style= "max-width:909px;"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/image/banner.png" style= "max-width:909px;"/></a></li>
		<li><a href="#"><img src="<%=request.getContextPath()%>/image/banner.png" style= "max-width:909px;"/></a></li>
	</ul>
	<p class="pos">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<label for="pos3"></label>
		<label for="pos4"></label>
	</p>
</div>

	<br />
	<br />
	<br />
	


	<div id="group" style="float: left; width: 50%;">
		<h2 class="board">단체 관람</h2>
        <hr class="lines" style="margin:5px 0;">
		<table class="applist">
		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>Liverpool vs. Real Madrid Champions League Final Guide</td>
		</tr>

		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>dddddddddddddddddsssssssssssssssssssssssssaaaaa</td>
		</tr>

		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>You can write yoddddddddddddddddfeeeeeelllllllllllllllllleeeeecc</td>
		<td class="Edit"><i><a href="#"></a></i></td>
		<td class="Edit"><i><a href="#"></a></i></td>
		</tr>
		</table>
		</div>

	<div id="notice" >
			<h2 class="board">공지사항</h2>
        <hr class="lines" style="margin:5px 0;">
		<table class="applist">
		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>Manchester City League champion uniforms are warehousing</td>
		</tr>

		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>dddddddddddddddddsssssssssssssssssssssssssaaaaa</td>
		<td class="Edit"><i><a href="#"></a></i></td>
		<td class="Edit"><i><a href="#"></a></i></td>
		</tr>

		<tr>
		<td><b><i><a href="#">.</a></i></b></td>
		<td>You can write yoddddddddddddddddfeeeeeelllllllllllllllllleeeeecc</td>
		<td class="Edit"><i><a href="#"></a></i></td>
		<td class="Edit"><i><a href="#"></a></i></td>
		</tr>
		</table>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<hr class="line" style="margin:5px 0;">
	
	<div id="Bitem">
		<h3 >Best Item</h3>
	</div>
	<div id="goods">
	<ul>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/M.png" style="height:150px;"/></dt><dd>Mancity 17/18 home kit</dd><dd>price: 120,000</dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/L.png" style="height:150px;"/></dt><dd>Liverpool 17/18 Away kit</dd><dd>price: 100,000</dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/C.png" style="height:150px;"/></dt><dd>Chelsea 17/18 home kit</dd><dd>price: 120,000 </dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/A.png" style="height:150px;"/></dt><dd>Arsnal 17/18 home kit</dd><dd>price: 100,000 </dd></dl></a>
		</li>
		
		
	</ul>
</div>

	<div id="Nitem">
		<h3 >New Item</h3>
	</div>

	<div id="goods">
	<ul>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/M.png" style="height:150px;"/></dt><dd>Mancity 17/18 home kit</dd><dd>price: 120,000</dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/L.png" style="height:150px;"/></dt><dd>Liverpool 17/18 Away kit</dd><dd>price: 100,000</dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/C.png" style="height:150px;"/></dt><dd>Chelsea 17/18 home kit</dd><dd>price: 120,000 </dd></dl></a>
		</li>
		<li>
			<a href="#none"><dl><dt><img src="<%=request.getContextPath()%>/image/A.png" style="height:150px;"/></dt><dd>Arsnal 17/18 home kit</dd><dd>price: 100,000 </dd></dl></a>
		</li>
		
		
	</ul>
</div>
<style type="text/css">

	*{margin:0;padding:0;}
	ul,li{list-style:none;}
	div#slide{height:350px;position:relative;overflow:hidden;}
	div#slide ul{width:400%;height:100%;transition:1s; position:relative; top:110px;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:25%;height:100%;}

	#slide input{display:none;}
	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
	#pos1:checked~.pos>label:nth-child(1){background:#1c205f;}
	#pos2:checked~.pos>label:nth-child(2){background:#1c205f;}
	#pos3:checked~.pos>label:nth-child(3){background:#1c205f;}
	#pos4:checked~.pos>label:nth-child(4){background:#1c205f;}

</style>

</div>
</body>
</html>