<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String brandno=(String)request.getParameter("brandno");
	
	try{
		int cnt=brandService.deleteNflag(Integer.parseInt(brandno)); %>
		<script type="text/javascript">
			alert('요청 삭제 성공!');
			location.href='hmPage.jsp';
		</script>		
<%	}catch(SQLException e){
		e.printStackTrace();	%>
		<script type="text/javascript">
			alert('요청 삭제 실패..');
			location.href='hmPage.jsp';
		</script>	

<%	} 
	
%>
</body>
</html>