<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.theme.model.ThemeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//3. DB작업
ThemeService themeService=new ThemeService();
List<ThemeVO> themeList=null;
ThemeVO themeVo=new ThemeVO();

try {
	themeList=themeService.selectByAll();
} catch(SQLException e){
	e.printStackTrace();
}
%>

<%
for (int i=0; i<3; i++){
	themeVo=themeList.get(i);
%>
<p><%=themeVo.getThemeName() %></p>	
<%	
}
%>
</body>
</html>