<%@page import="domain.Board1"%>
<%@page import="dao.Board1Dao"%>
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
<link href="../css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 


</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/7.png"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>교보문고 전자책 이용안내</h3>
<p>교보eBook, 이렇게 시작 해보세요! 다양한 구매 방식과 혜택, 그리고 추천이 있는 스토어 eBook 상세페이지,
목록 등에서 바로구매 하세요. 
<input type="button" value="바로가기"
onclick="window.open('http://digital.kyobobook.co.kr/digital/guide/guideMain.ink?guidePage=guide01&guide_menuNo=1&orderClick=c6x','kyobo','width=350,height=350,location=no,status=no,scrollbars=no');"></p>
</div>
<div id="security">
<h3>YES24 전자책 이용안내</h3>
<p>YES24eBook, 이렇게 시작 해보세요! 다양한 구매 방식과 혜택, 그리고 추천이 있는 스토어 eBook
상세페이지, 목록 등에서 바로구매 하세요. 
<input type="button" value="바로가기"
onclick="window.open('http://www.yes24.com/notice/eBookGuide/guide_firstBuy.aspx','kyobo','width=350,height=350,location=no,status=no,scrollbars=no');"></p>
</div>
<div id="payment">
<h3>알라딘 전자책 이용안내</h3>
<p>알라딘eBook, 이렇게 시작 해보세요! 다양한 구매 방식과 혜택, 그리고 추천이 있는 스토어 eBook 상세페이지,
목록 등에서 바로구매 하세요. 
<input type="button" value="바로가기" 
onclick="window.open('http://blog.aladin.co.kr/cscenter/4754181','kyobo','width=350,height=350,location=no,status=no,scrollbars=no');"></p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">&nbsp;&nbsp;e-Book</span> News</h3>
<dl>
<dt>e-Book</dt>
<dd>기존에 종이책으로만 보던 책들을 컴퓨터 통신이나 인터넷에서 책 전문을 PDF 형태의 파일로 다운로드 받아
PC나 개인휴대단말기(PDA) 형태의 기기 화면에서 편리하게 이용하는 콘텐츠..
</dl>
<dl>
<dt>electronic book</dt>
<dd>전자책이라고도 하며, 세계적으로 online book, file book, digital book 등 다양한 이름으로 불리고 있다..</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
<%
// DB객체생성
Board1Dao dao = Board1Dao.getInstance();
// 전체글개수 가져오는 메소드 호출
int count = dao.getBoardCount();
// count > 0
//   List = getBoards(시작행번호, 종료행번호) 호출
//   for문 출력
// count == 0 "게시글 없음"
if(count > 0){
	List<Board1> list = dao.getBoards(1, 5);
	SimpleDateFormat sdf = new SimpleDateFormat("yyy.MM.dd");
	for (Board1 board : list){
		%>
		<tr>
			<td class="contxt">
				<%
					if(board.getRe_lev() > 0){
						int wid = board.getRe_lev() * 10;
						%>
						<img src="../images/center/level.gif" width="<%=wid %>" height="8">
						<img src="../images/center/re.gif">
						<%
					}
				%>		
				<a href="../center/fcontent.jsp?num=<%=board.getNum()%>&pageNum=1"><%=board.getSubject() %></a>
			</td>
    		<td><%=sdf.format(board.getReg_date()) %></td>
    	</tr>
		<%
	}
} else {
	%>
	<tr>
	<td colspan="2" class="contxt">게시글 없음</td>
    </tr>
	<%
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>