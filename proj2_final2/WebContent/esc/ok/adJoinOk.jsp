
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
	String adId=request.getParameter("adid");
	String adPwd=request.getParameter("adpwd");
	String brandName=request.getParameter("brandname");
	String adTel=request.getParameter("adtel");

	//2
	String msg="가입 실패했습니다.", url="/esc/view/adJoin.jsp";
	
	try{	
		brandVo.setAdId(adId);
		brandVo.setAdPwd(adPwd);
		brandVo.setBrandName(brandName);
		brandVo.setAdTel(adTel);
		
		int cnt=brandService.insertBrand(brandVo);
		
		if(cnt>0){
			msg="가입 승인 요청 되었습니다.";
			url="/esc/index.jsp";
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
