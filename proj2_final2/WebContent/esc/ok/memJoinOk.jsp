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
<jsp:useBean id="memVo" class="com.proj.member.model.MemberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="memVo"/>
<jsp:useBean id="memService" class="com.proj.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//post
	//1
	request.setCharacterEncoding("utf-8");
	
	String userId=request.getParameter("memid");
	String userPwd=request.getParameter("mempwd");
	String userName=request.getParameter("memname");
	String userTel=request.getParameter("memTel");
	
	System.out.println("인코딩 잘 되었나 ? memname="+userName);
	
	//2
	String msg="회원가입 실패!", url="/esc/view/join.jsp";
	
	try{
		memVo.setUserId(userId);
		memVo.setUserName(userName);
		memVo.setUserPwd(userPwd);
		memVo.setUserTel(userTel);
		
		int cnt=memService.insertMember(memVo);
		
		if(cnt>0){
			msg="회원가입 되었습니다.";
			url="/esc/login/login.jsp";
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