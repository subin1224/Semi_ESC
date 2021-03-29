<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reviewVo" class="com.proj.review.model.ReviewVO" 
	scope="page"></jsp:useBean>
<jsp:useBean id="reviewService" class="com.proj.review.model.ReviewService" 
	scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String roomNo= request.getParameter("roomNo");
	String userNo= request.getParameter("userNo");
	String rating= request.getParameter("rating");
	String reTitle= request.getParameter("reTitle");
	String reContent= request.getParameter("reContent");
	String reserveNo= request.getParameter("reserveNo");
	
	//2
	reviewVo.setRoomNo(Integer.parseInt(roomNo));
	reviewVo.setUserNo(Integer.parseInt(userNo));
	reviewVo.setReTitle(reTitle);
	reviewVo.setReContent(reContent);
	reviewVo.setRating(Double.parseDouble(rating));
	reviewVo.setReserveno(Integer.parseInt(reserveNo));
	
	System.out.println(reviewVo);
	
	int cnt=0;
	try{
		cnt=reviewService.insertReview(reviewVo);
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	if(cnt > 0){%>
		<script type="text/javascript">
			alert("리뷰 작성 성공!!!");
			location.href="<%=request.getContextPath()%>/esc/view/review.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("리뷰 작성 실패!!!");
			history.back();
		</script>
		
	<%} %>

</body>
</html>