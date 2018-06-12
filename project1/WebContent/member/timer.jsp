<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var timer;
var cnt = parseInt(60*20); // 20분
function counter_int(){
	timer = setInterval("counter_run()", 1000);	
}

function counter_reset() {
	clearInterval(timer);
	cnt = parseInt(60*20); // 20분
	counter_init();
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
</head>
<body>
<span id="counter"></span><input type="button" value="연장" onclick="counter_reset()">

</body>
</html>
<script>
counter_int();
</script>