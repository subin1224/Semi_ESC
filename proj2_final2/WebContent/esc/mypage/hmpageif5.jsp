<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>쿠폰 등록하기</title>
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/jquery.fancybox.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/aos.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/binstyle.css">

<!-- MAIN CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/jianstyle.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/esc/css/sjstyle.css">

<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function closePop() {
		$('#couponRegister').close();
	};
	
	//마지막 날짜 유효성 검사
	window.onload = function(){
		  onlyNumberFunc(document.getElementById("endDate"));
		  onlyNumberFunc(document.getElementById("couponPrice"));
		}
		
		//마일리지 유효성 검사 함수
		function onlyNumberFunc(t){
			 var regexp = /[^0-9]/gi;
			 t.onkeyup = function(e){
			var v = this.value;
		    this.value = v.replace(regexp,'');
			}
		}
</script>

</head>
<body>


<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
	String date2 = sdf.format(date);
%>
	<div class="site-section">
		<div class="container m-auto">
			<form
				action="<%=request.getContextPath()%>/esc/ok/couponRegisterOk.jsp"
				method="post">
				<table class="table-striped-odd">
					<tbody>
						<tr class="text-center">
							<th style="width: 20%">쿠폰이름</th>
							<th style="width: 20%">쿠폰코드</th>
							<th style="width: 20%">할인가격</th>
							<th style="width: 20%">적용시작일</th>
							<th style="width: 20%">사용가능기한</th>
							<!-- <th style="width: 4%">적용가능여부</th> -->
						</tr>
						<tr>
							<td class="text-center">
								<input type="text" style="text-align: center;" name="couponName" class="text-register" placeholder="쿠폰이름">
							</td>
							<td class="text-center">
								<input type="text" style="text-align: center;" name="couponCode" class="text-register" placeholder="COUPON123"></td>
							<td class="text-center">
								<input type="text" style="text-align: center;" id="couponPrice" name="couponPrice" class="text-register" placeholder="0"></td>
						
							<td class="text-center">
									<input type="text" style="text-align: center;" id="startDate" disabled="disabled" name="startDate" value="<%=date2 %>">
							</td>
							<td class="text-center">
								<input type="text" style="text-align: center;" id="day" name="day" class="text-register" style="width: 110px;" placeholder="0">
							</td>
							<!-- <td class="text-center">Y</td> -->
						</tr>

					</tbody>
				</table>


				<br>
				<br>
				<div class="row justify-content-center">
					<input type="submit" id="couponRegister"
						class="btn btn-block btn-primary" style="width: 200px;" value="확인">
				</div>
			</form>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		</div>
	</div>

</body>
</html>