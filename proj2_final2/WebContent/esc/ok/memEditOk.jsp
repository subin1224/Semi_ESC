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
<jsp:useBean id="mEVo" class="com.proj.member.model.MemberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="mEVo"/>
<jsp:useBean id="mEService" class="com.proj.member.model.MemberService"
	scope="session"></jsp:useBean>  
<%
	//post
	//1
	request.setCharacterEncoding("utf-8");
	String memid = request.getParameter("memid");
	String memname = request.getParameter("memname");
	String mempwd = request.getParameter("mempwd");
	String memTel = request.getParameter("memTel");

	//2
	String msg="회원 수정 실패...", url="/esc/mypage/memPage.jsp";
	
	mEVo.setUserId(memid);
	mEVo.setUserName(memname);
	mEVo.setUserPwd(mempwd);
	mEVo.setUserTel(memTel);
	
	try{	
		int cnt=mEService.updateMember(mEVo);
		
		if(cnt>0){
			msg="회원 수정 되었습니다.";
			url="/esc/mypage/memPage.jsp";
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
