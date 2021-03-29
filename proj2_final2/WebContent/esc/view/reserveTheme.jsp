<!-- 12월 27일 추가사항 :(지안) reserveTheme페이지를 새로 만들었습니다. Practice 페이지 삭제 부탁드립니다 -->

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="com.proj.brand.model.BrandService"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.location1.model.Location1VO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.location1.model.Location1Service"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="loc1Vo" class="com.proj.location1.model.Location1VO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="loc1Vo" />
<jsp:useBean id="loc1Service"
	class="com.proj.location1.model.Location1Service" scope="session"></jsp:useBean>
<jsp:useBean id="brandVo" class="com.proj.brand.model.BrandVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brandVo" />
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>
<jsp:useBean id="unitVo" class="com.proj.unit.model.UnitVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="unitVo" />
<jsp:useBean id="unitService" class="com.proj.unit.model.UnitService"
	scope="session"></jsp:useBean>
<jsp:useBean id="themeVo" class="com.proj.theme.model.ThemeVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="themeVo" />
<jsp:useBean id="themeService" class="com.proj.theme.model.ThemeService"
	scope="session"></jsp:useBean>
<jsp:useBean id="themeImgVo" class="com.proj.themeImg.model.ThemeImgVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="themeImgVo" />
<jsp:useBean id="themeImgService"
	class="com.proj.themeImg.model.ThemeImgService" scope="session"></jsp:useBean>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* 
 */
 
 	



	$(function(){
		$('#menu-reserve').addClass('active');			
	})
	
		$(function(){
		$('#location1Code').click(function(){
			$('#location1Img').css("display","inline");
			$('#brandNoImg').css("display","none");
			$('#unitNoImg').css("display","none");
			$('#themeNoImg').css("display","none");
		});
		
		$('#brandNo').click(function(){
			$('#location1Img').css("display","none");
			$('#brandNoImg').css("display","inline");
			$('#unitNoImg').css("display","none");
			$('#themeNoImg').css("display","none");
		});
		
		$('#unitNo').click(function(){
			$('#location1Img').css("display","none");
			$('#brandNoImg').css("display","none");
			$('#unitNoImg').css("display","inline");
			$('#themeNoImg').css("display","none");
		});
	
		$('#themeNo').click(function(){
			$('#location1Img').css("display","none");
			$('#brandNoImg').css("display","none");
			$('#unitNoImg').css("display","none");
			$('#themeNoImg').css("display","inline");
		
		});
	})
	
	function goPageBr(location1Code){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code;
		document.getElementById("location1Img").style.display = "none";
		document.getElementById("brandNoImg").style.display = "inline";
		document.getElementById("unitNoImg").style.display = "none";
		document.getElementById("themeNoImg").style.display = "none";
	}
	function goPageUn(location1Code, brandNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code+"&brandNo="+brandNo;
		document.getElementById("location1Img").style.display = "none";
		document.getElementById("brandNoImg").style.display = "none";
		document.getElementById("unitNoImg").style.display = "inline";
		document.getElementById("themeNoImg").style.display = "none";
				
	}
	function goPageTh(location1Code, brandNo,unitNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code+"&brandNo="+brandNo+"&unitNo="+unitNo;
		document.getElementById("location1Img").style.display = "none";
		document.getElementById("brandNoImg").style.display = "none";
		document.getElementById("unitNoImg").style.display = "none";
		document.getElementById("themeNoImg").style.display = "inline";
				
	}
	
	function goThemePage(location1Code,brandNo,unitNo,themeNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserveTheme.jsp?location1Code="+location1Code+"&brandNo="+brandNo+"&unitNo="+unitNo+"&themeNo="+themeNo;
	}
	
	function goLogin(){
		if(confirm('로그인을 하셔야 예약이 가능합니다!')){
			location.href="<%=request.getContextPath()%>/esc/login/login.jsp";
		} else {
			history.back();
		}
	}

	function setTime(clickTime) {
		document.getElementById("clickTime").value = clickTime;
		document.getElementById("clickTime2").value = clickTime;


	}

	$(function() {

		$('form[name=frmReserve]').submit(function() {
			if ($('#datePicker').val().length < 1) {
				alert('날짜를 선택해 주세요');
				$('#datePicker').focus();
				event.preventDefault();
			} else if ($('#clickTime').val().length < 1) {
				alert('시간을 선택해 주세요');
				$('#clickTime').focus();
				event.preventDefault();
			}
		});
	});
	
