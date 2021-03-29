<%@page import="com.proj.brand.model.BrandVO"%>
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
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>

<%
	//adLogin.jsp에서 post방식으로 submit
	//1
	request.setCharacterEncoding("utf-8");
	String adid=request.getParameter("adid");
	String adpwd=request.getParameter("adpwd");
	String chkSave=request.getParameter("chkSave");
	
	//2
	String msg="로그인 처리 실패", url="/esc/login/adLogin.jsp";
	try{
		int result=brandService.loginCheck(adid, adpwd);
		if(result==MemberService.LOGIN_OK){
			//1)세션에 저장
			session.setAttribute("adid", adid);				
			BrandVO vo=brandService.selectByAdminId(adid);
			session.setAttribute("brandName", vo.getBrandName());
			
			session.setAttribute("flag", "2"); //브랜드
			
			//2)쿠키에 저장 - 아이디 저장하기 체크한 경우에만
			Cookie ck = new Cookie("ck_userid", adid);
			ck.setPath("/");	//모든 경로에 갈 수 있게 /로 지정
			
			if(chkSave != null){ 
				ck.setMaxAge(1000*24*60*60);	
				response.addCookie(ck);
			}else{ 
				ck.setMaxAge(0);	
				response.addCookie(ck);
			}		


			msg=vo.getBrandName() + "의 관리자 님 환영합니다!";
			url="/esc/index.jsp";
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.ID_NONE){
			msg="가입 승인 요청 대기 중 입니다...";
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