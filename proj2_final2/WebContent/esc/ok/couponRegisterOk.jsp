<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
	//hmPageif5에서 쿠폰등록 누를시 Post로 전송
	request.setCharacterEncoding("utf-8");

	String cpName = request.getParameter("couponName");
	String cpCode = request.getParameter("couponCode");
	String cpPrice = request.getParameter("couponPrice");
	String day= request.getParameter("day");

	cpVo.setCouponCode(cpCode);
	cpVo.setCouponName(cpName);
	cpVo.setDiscount(Integer.parseInt(cpPrice));
	
	
	
	try{
		int cnt = cpService.insertCoupon(cpVo, Integer.parseInt(day));
		if(cnt>0){
			System.out.println("쿠폰 등록에 성공하였습니다.");
			%>
				<script type="text/javascript">
				window.opener.location.reload();
				window.close();				
				</script>
			<%
		}else{
			System.out.println("쿠폰 등록에 실패하였습니다..");

		}
	}catch(SQLException e){
		e.printStackTrace();
	}

	
%>

</body>
</html>