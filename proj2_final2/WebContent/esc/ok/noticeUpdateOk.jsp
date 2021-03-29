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
//noticeEdit.jsp에서 post방식으로 submit
	//1
	request.setCharacterEncoding("utf-8");
	
	String noticeNo=request.getParameter("noticeNo");
	String noTitle=request.getParameter("noTitle");	
	String noContent=request.getParameter("noContent");

	
	//2

	noticeVo.setNoContent(noContent);
	noticeVo.setNoTitle(noTitle);
	noticeVo.setNoticeNo(Integer.parseInt(noticeNo));
	int cnt=0;
	try{		
		cnt = noticeService.updateNotice(noticeVo);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){%>
		<script type="text/javascript">
			alert('글 수정되었습니다.');
			location.href="<%=request.getContextPath() %>/esc/view/noticeDetail.jsp?noticeNo=<%=noticeNo %>";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('글 수정 실패');
			history.go(-1);
		</script>		
	<%}
%>
</body>
</html>