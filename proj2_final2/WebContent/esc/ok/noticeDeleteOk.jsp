<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="noticeVo" class="com.proj.notice.model.NoticeVO"
   scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo" />
<jsp:useBean id="noticeService"
   class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//noticeDetail.jsp에서 confirm 질문 후 get방식으로 전송
	//1
	request.setCharacterEncoding("utf-8");
	String noticeNo=request.getParameter("noticeNo");
	
	int cnt=0;
	try{
		cnt=noticeService.deleteNotice(Integer.parseInt(noticeNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){ %>
		<script type="text/javascript">
			alert('글 삭제되었습니다.');
			location.href='<%=request.getContextPath()%>/esc/view/notice.jsp';
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('글 삭제 실패!');
			history.back();
		</script>		
	<%}%>


</body>
</html>