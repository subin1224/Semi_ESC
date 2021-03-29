<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지점 등록페이지</title>
</head>
<body>
<jsp:useBean id="unitVo" class="com.proj.unit.model.UnitVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="unitVo"/>
<jsp:useBean id="unitService" class="com.proj.unit.model.UnitService" scope="session"></jsp:useBean>
<%
	//post
	//1
	request.setCharacterEncoding("utf-8");
	String location1Code=request.getParameter("location1Code");
	String unitName=request.getParameter("unitname");
	String unitAddress=request.getParameter("unitAddress");
	String unitTel=request.getParameter("unitTel");
	String brandNo=request.getParameter("brandno");
	
	//2
	String msg="지점등록 실패!", url="/esc/mypage/bmpage.jsp";
	
	try{
		unitVo.setLocation1Code(location1Code);
		unitVo.setUnitName(unitName);
		unitVo.setUnitAddress(unitAddress);
		unitVo.setUnitTel(unitTel);
		unitVo.setBrandNo(Integer.parseInt(brandNo));
		
		int cnt=unitService.insertUnit(unitVo);
		
		if(cnt>0){
			msg="지점등록이 되었습니다.";
			url="/esc/mypage/bmPage.jsp";
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