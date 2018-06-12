<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<div id="login">
<script>
// 자바스크립트 타이머를 활용한 자동로그아웃
var timer;
var cnt = parseInt(60*20); // 20분
function counter_int(){
	timer = setInterval("counter_run()", 1000);	
}

function counter_reset() {
	clearInterval(timer);
	cnt = parseInt(60*20); // 20분
	counter_int();
}

function counter_run(){
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0){
		clearInterval(timer);
		self.location = "logout.jsp";
	}
}

function time_format(s){
	var nHour = 0;
	var nMin = 0;
	var nSec = 0;
	if(s > 0){
		nMin = parseInt(s/60);
		nSec = s%60;
		
		if(nMin > 60){
			nHour = parseInt (nMin/60);
			nMin = nMin%60;
		}
	}
	if(nSec < 10) nSec = "0"+nSec;
	if(nMin < 10) nMin = "0"+nMin;
	
	return ""+nHour+":"+nMin+":"+nSec;
}
</script>
<script>counter_int();</script>
<%
	//쿠키 id값 확인
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
	    for (Cookie c : cookies) {
	        if (c.getName().equals("id")) {
	            System.out.println("id쿠키 가져옴 " + c.getValue());
	            session.setAttribute("id", c.getValue());
	        }
	    }
	}
	
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 있으면  ..님 logout
	// 세션값 없으면 login
	if (id != null ) {
		%>
		<%=id %>님 
		<span id="counter"></span>
		<!-- 연장버튼  -->
		<input type="button" style="background-color: #E8D9FF; border:0px #E8D9FF; font-size:8pt; font-family:고딕"value="연장" onclick="counter_reset()">	
		<a href="../member/logout.jsp">logout</a>
		<%
		if(id.equals("admin")){
		%>
		| <a href="../admin/adminmemberlist.jsp">membership</a>
		<%
		} else {%>		
		<%
		}
	} else {
		%>
		<a href="../member/login.jsp">login</a><%
	}
	 %>
	 | <a href="../member/join.jsp">join</a>
</div>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/newlogo.png" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../index.jsp">도서관리시스템</a></li>
	<li><a href="../company/welcome.jsp">BOOK CENTER</a></li>
	<li><a href="../member/memberinfo.jsp">회원관리</a></li>
	<li><a href="../center/notice.jsp">도서관리</a></li>
</ul>
</nav>
</header>