</script>
<!-- content -->
<!-- 오른쪽에 아이디 , 자물쇠이미지 따야함 -->
<%
			//inc - top.jsp 에서 [reserve] 클릭하면 get 방식으로 이동
		//1. 
		
		request.setCharacterEncoding("utf-8");
		
		String top_userid = (String) session.getAttribute("userid");
		
		//reserve.jsp 에서 themeNo onchange() 실행시 get방식으로 전송
		String location1Code = request.getParameter("location1Code");
		String brandNo = request.getParameter("brandNo");
		String unitNo = request.getParameter("unitNo");
		String themeNo = request.getParameter("themeNo");
		
		if (location1Code == null || location1Code.isEmpty()) {
			location1Code = "0";
		}
		if (brandNo == null || brandNo.isEmpty()) {
			brandNo = "0";
		}
		if (unitNo == null || unitNo.isEmpty()) {
			unitNo = "0";
		}
		if (themeNo == null || themeNo.isEmpty()) {
			themeNo = "0";
		}
		
		//테마 이미지 구하기
		String brandName = null;
		String unitName = null;
		String themeName = null;
		String themeContent = null;
		int playTime = 0;
		//브랜드 이름 구하기
		try {
			brandName = brandService.selectBrandNameByBrandNo(Integer.parseInt(brandNo));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//유닛 이름 구하기
		try {
			unitName = unitService.selectUnitNameByUnitNo(Integer.parseInt(unitNo));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//테마 이름 , 내용 구하기
		themeVo = new ThemeVO();
		try {
			themeVo = themeService.selectByThemeNo(Integer.parseInt(themeNo));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		themeName = themeVo.getThemeName();
		themeContent = themeVo.getThemeContent();
		playTime = themeVo.getPlayTime();
		
		if (themeContent == null || themeContent.isEmpty()) {
			themeContent = "해당 컨텐츠는 직접 가서 즐겨주세요";
		}
		
		//테마 이미지구하기
		String themeSrc = themeImgService.selectImgSrcByThemeNo(Integer.parseInt(themeNo));
		
		//지역, 브랜드, 유닛 , 테마 리스트 구하기
		List<Location1VO> loc1list = null;
		try {
			loc1list = loc1Service.selectAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		List<BrandVO> brlist = null;
		try {
			brlist = brandService.selectByLoc1(location1Code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		List<UnitVO> unlist = null;
		try {
			unlist = unitService.selectUnitByBrandLocation1(Integer.parseInt(brandNo), location1Code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		List<ThemeVO> thlist = null;
		try {
			thlist = themeService.selectThemeByBrandUnit(Integer.parseInt(brandNo), Integer.parseInt(unitNo));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int startTime1 = 10, startTime2 = 0, interval = 15;
		String st2 = "00";
%>





<div class="ftco-blocks-cover-1">
	<!-- 헤더 부분 높이 수정 (지안, 수빈) -->
	<div class="site-section-cover1 overlay"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row align-items-center ">

				<div class="col-md-5 mt-5 pt-5">
					<span class="text-cursive h5 text-red" style="color: red">reserve</span>
					<h1 class="mb-3 font-weight-bold text-teal">Reserve</h1>
					<p>
						<a href="<%=request.getContextPath()%>/esc/index.jsp"
							class="text-white">Home</a> <span class="mx-3">/</span> <strong>Reserve</strong>
					</p>
				</div>

			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>

<div class="container" id="reserveBox">
	<div class="reserveBoxList">
		<div>
			<span>지역</span> <img id="location1Img" alt="달리는 사람"
				style="display: none;" src="../images/reserveRunYellow.png"
				width="60px">
		</div>

		<div class=" justify-content-center">
			<span>브랜드 </span> <img id="brandNoImg" alt="달리는 사람"
				style="display: none;" src="../images/reserveRunYellow.png"
				width="60px">
		</div>

		<div>
			<span>지점</span> <img id="unitNoImg" alt="달리는 사람"
				style="display: none;" src="../images/reserveRunYellow.png"
				width="60px">
		</div>
		<div>
			<span>테마</span> <img id="themeNoImg" alt="달리는 사람"
				style="display: inline;" src="../images/reserveRunYellow.png"
				width="60px">
		</div>
	</div>
	<!-- reserveBoxList 끝 -->

	<br>

	<div class="reserveSelectBox" id="reserveSelectBox">
		<hr style="border: 2px solid gray">
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="location1Code"
			name="location1Code" onchange="goPageBr(this.value)">
			<%
				for (int i = 0; i < loc1list.size(); i++) {
					loc1Vo = loc1list.get(i);
					String Location1Code2 = loc1Vo.getLocation1Code();
			%>	<option value="<%=Location1Code2%>"
				<%if (Location1Code2.equals(location1Code)) {%> 
						selected="selected"
				<%}%>><%=loc1Vo.getLocation1Name()%></option>
			<%
				}//for 끝
			%>
		 </select> 
		 
		 <select class="form-select" size="10" multiple
		 aria-label="multiple select example" id="brandNo" name="brandNo"
		onchange="goPageUn(location1Code.value,this.value)">
			<%
			if (brlist.size() == 0 || brandNo.equals(0)) {
			%>
				<option value="0" selected disabled="disabled">브랜드</option>
			<%
			} else {
				for (int i = 0; i < brlist.size(); i++) {
					brandVo = brlist.get(i);
					int brandNo2 = brandVo.getBrandNo();
			%>
				<option value="<%=brandNo2%>"
					<%if (brandNo2 == Integer.parseInt(brandNo)) {%> 
						selected="selected"
				<%}%>><%=brandVo.getBrandName()%></option>
			<%
				}//for 끝
			}//if - else 끝
			%>
		 </select>
		
		 <select class="form-select" size="10" multiple
			aria-label="multiple select example" id="unitNo" name="unitNo"
			onchange="goPageTh(location1Code.value,brandNo.value,this.value)">
			<%
				if (unlist.size() == 0 || unitNo.equals(0)) {
			%>
					<option value="0" selected disabled="disabled">지점</option>
			<%
				} else {
					for (int i = 0; i < unlist.size(); i++) {
						unitVo = unlist.get(i);
						int unitNo2 = unitVo.getUnitNo();
			%>
			<option value="<%=unitNo2%>"
				<%if (unitNo2 == Integer.parseInt(unitNo)) {%>
						 selected="selected"
				<%}%>><%=unitVo.getUnitName()%></option>
			<%
				}
			}
			%>
		</select> 
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="themeNo" name="themeNo"
			onchange="goThemePage(location1Code.value,brandNo.value,unitNo.value,this.value)">
			<%
				if (thlist.size() == 0 || unitNo.equals(0)) {
			%>
			<option value="0" selected disabled="disabled">지점</option>
			<%
				} else {
					for (int i = 0; i < thlist.size(); i++) {
						themeVo = thlist.get(i);
						int themeNo2 = themeVo.getThemeNo();
			%>
			<option value="<%=themeVo.getThemeNo()%>"
				<%if (themeNo2 == Integer.parseInt(themeNo)) {%> 
						selected="selected"
				<%}%>><%=themeVo.getThemeName()%></option>
			<%
				}
			}
			%>
		</select>
		<hr style="border: 2px solid gray">
	</div>
	<!-- reserveselectBox 끝 -->

	<br> <br> <br>

	<%
		//http://localhost:9000/semi2/esc/view/find/roomDetail.jsp?no=1
	//find.jsp에서 테마 이름 누를 경우 그 지점+테마=방 번호를 가지고 이동(a태그 =>get)
	%>
</div>

	<div class="container">
		<form action="<%=request.getContextPath()%>/esc/view/reserveDetail.jsp"
				method="post" name="frmReserve">
				<input type="hidden" name="brandNameInput" value="<%=brandName%>">
				<input type="hidden" name="unitNameInput" value="<%=unitName%>">
				<input type="hidden" name="themeNameInput" value="<%=themeName%>">
				<input type="hidden" name="brandNoInput" value="<%=brandNo%>">
				<input type="hidden" name="unitNoInput" value="<%=unitNo%>">
				<input type="hidden" name="themeNoInput" value="<%=themeNo%>">
				<input type="hidden" name="clickTime" id="clickTime" value="">
		<div class="row">
			<div class="col-lg-4 mb-4 mb-lg-0">
				<div class="package text-center bg-white">
					<img class="img-fluid" src="<%=themeSrc%>" alt="imgae_theme">
				</div>
			</div>

		
		
				<div class="col-lg-5 mb-5 mb-lg-0">
					<br>
					<p>
						<a href="<%=request.getContextPath()%>/esc/view/unitDetail.jsp"><%=brandName%>&nbsp;<%=unitName%></a>
					</p>
					<!-- (전체 a 태그, 클릭 시 unitDetail로 이동) -->
					<h4 class="text-black"><%=themeName%>
					</h4>
					<br> <span>&nbsp;&nbsp;&nbsp;테마 소개: <%=themeContent%></span>
				</div>
				<!-- col-lg-5-mb-5-mb-lg-0 끝 -->

				<div class="col-lg-3 mb-3 mb-lg-0">
					<br> <br>
					<p>
					<h6 class="text-info">날짜를 선택해주세요</h6>
					<div id="datepicker">
						<input type="text" id="datePicker" name="datePicker" style="text-align:right;">

						
						<script
							src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
							
						</script>
						<script	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
						<script type="text/javascript">
							$('#datePicker').datepicker({
								format : "yyyy-mm-dd",
								todayHighlight : true,
								startDate : '0d',
								endDate : '+7d',
								autoclose : true
							});

							/* $('$click-btn').on('click', function(){
								var date=$('#dateRangePicker').val();
								alert(date);
							}); */
						</script>
					</div>
					<!-- datePicker 끝 -->
					<div>
						<p>
						<h6 class="text-info">시간을 선택해주세요</h6>
						<input type="text" id="clickTime2" disabled="disabled" style="text-align:right;">
						
						<div id="timepicker">
							<!-- <input type="text" id="timePicker"></p> -->
							<div id="buttonArr">
								<%
									System.out.println("playTime=" + playTime);
								for (int i = 0; i < 9; i++) {

									if (i > 0) {

										startTime1 += (playTime / 60);
										startTime2 += ((playTime % 60) + interval);

										if ((startTime2 / 60) > 0) {
									startTime1 += (startTime2 / 60);
									startTime2 -= 60 * (startTime2 / 60);
										}

										if (startTime2 < 10) {
									st2 = "0" + startTime2;
										} else {
									st2 = startTime2 + "";
										}
									}

									System.out.println(i + "번째 startTime1=" + startTime1 + " : startTime2=" + startTime2);
								%>
								<%-- <button class="btn btn-teal btn-custom-2 mt-4"
									name="reserveTime" id="btTimeR" onclick="setTime(this.value)" 
									value="<%=startTime1%>:<%=st2%>"><%=startTime1%>:<%=st2%></button> --%>
									<button type="button" class="btn btn-lg btn-info mt-4" data-bs-toggle="popover" 
										name="reserveTime" id="btTimeR" title="Popover title" onclick="setTime(this.value)" value="<%=startTime1%>:<%=st2%>"><%=startTime1%>:<%=st2%></button>
								<%
									} //for
								%>

							</div>
							<!-- buttonArr 끝 -->
							<!-- 버튼 집합 -->

						</div>
						<!-- 타임피커 끝 -->
					</div>
			
				<!-- 일반 div 끝 -->
				</div>
				<!-- class col 4 ~ 끝 -->							
				
			</div>
			<br>
			<br>
			
			<%
					if (top_userid == null || top_userid.isEmpty()) {
					%>
					<div class="row justify-content-center">
					<!-- 시간 버튼 -->
						<input type="button" class="btn btn-danger btn-custom-1 mt-4" style="width:130px; font-size:24px;"
							 onclick="goLogin()" value="예약" />
					</div>

				<%
					}else{
				%>
					<div class="row justify-content-center">
						<input type="submit" class="btn btn-danger btn-custom-1 mt-4" style="width:130px; font-size:24px;"
							value="예약" />
					</div>
				<%
					}
				%>
			
		</form>
	</div>
	
			<br><br>
	
				

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<br>
<br>
<Br>
<br>
<%-- 	<div class="row justify-content-center">
			<button class="btn btn-warning btn-custom-1" style="width:160px; border-radius:30px;" onclick="location.href='<%=request.getContextPath()%>/esc/view/reserveDetail.jsp'" >예약 확인</button>
		</div>  --%>






<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>


