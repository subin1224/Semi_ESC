<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="noVo" class="com.proj.notice.model.NoticeVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noVo" />
<jsp:useBean id="noService"
	class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String noTitle=request.getParameter("noticeTitle");
	String noContent=request.getParameter("noticeContent");
	String brandNo = request.getParameter("brandNo");
	noVo.setBrandNo(Integer.parseInt(brandNo));
	noVo.setNoContent(noContent);
	noVo.setNoTitle(noTitle);
	
	try{
	 int cnt = noService.insertNotice(noVo);
	 if(cnt>0){
		 System.out.println("공지사항 등록 성공");
		 %>
		 <script type="text/javascript">
			opener.location.reload();
		 	window.close();
		 </script>
		 <%
		
	 }else{
		 System.out.println("공지사항 등록 실패");

	 }
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>

</body>
</html>