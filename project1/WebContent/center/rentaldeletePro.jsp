dDao"%>
<%@page import="dao.RentalDao"%>
<%@page import="dao.Board1Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// int num String pageNum String passwd 파라미터값 가져오기
	//int num = Integer.parseInt(request.getParameter("num"));
		
	// DB객체생성 dao
	RentalDao dao = RentalDao.getInstance();
	// 메소드호출  deleteBoard(num)
	dao.deleterent(Integer.parseInt(request.getParameter("num")));
	%>
		<script>
			alert('도서반납 성공');
			location.href = 'rentalList.jsp'
		</script>
		<%	
%>
<body>

</body>
</html>