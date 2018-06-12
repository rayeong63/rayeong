

<%@page import="domain.MyMember1"%>
<%@page import="dao.MyMember1Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
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
	
	//post 한글처리
	request.setCharacterEncoding("utf-8");
	
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="memberinfo.jsp">회원정보조회/수정</a></li>
<li><a href="memberdel.jsp">회원탈퇴</a></li>
</ul>
</nav>
<jsp:useBean id="memberBean" class="domain.MyMember1"/>
<jsp:setProperty property="*" name="memberBean"/>

<%
	int check = dao.updateMember(memberBean);
	
	if (check == 1) {
		%>
		<script>
		alert('수정성공');
		location.href='memberinfo.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert('패스워드 틀림');
			history.back();
		</script>
		<%
	}
%>


<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>