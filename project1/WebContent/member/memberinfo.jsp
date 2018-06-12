<%@page import="domain.MyMember1"%>
<%@page import="dao.MyMember1Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK CENTER</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"><img src="../images/center/books.jpg"
 width="971" height="174"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="memberinfo.jsp">회원정보조회/수정</a></li>
<li><a href="memberdel.jsp">회원탈퇴</a></li>
<li><a href="#">:::</a></li>
<li><a href="#">:::</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
	//세션값 가져오기
	String id = (String) session.getAttribute("id");

	//세션값 없으면 loginForm.jsp이동
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}		
	
	//DB 객체 새성
	MyMember1Dao dao = MyMember1Dao.getInstance();
	MyMember1 bean = dao.getMember(id);
	
	//gender 기본값 "남"
	String gender = bean.getGender();
	if(gender == null){
		gender = "여";
	}	
%>
<article>
<h1>회원정보 조회</h1>
<form action="memberinfoupdate.jsp" id="join" method="post" name="frm">
<fieldset>
<legend>Member Info</legend>
<label>User ID</label>
	<input type="text" name="id" value="<%=bean.getId() %>"><br>
<label>Password</label>
	<input type="password" name="passwd"><br>  
<label>Name</label>
	<input type="text" name="name" value="<%=bean.getName()%>"><br>
<label>E-Mail</label>
	<input type="text" name="email" value="<%=bean.getEmail() %>"><br>
 <label>Gender</label>
	<input type="radio" name="gender" value="여자" 
		  <%if (gender.equals("여자") || gender.equals(null)) {%>checked<%} %>> 여자
		  <input type="radio" name="gender" value="남자" 
		  <%if (gender.equals("남자")) {%>checked<%} %>> 남자<br><br>
<label>Phone Number</label>
	<input type="text" name="tel" value="<%=bean.getTel()%>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원정보수정" class="submit">
</div>
</form>
</article>

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>