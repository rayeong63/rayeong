<%-- <%@page import="module.MySessionBindingListener"%> --%>
<%@page import="dao.MyMember1Dao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 id passwd 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String keepLogin = request.getParameter("keepLogin");
	System.out.println("keepLogin: " + keepLogin);
	
	// DB객체 생성
	MyMember1Dao dao = MyMember1Dao.getInstance();
	int check = dao.userCheck(id, passwd);
	
	// check == 1 로그인인증 main.jsp이동
	// check == 0 패스워드틀림 뒤로이동
	// check == -1 아이디없음 뒤로이동
	if(check == 1){
		session.setAttribute("id", id);
		//session.setMaxInactiveInterval(60*10); // 세션유지시간 10분
		/* session.setAttribute("bindListener", new MySessionBindingListener()); */
		response.sendRedirect("../index.jsp" /* + id + "&keepLogin=" + keepLogin */);
	} else if (check == 0){
		%>
		<script>
			alert('패스워드 틀림');
			history.back();
		</script>
		<%
	} else {
		%>
		<script>
			alert('해당 아이디 없음');
			//location.href = 'loginForm.jsp';
			history.back(); // 브라우저 뒤로가기버튼
		</script>
		<%
	}	
	%>
	




