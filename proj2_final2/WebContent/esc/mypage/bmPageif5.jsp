<%@page import="com.proj.genre.model.GenreVO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandServiceif5" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>    
<jsp:useBean id="unitServiceif5" class="com.proj.unit.model.UnitService" scope="session"></jsp:useBean>    
<jsp:useBean id="genreServiceif5" class="com.proj.genre.model.GenreService" scope="session"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>bm_themeRegister</title>
<link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">
 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jquery.fancybox.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/aos.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/binstyle.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/style.css">
	
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">

	var sel_file;
	
	$(function(){
		
		$('#upfile').on("change", handleImgFileSelect);
		
		 $("input:radio[name=lock]").click(function(){
		 	if($("input[name=lock]:checked").val() == "1"){
		    	$("#s1").css("background","#FFCC33");
		    	$("#s2").css("background","");
		 		$("#s3").css("background","");
		 		$("#s4").css("background","");
		 		$("#s5").css("background","");
		 	}else if($("input[name=lock]:checked").val() == "2"){
		 		$("#s1").css("background","#FFCC33");
		 		$("#s2").css("background","#FFCC33");
		 		$("#s3").css("background","");
		 		$("#s4").css("background","");
		 		$("#s5").css("background","");
		 	}else if($("input[name=lock]:checked").val() == "3"){
		 		$("#s1").css("background","#FFCC33");
		 		$("#s2").css("background","#FFCC33");
		 		$("#s3").css("background","#FFCC33");
		 		$("#s4").css("background","");
		 		$("#s5").css("background","");
		 	}else if($("input[name=lock]:checked").val() == "4"){
		 		$("#s1").css("background","#FFCC33");
		 		$("#s2").css("background","#FFCC33");
		 		$("#s3").css("background","#FFCC33");
		 		$("#s4").css("background","#FFCC33");
		 		$("#s5").css("background","");
		 	}else if($("input[name=lock]:checked").val() == "5"){
		 		$("#s1").css("background","#FFCC33");
		 		$("#s2").css("background","#FFCC33");
		 		$("#s3").css("background","#FFCC33");
		 		$("#s4").css("background","#FFCC33");
		 		$("#s5").css("background","#FFCC33");
		 	}
		 });
		
		 function handleImgFileSelect(e){
			 var files = e.target.files;
			 var filesArr = Array.prototype.slice.call(files);
			 
			 filesArr.forEach(function(f){
				 if(!f.type.match("image.*")){
					 alert("확장자는 이미지 확장자만 가능합니다!");
					 return;
				 }
				 
				 sel_file = f;
				 
				 var reader = new FileReader();
				 reader.onload = function(e){
					 $('#img').attr('src', e.target.result);
				 }
				 reader.readAsDataURL(f);
			 })
		 }
		 
	});
	</script>	
	<%
	//로그인 = adid 가 있어 => id로 vo를 뽑아오거나 혹은 brandno 뽑아오는 메서드 이용해서 no를 구하고, inputtype hidden에 넣자
	//selectByAdminId - brandService 이용
	String brid = (String)session.getAttribute("adid");
	
	BrandVO voif5 = null;
	try{
		voif5=brandServiceif5.selectByAdminId(brid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//해당브랜드의 유닛들
	List<UnitVO> uListif5 =null;
	try{
		uListif5=unitServiceif5.selectUnitByBrandNo(voif5.getBrandNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//장르 뽑아오기 GenreService의 -selectByAll() 이용 
	List<GenreVO> gListif5 = null;
	try{
		gListif5=genreServiceif5.selectByAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	%>

</head>
<body >
	<div class="container m-auto" >
		<div style="width:1500px; margin-bottom:10px;" >
			<span style="float: left;">●테마 등록 | 해당 브랜드의 테마를 등록할 수 있습니다</span>
			<br>
		</div>
		
			<form name="themeFrm" method="post" action="<%=request.getContextPath() %>/esc/ok/bmThemeOk.jsp" enctype="multipart/form-data" style="width:1300px;" >
				<div class="row">
					<div class="col-md-3 col-lg-3">
						<div>
							<img id="img"  style="width:255px; height:314px;" class="img-fluid" alt="썸네일이미지" src="<%=request.getContextPath()%>/esc/images/jianPick.png">
								<div style="margin-left:5px; margin-top:5px;">
								<input type="file" name="upfile" id="upfile" />						
							</div>
						</div>
					</div>
			
					
					<div class="col-md-4 col-lg-4">
						<div class="row">
							<div class="col-lg-6">
								<span>테마 명</span>
								<input type="text" class="form-control" id="tname" name="tname" style="width:373px; height:40px;">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<span>테마 가격</span>
								<input type="text" class="form-control" id="tprice" name="tprice" style="width:373px; height:40px;">
							</div>				
						</div>
						<div class="row">
							<div class="col-lg-4">
								<span>이용 시간</span>
								<input type="text" class="form-control" id="tplaytime" name="tplaytime" style="width:120px; height:40px;">
							</div>
							<div class="col-lg-4">
								<span>최소 인원</span>
								<input type="text" class="form-control" id="tmin" name="tmin" style="width:100px; height:40px;">
							</div>
							<div class="col-lg-4">
								<span>최대 인원</span>
								<input type="text" class="form-control" id="tmax" name="tmax" style="width:90px; height:40px;">
							</div>
						</div>
					
					<p>
						<span>테마 소개</span><br>
						<textarea class="form-control" id="tcontent" name="tcontent" style="width:400px; height:235px;" >  </textarea>
					</p>
				</div>
				
				<div class="col-md-3 col-lg-3" style="margin-left:20px;">
					<div>
						<span>난이도</span><br>
						<div class="lockRadio">
						  <label class="lockRadio__box" id="lbx1">
						    <input type="radio" name="lock" id="l1" value="1">
						    <span class="lockRadio__img" id="s1"><span class="bin-blind">자물쇠 1개</span></span>
						  </label>
						  <label class="lockRadio__box">
						    <input type="radio" name="lock" id="l2" value="2">
						    <span class="lockRadio__img" id="s2"><span class="bin-blind">자물쇠 2개</span></span>
						  </label>
						  <label class="lockRadio__box">
						    <input type="radio" name="lock" id="l3" value="3">
						    <span class="lockRadio__img" id="s3"><span class="bin-blind">자물쇠 3개</span></span>
						  </label>
						  <label class="lockRadio__box">
						    <input type="radio" name="lock" id="l4" value="4">
						    <span class="lockRadio__img" id="s4"><span class="bin-blind">자물쇠 4개</span></span>
						  </label>
						  <label class="lockRadio__box">
						    <input type="radio" name="lock" id="l5" value="5">
						    <span class="lockRadio__img" id="s5"><span class="bin-blind">자물쇠 5개</span></span>
						  </label>
						 
						</div>
					</div> 				
					<div class="row">
						<span>장르</span>
						<select id="genre" class="form-control " name="genre">
							<option value="0">장르를 선택해주세요!</option>
						<%	for(int a=0; a<gListif5.size(); a++){ 
							GenreVO gVo = gListif5.get(a);		
						%>
							<option value="<%=gVo.getGenreCode()%>"><%=gVo.getGenreName() %></option>
						<%	} %>
						</select> <br>
					</div>
					<div class="row mt-2">
						<select id="genre2" class="form-control" name="genre2">
							<option></option>
						<%	for(int a=0; a<gListif5.size(); a++){ 
							GenreVO gVo = gListif5.get(a);		
						%>
							<option value="<%=gVo.getGenreCode()%>"><%=gVo.getGenreName() %></option>
						<%	} %>
						</select>
					</div>
					<div class="row">
						<!-- 지점 -->
						<span>지점</span>
						<select id="unit" class="form-control" name="unit">
						<%for(int i=0; i<uListif5.size(); i++){ 
							UnitVO uVoif5 = uListif5.get(i); %>
							<option value="<%=uVoif5.getUnitNo()%>"><%=uVoif5.getUnitName() %></option>
						<%} %>
						</select>
					</div>
					<div class="block-counter-1">
						<input type="submit" class="btn btn-warning btn-custom mt-4 " style="width:120px; height:80px; font-size: 13px;" value="테마 등록">
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning btn-custom mt-4" style="width:120px; height:80px; font-size: 13px;" onclick="window.close()">닫기</button>
					</div>
				</div>
				
				<input type="hidden" name="brandNo" value="<%=voif5.getBrandNo()%>">
	
				</div>
			</form>
		</div>
				
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery-migrate-3.0.0.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.sticky.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.animateNumber.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.fancybox.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.stellar.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/bootstrap-datepicker.min.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/aos.js"></script>
    <script src="<%=request.getContextPath()%>/esc/js/main.js"></script>
	
</body>
</html>