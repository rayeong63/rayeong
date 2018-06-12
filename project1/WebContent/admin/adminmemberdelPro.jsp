<%@page import="domain.MyMember1"%>
<%@page import="dao.MyMember1Dao"%>
<%@page import="java.util.List"%>
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
<script src="../script/jquery-3.2.1.min.js"></script>
</head>
<body>
<%
	//세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 error.jsp로 이동
 	if(id == null || !id.equals("admin")){ 	
		session.invalidate();
		response.sendRedirect("../admin/error.jsp'");
		return;
	}
%>
<%
	String[] delIds = request.getParameterValues("chk");
	System.out.println(delIds[0]);
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<script>

</script>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"><img src="../images/center/books.jpg"
 width="971" height="172"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/memberinfo.jsp">회원정보조회 /수정</a></li>
<li><a href="../member/memberdel.jsp">회원탈퇴</a></li>
<li><a href="../admin/adminmemberlist.jsp">관리자회원목록</a></li>
<li><a href="../admin/adminmember.jsp">관리자회원관리</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// DB객체 생성
MyMember1Dao dao = MyMember1Dao.getInstance();

dao.deleteMembers(delIds);
// 전체글개수 가져오기 메소드 호출
int totalRowCount = dao.getMemberCount();

// 원하는 페이지의 글을 가져오는 메소드
List<MyMember1> list = dao.getMembers();
%>
<article>
<h1>Member Delete</h1>
<form action="adminmemberlist.jsp" id="join" method="post" name="frm">
<fieldset>
<h3><%=id %>로 로그인 하셨습니다.</h3>
	<table width=500 border='1'>
	<tr>
		<th>아이디</th>
	    <th>이름</th>
	    <th>이메일</th>
	    <th>성별</th>
	    <th>전화번호</th>
	</tr>
	<%
		for (MyMember1 member : list) {
	%>    
    <tr>
	    <td><%=member.getId() %></td>
	    <td><%=member.getName() %></td>
	    <td><%=member.getEmail() %></td>
	    <td><%=member.getGender() %></td>
	    <td><%=member.getTel() %></td>
	</tr>
	<%
		}
	%>
	</table>
<fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원삭제완료" class="submit">
</div>
</form>
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
