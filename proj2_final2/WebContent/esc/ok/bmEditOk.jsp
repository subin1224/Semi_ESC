<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="brandVo" class="com.proj.brand.model.BrandVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brandVo"/>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>
<%
	//post
	//1
	request.setCharacterEncoding("utf-8");
	String brandName = request.getParameter("brandName");
	String brandNo = request.getParameter("brandNo");

	//2
	String msg="브랜드 이름 수정 실패...", url="/esc/mypage/bmEdit.jsp";
	
	try{	
		int cnt=brandService.updateBrand(brandName, Integer.parseInt(brandNo));
		
		if(cnt>0){
			msg="브랜드 이름 수정 되었습니다.";
			url="/esc/mypage/bmEdit.jsp";
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>
