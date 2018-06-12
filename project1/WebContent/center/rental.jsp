<%@page import="sun.security.jca.GetInstance"%>
<%@page import="domain.Board1"%>
<%@page import="dao.Board1Dao"%>
<%@page import="domain.Rental"%>
<%@page import="domain.MyMember1"%>
<%@page import="dao.MyMember1Dao"%>
<%@page import="dao.RentalDao"%>


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
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"><img src="../images/center/books.jpg"
 width="971" height="172"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">도서목록</a></li>
<li><a href="../center/rental.jsp">도서대여</a></li>
<li><a href="../center/rentalinfo.jsp">대여도서목록</a></li>
<li><a href="../center/rentalList.jsp">반납도서목록</a></li>
<li><a href="../center/fnotice.jsp">도서자료다운로드</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Book Rental</h1>
<%
	String result1 = request.getParameter("result");
	if (!(result1 == null || result1.equals(""))) {
		%><p>도서대여 성공했습니다.</p><%
	}
%>

<form action="rentalPro.jsp" method="post" id="join" name="frm">
<fieldset>
<legend>대여 등록</legend>
<label>도서명</label>
<select name="bookname">
	<option>:::선택:::</option>
	<%
	Board1Dao dao1 = Board1Dao.getInstance();
	List<Board1> list1 = dao1.getBoards();
	for (int j = 0; j < list1.size(); j++) {
		Board1 board = list1.get(j);
		if (board.getRe_lev() > 0){
			
		} else {
			%>			
			<option><%=board.getSubject() %></option>
			
			<%
		}
		
	}		
%>
</select>

<br><br>
<label>대출자명</label>
<select name="username">
	<option>:::선택:::</option>
	<%
	MyMember1Dao dao = MyMember1Dao.getInstance();
	List<MyMember1> list = dao.getMembers();
	for (int i = 0; i < list.size(); i++) {
		MyMember1 member = list.get(i); 
		%>
		<option><%=member.getName() %></option>
		<%
	}		
%>

</select>
<br><br>
<label>대출시작일</label>
<input type="date" name="brstart"><br>
<label>반납예정일</label>
<input type="date" name="brend"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
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