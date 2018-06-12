<%@page import="dao.RentalDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 한글처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="rental" class="domain.Rental"/>
<jsp:setProperty property="*" name="rental"/>
<%

	// 날짜 생성
//	Timestamp brStart = new Timestamp(System.currentTimeMillis());
//	rentalbr.setBrStart(brStart);
//	Timestamp brEnd = new Timestamp(System.currentTimeMillis());
//	rentalbr.setBrEnd(brEnd);
	
	
	// DB접속용 Dao객체 생성
	RentalDao dao = RentalDao.getInstance();
	dao.insertRental(rental);
	
	// 이동 login.jsp
//	response.sendRedirect("login.jsp");
	String result1="rentalSuccess";
	response.sendRedirect("rental.jsp?result=" + result1);
%>





















