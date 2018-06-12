<%@page import="domain.Board1"%>
<%@page import="dao.Board1Dao"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp이동
	if (id == null) {
		response.sendRedirect("../member/login.jsp");
		return;
	}
	
	// int num  String pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// DB객체생성
	Board1Dao dao = Board1Dao.getInstance();
	Board1 board = dao.getBoard(num);
%>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">도서목록</a></li>
<li><a href="../center/rental.jsp">도서대여</a></li>
<li><a href="../center/fnotice.jsp">도서자료다운로드</a></li>
<li><a href="#">:::</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Notice Update</h1>


<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" name="frm">
<input type="hidden" name="num" value="<%=num%>"> <!-- 글번호 숨기기 form안에 어디든 위치가능 -->
<table id="notice">
<tr><th>저자명</th>
	<td><input type="text" name="name" value="<%=board.getName() %>"></td></tr>
<tr><th>패스워드</th>
	<td><input type="password" name="passwd"></td></tr>
<tr><th>도서명</th>
	<td><input type="text" name="subject" value="<%=board.getSubject() %>"></td></tr>
<tr><th>분류</th>
	<td>
	<select name="type">
	<option>:::선택:::</option>
	<option>소설</option>
	<option>시/에세이</option>
	<option>인문</option>
	<option>가정/생활/요리</option>
	<option>어린이</option>
	</select>
	</td></tr>	
<tr><th>책정보</th>
	<td><textarea rows="13" cols="40" name="content"><%=board.getContent() %></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn">
<input type="reset" value="다시작성" class="btn">
<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
</form>


<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>