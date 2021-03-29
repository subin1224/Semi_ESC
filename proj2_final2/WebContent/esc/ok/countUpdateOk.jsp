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
	//notice.jsp 에서 제목 클릭시 get 방식으로 전송
	String noticeNo=request.getParameter("noticeNo");
	if(noticeNo==null || noticeNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href='<%=request.getContextPath()%>/esc/view/notice.jsp';
		</script>
		
		<%	return;
	}
	
	
	
		int cnt = 0 ;
		try{
			cnt = noticeService.updateNoHit(Integer.parseInt(noticeNo));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(cnt>0){
		 	System.out.println("조회수 증가 성공!");
		 	%>
			<script type="text/javascript">
				location.href="<%=request.getContextPath()%>/esc/view/noticeDetail.jsp?noticeNo=<%=noticeNo%>";
			</script>		
		<%
		}else{%>
			<script type="text/javascript">
				alert('조회수 증가 실패');
				history.go(-1);
			</script>		
		<%}%>

			
 	
</body>
</html>