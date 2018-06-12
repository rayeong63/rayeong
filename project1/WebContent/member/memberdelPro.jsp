
<%@page import="dao.MyMember1Dao"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK CENTER</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	//세션값 가져오기
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");

	//세션값 없으면 loginForm.jsp이동
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}	
	
	//DB 객체 생성
	MyMember1Dao dao = MyMember1Dao.getInstance();
	int check = dao.deleteMember(id, passwd);	
	
	if(check ==1){	
			//세션 초기화
			session.invalidate();
			%>
		<script>
			alert('탈퇴되었습니다.');
			
			//"로그아웃" loginForm.jsp이동
			location.href = '../main/main.jsp';
			//세션 초기화
			
					
		</script>
		<% 
		
	}else{
		%>
		<SCRIPT>
			alert('비밀번호가 일치하지 않습니다.');
			history.back();
		</SCRIPT>
		<%
	}
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
