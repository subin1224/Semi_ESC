<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="noticeVo" class="com.proj.notice.model.NoticeVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo" />
<jsp:useBean id="noticeService"
	class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
<jsp:useBean id="brVo" class="com.proj.brand.model.BrandVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brVo" />
<jsp:useBean id="brService"
	class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function closePop() {
		$('#couponRegister').close();
	};
	
</script>

</head>
<body style="background-color: rgba(253,248,227,0.3);">
<%

	String brandName = request.getParameter("brandName");
	String adId = request.getParameter("adId");
	
	try{
		brVo=brService.selectByAdminId(adId);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	

%>
	
	<form action="<%=request.getContextPath() %>/esc/ok/noticeWriteOk.jsp" method="post">
	<input type="hidden" name="brandNo" value="<%=brVo.getBrandNo()%>">
	<div class="container m-auto" align="center">
		<div
			style="width: 100%; font-size: 32px; font-weight: bold; text-align: center; height: 70px; padding-top: 40px;">
			<span>NOTICE</span>
		</div>
			<br>
				<div style="margin-left:480px;">
				<img alt="왼쪽 하트" src="<%=request.getContextPath() %>/esc/images/heart1.png" width="21px"> 
					<span><b><%=brVo.getBrandName() %></b> <b><%=adId %></b></span> 
				<img alt="오른쪽 하트" src="<%=request.getContextPath() %>/esc/images/heart2.png" width="20px">
				</div>
			
			
		<div class="input-group mb-3" style="width: 700px; height: 40px; margin-top:10px;">
			<span class="input-group-text" id="inputGroup-sizing-default"
				style="font-size: 20px; height:40px;">TITLE</span> 
			<input type="text" name="noticeTitle" class="form-control" style="height:40px;" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
		
		
		<div style="margin-top:20px;">
		<textarea class="form-control" id="rvEditor" name="noticeContent"></textarea>
		<script type="text/javascript">
			CKEDITOR.replace('rvEditor', {
				height : 300,
				width : 700

			});
		</script>
		</div>
		<br>
		
		<div class="row justify-content-center" >
		<input type="submit" id="noticeWrite" class="btn btn-danger btn-custom-1"
			style="width: 150px;" value="등록"><!--  openPop(900,500) -->
	</div>
	</div>
	<br>
	<Br>
	</form>
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
</body>
</html>