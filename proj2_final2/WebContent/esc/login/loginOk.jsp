<%@page import="com.proj.member.model.MemberVO"%>
<%@page import="com.proj.member.model.MemberService"%>
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
<jsp:useBean id="memService" class="com.proj.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//login.jsp에서 post방식으로 submit
	//1
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("userpwd");
	String chkSave=request.getParameter("chkSave");
	
	
	//2
	String msg="로그인 처리 실패", url="/esc/login/login.jsp";
	try{
		int result=memService.loginCheck(userid, pwd);
		if(result==MemberService.LOGIN_OK){
			//1)세션에 저장
			session.setAttribute("userid", userid);				
			MemberVO vo=memService.selectMember(userid);
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("flag", "1"); //멤버 로그인
			
			//2)쿠키에 저장 - 아이디 저장하기 체크한 경우에만
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");	//모든 경로에 갈 수 있게 /로 지정
			
			if(chkSave != null){ 
				ck.setMaxAge(1000*24*60*60);	
				response.addCookie(ck);
			}else{ 
				ck.setMaxAge(0);	
				response.addCookie(ck);
			}		


			msg=vo.getUserName() + "님 환영합니다!";
			url="/esc/index.jsp";
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.ID_NONE){
			msg="해당 아이디가 존재하지 않습니다.";
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