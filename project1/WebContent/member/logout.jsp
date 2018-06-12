<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 초기화
	session.invalidate();
	// "로그아웃"  index.jsp이동
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = '../index.jsp';
</script>