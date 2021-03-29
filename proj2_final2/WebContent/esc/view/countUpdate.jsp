<%@page import="com.proj.review.model.ReviewService"%>
<%@page import="com.proj.review.model.ReviewDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reviewService" class="com.proj.review.model.ReviewService" 
	scope="session"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%
	//list.jsp에서 제목 링크 클릭하면 get방식으로 이동
	//1
	String reviewNo = request.getParameter("reviewNo");
	String roomNo = request.getParameter("roomNo");
	String userId = request.getParameter("userId");
	
	if(reviewNo==null || reviewNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href='review.jsp';
		</script>
		<%return;
	}
	
	//2
	ReviewService service=new ReviewService();
	
	int cnt=0;
	try{
		cnt=service.updateReadCount(Integer.parseInt(reviewNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){
		response.sendRedirect("reDetail.jsp?reviewNo="+reviewNo+"&roomNo="+roomNo
							  +"&userId="+userId);		
	}else{%>
		<script type="text/javascript">
			alert('조회수 증가 실패');
			history.go(-1);
		</script>		
	<%}%>
</body>
</html>