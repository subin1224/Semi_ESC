<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<jsp:useBean id="cpVo" class="com.proj.coupon.model.CouponVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="cpVo"/>
<jsp:useBean id="cpService" class="com.proj.coupon.model.CouponService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//hmPageif4에서 쿠폰 삭제 버튼 누르면 get방식으로 전송
	String couponNo = request.getParameter("couponNo");
	

	
	try{	
		int cnt = cpService.deleteCoupon(Integer.parseInt(couponNo));
		if(cnt>0){
			System.out.println("쿠폰 삭제에 성공하셨습니다.");
			%>
				<script type="text/javascript">
					location.href="<%=request.getContextPath()%>/esc/mypage/hmPage.jsp"
				</script>
			<%
		}else{
			System.out.println("쿠폰 삭제 실패!");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3

%>
	
</body>
</html>