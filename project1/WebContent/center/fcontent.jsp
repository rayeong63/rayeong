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
	// num  pageNum   파라미터 가져오기
	// 쿼리스트링 형식 name=value
	// getParameter()로 파라미터 가져올때 name조차 없다면 null을 리턴함.
	// name은 있는데 값이 없을때는 빈문자열("")이 리턴됨.
	// Integer num = request.getParameter("num");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	// DB객체생성
	Board1Dao dao = Board1Dao.getInstance();
	// 글 조회수 1 증가
	dao.updateReadcount(num);
	// 글내용 가져오기
	Board1 board = dao.getBoard(num);
	// 날짜형식 객체준비
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Timestamp timestamp = board.getReg_date();
	Date date = new Date(timestamp.getTime());
	String strDate = sdf.format(date);
	// content내용  줄바꿈문자 \r\n => <br> 바꾸기
	String content = "";
	if (board.getContent() != null) {
		content = board.getContent().replace("\r\n", "<br>");
	}
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
<li><a href="../center/rentalinfo.jsp">대여도서목록</a></li>
<li><a href="../center/rentalList.jsp">반납도서목록</a></li>
<li><a href="../center/fnotice.jsp">도서자료다운로드</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>File Notice Content</h1>

<table id="notice">
<tr>
	<th width='50'>글번호</th><td><%=board.getNum() %></td>
	<th>조회수</th><td><%=board.getReadcount() %></td>
</tr>
<tr>
	<th>저자명</th><td><%=board.getName() %></td>
	<th>작성일</th><td><%=strDate %></td>
</tr>
<tr>
	<th>도서명</th>
	<td colspan="3"><%=board.getSubject() %></td>
</tr>
<tr>
	<th>분류</th>
	<td colspan="3"><%=board.getType() %></td>	
</tr>
<tr>
	<th>파일</th>
	<td colspan="3">
		<a href="../upload/<%=board.getFilename()%>">
		<%=board.getFilename() != null ? board.getFilename() : "" %>
		</a>
		<%
			if(board.getFilename() != null){
				String filename = board.getFilename();
				int index = filename.lastIndexOf(".");
				String ext = filename.substring(index+1);
				if(ext.equals("jpg") || ext.equals("gif") || ext.equals("png")){
					%>
					<img alt="<%=filename %>" src="../upload/<%=filename%>">
					<%
				}
			}
		%>
	</td>
</tr>
<tr>
	<th>책정보</th>
	<td colspan="3"><%=content %></td>
</tr>
</table>
<div id="table_search">
<%
//세션 가져오기
String id = (String) session.getAttribute("id");
//세션값이 있으면 글수정,삭제,답글쓰기 버튼이 보이게 설정
if (id != null) {
	%>
	<input type="button" value="글수정" class="btn" onclick="location.href='fupdate.jsp?num=<%=board.getNum() %>&pageNum=<%=pageNum%>'">
	<input type="button" value="글삭제" class="btn" onclick="location.href='fdelete.jsp?num=<%=board.getNum() %>&pageNum=<%=pageNum%>'">
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='freWrite.jsp?re_ref=<%=board.getRe_ref()%>&re_lev=<%=board.getRe_lev()%>&re_seq=<%=board.getRe_seq()%>&pageNum=<%=pageNum%>'">
	<%
}
%>
<input type="button" value="목록보기" class="btn" onclick="location.href='fnotice.jsp?pageNum=<%=pageNum%>'">
</div>


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