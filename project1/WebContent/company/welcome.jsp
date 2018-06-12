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
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div style="position:relative;"></div>
<div id="sub_img"><img src="../images/center/books.jpg"
 width="971" height="174"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">인사말</a></li>
<li><a href="#">:::</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Welcome</h1>
<figure class="ceo"><img src="../images/company/bench-blurred-background-book-694745.jpg" width="630" 
alt="CEO"><figcaption>BOOK CENTER</figcaption>
</figure>
<p>
21세기 지식기반사회에는 독서를 통한 무한한 창의성과 상상력는 미래를 개척하는 힘의 원동력입니다. 
우리도서관에서는 지식문화의 교두보로서 지역주민이 꿈과 희망을 키울 수 있는 도약의 발판이 되어 드릴 것입니다.
유비쿼터스 시대에 부응하는 첨단의 인프라를 구축하여 전통과 첨단이 조화된  
대표도서관으로서 정보 문화 배움의 기회를 누구나 누릴 수 있는 미래지향적 열린 
도서관이 되도록 최선을 다하겠습니다.
앞으로도 도서관 발전에 많은 관심과 이용을 바랍니다.
감사합니다.
</p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



