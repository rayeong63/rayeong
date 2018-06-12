<%@page import="domain.Board1"%>
<%@page import="dao.Board1Dao"%>
<%@page import="java.io.File"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// int num String pageNum String passwd 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	// DB객체생성 boarddao
	Board1Dao dao = Board1Dao.getInstance();
	// DB에서 글 삭제하기 이전에 글정보 가져오기
	Board1 board = dao.getBoard(num);
	// int check =DB 글삭제 메소드호출  deleteBoard(num, passwd)	
	int check = dao.deleteBoard(num, passwd);
	
	// DB에서 글삭제 성공(check == 1)이면 실제파일도 삭제
	if(check == 1){ // 테이블 레코드 삭제 성공하면
		if(board.getFilename() != null){
		String realPath = application.getRealPath("/upload");
		System.out.println("realPath: " + realPath);
		
		File file = new File(realPath, board.getFilename());
		if(file.exists()){
			file.delete(); // 파일삭제 수행
			}
		}
	}
	
	// check == 1 이동 list.jsp?pageNum=
	// check == 0 "패스워드틀림" 뒤로이동
	if (check == 1){
		// response.sendRedirect("list.jsp?pageNum=" + pageNum);
		%>
		<script>
			alert('글삭제 성공');
			location.href = 'notice.jsp?pageNum='
		</script>
		<%
	} else {
		%>
		<script>
			alert('패스워드틀림');
			history.back();
		</script>
		<%
	}
%>
<body>

</body>
</html>