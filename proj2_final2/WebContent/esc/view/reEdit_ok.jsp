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
	String reviewNo= request.getParameter("reviewNo");
	String rating= request.getParameter("rating");
	String reTitle= request.getParameter("reTitle");
	String reContent= request.getParameter("reContent");
	
	//2
	reviewVo.setReviewNo(Integer.parseInt(reviewNo));
	reviewVo.setReTitle(reTitle);
	reviewVo.setReContent(reContent);
	reviewVo.setRating(Double.parseDouble(rating));
	
	System.out.println(reviewVo);
	
	int cnt=0;
	try{
		cnt=reviewService.editReview(reviewVo);
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	if(cnt > 0){%>
		<script type="text/javascript">
			alert("수정 성공!!!");
			location.href="review.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("수정 실패!!!");
			history.back();
		</script>
		
	<%} %>

</body>
</html>