<%@page import="org.json.JSONArray"%>
<%@page import="domain.MyMember1"%>
<%@page import="dao.MyMember1Dao"%>
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
<script src="../script/jquery-3.2.1.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
// 구글 시각화 API를 로딩하는 메소드
google.charts.load('current', {
	packages : [ 'corechart' ]
});

// 구글 시각화 API가 로딩이 완료되면,
// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	$.ajax({
		url: 'json.jsp',
		success: function (data) {
			pieChart1(data);
		}
	});
}

// 원형 차트 1
function pieChart1(arr) {
	var dataTable = google.visualization.arrayToDataTable(arr);

	var options = {
		title : '회원 성비'
	};

	var objDiv = document.getElementById('pie_chart_div1');
	var chart = new google.visualization.PieChart(objDiv);
	chart.draw(dataTable, options);

	// select(선택) 이벤트 핸들러(처리)용 함수를 무명함수로 정의
	var selectHandler = function() {
		var selectedItem = chart.getSelection()[0];
		var value = dataTable.getValue(selectedItem.row, 0);
		alert('선택한 항목은 ' + value + ' 입니다.');
	};
	//   function selectHandler() {
	//    var selectedItem = chart.getSelection()[0];
	//          var value = dataTable.getValue(selectedItem.row, 0);
	//          alert('선택한 항목은 ' + value + ' 입니다.');
	//   }

	// 적용할 차트, 적용할 이벤트명, 이벤트 핸들러 함수를 인자로 이벤트 리스너에 등록
	google.visualization.events.addListener(chart, 'select',
			selectHandler);
}



setInterval(function() {
	drawChart();
	}, 30000); // 주기적으로 차트 새로그리기



$(document).ready(function() {
	drawChart();
	
	$('#btn').click(function() {
		drawChart();
	});
});
</script>
</head>
			<%//세션값 가져오기
			String id = (String) session.getAttribute("id");
			// 세션값 없으면 error.jsp로 이동
			if (id == null || !id.equals("admin")) {
				session.invalidate();
				response.sendRedirect("../admin/error.jsp'");
				return;
			}%>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center">
			<img src="../images/center/books.jpg" width="971" height="172">
		</div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="../member/memberinfo.jsp">회원정보조회 /수정</a></li>
				<li><a href="../member/memberdel.jsp">회원탈퇴</a></li>
				<li><a href="../admin/adminmemberlist.jsp">회원목록</a></li>
				<li><a href="../admin/adminmember.jsp">회원관리</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->

		<article>
			<h1>회원관리</h1>
			<h3><%=id%>로 로그인 하셨습니다.
			</h3>


			<div id="pie_chart_div1" style="width: 500px; height: 500px;"></div>
			<button id="btn" type="button">데이터</button>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<%@include file="../inc/bottom.html"%>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>
