<%@page import="org.json.JSONArray"%>
<%@page import="dao.MyMember1Dao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MyMember1Dao dao = MyMember1Dao.getInstance();
	JSONArray jsonArray = dao.getGenderCount();
%>
<%=jsonArray %>