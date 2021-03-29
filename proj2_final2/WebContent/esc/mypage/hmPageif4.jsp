<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.coupon.model.CouponVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:useBean id="cpVo" class="com.proj.coupon.model.CouponVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="cpVo"/>
<jsp:useBean id="cpService" class="com.proj.coupon.model.CouponService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script>



function openPop(sw,sh){
	cw=screen.availWidth; //화면 너비
	ch=screen.availHeight; //화면 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2;

	test=window.open("hmpageif5.jsp",'CouponReg','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
}

 function deleteCoupon(couponNo){
	if(confirm(couponNo+"번 쿠폰을 삭제 하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/esc/ok/couponDeleteOk.jsp?couponNo="+couponNo;
	}else{
		history.back;
	}
 }


</script>
</head>
<body>

<%
List<CouponVO> cpList = null;
try{
	cpList = cpService.selectAll();
}catch(SQLException e){
	e.printStackTrace();
}
Date date = new Date();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<div class="container m-auto " style="width:1100px; height:300px; ">
<div style="width: 1100px; font-size: 40px; font-weight: bold; text-align: center; height: 100px; padding-top: 10px;">
		<span>쿠폰 등록하기</span>
	</div>
	<div style="overflow: auto; width: 100%; height:300px;  overflow-x:hidden">
	<table class="table-striped-even">
		<tbody>
			<tr class="text-center">
				<th style="width: 10%">번호</th>
				<th style="width: 20%">쿠폰이름</th>
				<th style="width: 20%">쿠폰코드</th>
				<th style="width: 20%">적용시작일</th>
				<th style="width: 25%">적용만료일</th>		
				<th>삭제버튼</th>
			</tr>
			
			<%
			for(int i=0; i<cpList.size(); i++){
				if(cpList.size()==0){
					%>
					<tr>
						<td class="text-center" colspan="4"> 등록된 브랜드가 없습니다 </td>
					</tr>
					<%
				}else{
					cpVo = cpList.get(i);
					%>
					<tr>
						<td><%=cpVo.getCouponNo() %></td>
						<td class="text-center"><%=cpVo.getCouponName() %></td>
						<td class="text-center"><a href="javascript:openPopPop(500,600,'<%=cpVo.getCouponCode()%>')"><%=cpVo.getCouponCode()%></a></td>
						<td class="text-center"><%=sdf.format(cpVo.getStartDate()) %></td>
						<td class="text-center"><%=sdf.format(cpVo.getEndDate()) %></td>
						<td><button onclick="deleteCoupon(<%=cpVo.getCouponNo()%>)">삭제</button></td>
					</tr><%
				}				
			}
			%>
			
		</tbody>
	</table>

		</div>
	
		<br><br>
	<div class="row justify-content-center" style="width:1100px;">
		<button id="CouponRegister" class="btn btn-block btn-primary" style="width: 200px;" onclick="openPop(800,300)">등록</button>
	</div>
</div>


</body>
</html>