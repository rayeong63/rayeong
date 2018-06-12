
<%@page import="dao.Board1Dao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp이동
	if (id == null) {
		response.sendRedirect("../member/login.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8"); // 한글처리 
%>
<%-- 액션태그이용 자바빈 객체생성. setProperty이용 저장 --%>
<jsp:useBean id="boardBean" class="domain.Board1" />
<jsp:setProperty property="*" name="boardBean"/>
<%
	// reg_date  ip  set메소드  값저장
	boardBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
	boardBean.setReadcount(0); // 조회수 0으로 초기화
	
	// 게시판 Dao 객체생성
	Board1Dao dao = Board1Dao.getInstance();
	// 메소드호출   insertBoard(boardBean)
	dao.insertBoard(boardBean);
	// 이동   글목록 notice.jsp
	response.sendRedirect("notice.jsp");
%>



