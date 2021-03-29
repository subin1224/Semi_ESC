<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%	//스크립트릿은 서버에서 먼저 실행
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");

	String ctxPath = request.getContextPath(); 
	url = ctxPath + url; 
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

</body>
</html>