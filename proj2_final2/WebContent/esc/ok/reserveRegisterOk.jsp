<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserveVo" class="com.proj.reserve.model.ReserveVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="reserveVo" />
<jsp:useBean id="reserveService" class="com.proj.reserve.model.ReserveService" scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.proj.member.model.MemberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="reserveVo" />
<jsp:useBean id="memService" class="com.proj.member.model.MemberService" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1. reserveDetail에서 post방식으로 전송
	request.setCharacterEncoding("utf-8");

	
	//reserveTable
	String userNo = request.getParameter("userNo");
	String roomNo = request.getParameter("roomNo");
	String playlerNum = request.getParameter("numList");
	String payment = request.getParameter("totalPriceInput");
	
	//reserveDate Table
	String reserveDay = request.getParameter("datePicker");
	String reserveTime = request.getParameter("timePicker");
	
	//member mileage update
		String top_userid = (String) session.getAttribute("userid");
		String mileage = request.getParameter("mileageInput");
	
	
	 
	
	
	String msg="죄송합니다. 예약 실패하셨습니다.", url="/esc/view/reserve.jsp";
	
	try{	
		int cnt = memService.updateMileage(top_userid, Integer.parseInt(mileage));
		if(cnt>0){
			System.out.println("마일리지 업데이트 성공하셨습니다.");
				reserveVo.setUserNo(Integer.parseInt(userNo));
				reserveVo.setRoomNo(Integer.parseInt(roomNo));
				reserveVo.setPlayerNum(Integer.parseInt(playlerNum));
				reserveVo.setPayment(Integer.parseInt(payment));
				reserveVo.setReserveDay(reserveDay);
				reserveVo.setReserveTime(reserveTime);
				cnt += reserveService.insertReserveAll(reserveVo);
				
			if(cnt>1){
			msg="예약 성공 하셨습니다. 즐거운 하루 보내세요";
			url="/esc/mypage/memPage.jsp";
			}
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
%>
</body>
</html>