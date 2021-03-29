<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="themeVo" class="com.proj.theme.model.ThemeVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="themeVo"/>
<jsp:useBean id="themeService" class="com.proj.theme.model.ThemeService" scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.proj.member.model.MemberVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="memVo"/>
<jsp:useBean id="memService" class="com.proj.member.model.MemberService" scope="session"></jsp:useBean>
<jsp:useBean id="themeImgVo" class="com.proj.themeImg.model.ThemeImgVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="themeImgVo"/>
<jsp:useBean id="themeImgService" class="com.proj.themeImg.model.ThemeImgService" scope="session"></jsp:useBean>
<jsp:useBean id="roomVo" class="com.proj.room.model.RoomVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="roomVo"/>
<jsp:useBean id="roomService" class="com.proj.room.model.RoomService" scope="session"></jsp:useBean>

<jsp:include page="../inc/top.jsp"></jsp:include>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$('#goPage').click(function(){
			$('#reserveDetailfrm').submit();
		});
	});
	
	window.onload = function(){
	  onlyNumberFunc(document.getElementById("mileageInput"));
	}
	
	//마일리지 유효성 검사 함수
	function onlyNumberFunc(t){
		 var regexp = /[^0-9]/gi;
		 t.onkeyup = function(e){
		var v = this.value;
	    this.value = v.replace(regexp,'');
		}
	}

	//오프너 열기 함수
	function openPop(sw,sh){
		cw=screen.availWidth; //화면 너비
		ch=screen.availHeight; //화면 높이

	

		ml=(cw-sw)/2;
		mt=(ch-sh)/2;

		test=window.open('couponList.jsp','coupon','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
	}
	
	 //마일리지 입력칸 유효성 검사 (숫자만 입력 가능하게끔)
	 
 	function setChildValue(code,discount){
 		//할인 적용 전 가격 
		var FirstPrice = document.getElementById("themeFirstPrice").value;
 		//마일리지에 회원이 입력한 가격
		 var mileagePrice = document.getElementById("mileageInput").value;
 		//마일리지 입력 가격 + 쿠폰 가격 (총 할인가격)
		 var total = parseInt(mileagePrice) + parseInt(discount);
		var result =0;
		
		// 총할인 가격이 할인 적용 전 가격보다 더 크다면
		if(total>FirstPrice){
			//할인 적용 전 가격에서 쿠폰 가격을 뺀 값을 구합니다.
			result = parseInt(FirstPrice)-parseInt(discount);
			// 그 가격을 회원이 입력하려 한 마일리지 텍스트 필드에 넣어줍니다.
			document.getElementById("mileageInput").value = result;
			//총 할인 가격은 할인 적용 전 가격과 같습니다.
			total = FirstPrice;		
		}
		
			//자식창에서 가져온 쿠폰 넘버를 쿠폰 이름 텍스트에 넣습니다.
		    document.getElementById("couponText").value = code; 
			//쿠폰가겨을 hidden 쿠폰 텍스트 필드에 넣습니다.
		    document.getElementById("hiddenCoupon").value = discount; 
			//총 가격은 할인전 가격에서 총 할인가격을 뺀 가격입니다.
			var totalPrice = parseInt(FirstPrice)-parseInt(total);
			//총 가격을  span 위치에 넣고 post로 보내기위해 hidden 필드에도 넣어줍니다.
			document.getElementById("TotalPriceSpan").innerHTML=totalPrice;
			document.getElementById("totalPriceInput").value=totalPrice;

			//마지막으로 총 할인 가격 텍스트 필드에 총 할인가격을 넣어줍니다.
		     document.getElementById("totalCountPrice").value=total;
		
	}
 	
 

	function changePrice(playerNum){
		//플레이어 콤보박스가 change 이벤트 발생할때 적용되는 함수입니다.
		//해당 테마의 기본 페이를 Hidden으로 숨겨준후 그값을 가져옵니다.
		var FirstPrice2 = document.getElementById("firstPriceInput").value;
		//기본페이 * 사람 인원수
		var changeThemePrice2 = playerNum*FirstPrice2;
		//변한 가격을 테마 가격에 넣습니다.
		document.getElementById("themeFirstPrice").value = changeThemePrice2;
		//할인 하는 총 가격을 가져옵니다.
		var totalCountPrice2 = document.getElementById("totalCountPrice").value;
		
		//만약 할인가가 변한 테마 가격보다 크다면 적용시키는 if함수
		if(parseInt(totalCountPrice2) > parseInt(changeThemePrice2)){
			//총 할인가 - 쿠폰 한 가격을 마일리지에 장착시켜줍니다. 
			//계산해야할 총 가격은 0원입니다. 5000-5000원은 0원.. 
			document.getElementById("totalCountPrice").value = changeThemePrice2;
		     var couponPrice2 = document.getElementById("hiddenCoupon").value;
			 var mileage2 = parseInt(changeThemePrice2)-parseInt(couponPrice2);
			document.getElementById("mileageInput").value=mileage2;
			document.getElementById("TotalPriceSpan").innerHTML=0;
			document.getElementById("totalPriceInput").value=0;

		}else{
			//그게 아니라면 변화된 총 가격 - 할인가격을 한후 계산해야하는 총 가격에 넣어줍니다.
			var totalPrice = parseInt(changeThemePrice2)-parseInt(totalCountPrice2);
			document.getElementById("TotalPriceSpan").innerHTML=totalPrice;
			document.getElementById("totalPriceInput").value=totalPrice;

		}
	}
	
	function changeMileage(mileage){
		
		var totalMileage3 = document.getElementById("totalMileage").innerHTML;
		if(parseInt(mileage)>parseInt(totalMileage3)){
			document.getElementById("warningInput").innerHTML="전체 마일리지를 확인 해주세요";
			document.getElementById("mileageInput").value=0;
		}else if(parseInt(mileage)<0){
			document.getElementById("warningInput").innerHTML="숫자 0 이상 입력 가능 합니다";
			document.getElementById("mileageInput").value=0;
		}else{
			document.getElementById("warningInput").innerHTML="";
			var result3 =0;
			var totalPrice3 =0;
			var nowCouponPrice3 = document.getElementById("hiddenCoupon").value;
			var totalDiscount3 = parseInt(mileage)+parseInt(nowCouponPrice3);
			var FirstPrice3 = document.getElementById("themeFirstPrice").value;
			if(parseInt(FirstPrice3) < parseInt(totalDiscount3)){
				result3 = parseInt(FirstPrice3)-parseInt(nowCouponPrice3);
				document.getElementById("mileageInput").value=result3;
				document.getElementById("totalCountPrice").value = FirstPrice3;
				document.getElementById("TotalPriceSpan").innerHTML=0;
				document.getElementById("totalPriceInput").value=0;

			}else{
				totalPrice3= parseInt(FirstPrice3)-parseInt(totalDiscount3);
				document.getElementById("totalCountPrice").value = totalDiscount3;
				document.getElementById("TotalPriceSpan").innerHTML=totalPrice3;
				document.getElementById("totalPriceInput").value=totalPRice3;

			}

		}
		
		
	}


	
</script>

<!-- content -->



<%
	//reserveTheme에서 post방식으로 submit
	
	request.setCharacterEncoding("utf-8");

	String top_userid = (String)session.getAttribute("userid");
	
	String brandName = request.getParameter("brandNameInput");
	String unitName= request.getParameter("unitNameInput");
	String themeName = request.getParameter("themeNameInput");
	String brandNo	= request.getParameter("brandNoInput");
	String unitNo = request.getParameter("unitNoInput");
	String themeNo = request.getParameter("themeNoInput");
	String datePicker = request.getParameter("datePicker");
	String timePicker = request.getParameter("clickTime");
	
	
	//테마 번호로 테마 정보 받아오기 => playermin ~playmax
	try{
		themeVo = themeService.selectByThemeNo(Integer.parseInt(themeNo));
	}catch(SQLException e){
		e.printStackTrace();
	}

	int playerMin = themeVo.getPlayerMin();
	int playerMax = themeVo.getPlayerMax();

	//초기 총 가격 적용 하기
	int themePrice = themeVo.getThemePrice();
	int firstPrice = themePrice*playerMin;
	
	//유저 아이디로 마일리지 전체 조회하기
	try{
		memVo = memService.selectMember(top_userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	int firstMileage = memVo.getMileage();
	
	
	//테마이미지
	String themeSrc = themeImgService.selectImgSrcByThemeNo(Integer.parseInt(themeNo));
	
	//브랜드 번호, 테마 번호, 지점 번호로 roomno 받아오기
	
	int roomNo = roomService.selectRoomNoBy(Integer.parseInt(brandNo), Integer.parseInt(unitNo), Integer.parseInt(themeNo));
%>
<div class="ftco-blocks-cover-1">
	<!-- 헤더 부분 높이 수정 (지안, 수빈) -->
	<div class="site-section-cover1 overlay"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row align-items-center ">

				<div class="col-md-5 mt-5 pt-5">
					<span class="text-cursive h5 text-red">reserve</span>
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


	<div class="container" >

	

	<form action="<%=request.getContextPath()%>/esc/ok/reserveRegisterOk.jsp" name="reserveDetailfrm" method="post" id="reserveDetailfrm">
	<input type="hidden" name="firstPriceInput" id="firstPriceInput" value="<%=themePrice %>">
	<input type="hidden" name="userNo" id="userNo" value="<%=memVo.getUserNo()%>">
	<input type="hidden" name="roomNo" id="roomNo" value="<%=roomNo%>">
	<input type="hidden" name="timePicker" id="timePicker" value="<%=timePicker%>">
	<input type="hidden" name="datePicker" id="datePicker" value="<%=datePicker%>">
	<input type="hidden" name="totalPriceInput" id="totalPriceInput" value="<%=firstPrice%>">
	<input type="hidden" name="hiddenCoupon" id="hiddenCoupon" value="0">
	
	
	
		<div class="heartUserid">
			<div>
				<img alt="왼쪽 하트" src="../images/heart1.png" width="40px"
					height="40px"> <span><b><%=top_userid %></b></span> <img
					alt="오른쪽 하트" src="../images/heart2.png" width="40px" height="40px">
			</div>
		</div>

		<table class="InfoBoxTable">
			<tr>
				<td rowspan="5"><img
					src="<%=themeSrc %>"
					width="300px" height="400px"></td>
				<th class="detailInfo">예약일</th>
				<td><%=datePicker %></td>
				<th>인원을 선택하세요</th>
			</tr>
			<tr>
				<th class="detailInfo">브랜드</th>
				<td><%=brandName %></td>
				<td rowspan="4">
				<select class="numList" id="numList" name="numList" onchange="changePrice(this.value)">
						<%
							for(int i=playerMin;i<=playerMax;i++){
								if(i==playerMin){
								%>
									<option selected="selected" value="<%=i %>"><%=i %></option>
								<%
								}else{
								%>
									<option value="<%=i %>"><%=i %></option>
								<%
								}
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th class="detailInfo">지점</th>
				<td><%=unitName %></td>
			</tr>
			<tr>
				<th class="detailInfo">시간</th>
				<td><%=timePicker %></td>
			</tr>
			<tr>
				<th class="detailInfo">테마</th>
				<td><%=themeName %></td>
			</tr>
		</table>

		<br>
		<table class="PayBoxTable">
			<tr>
				<th><b>결제금액</b></th>
				<td><input type="text" id="themeFirstPrice" name="themeFirstPrice" disabled="disabled" value="<%=firstPrice%>">원
				</td>
				<td><img alt="마이너스" src="../images/minus_logo.png" width="30px"
					height="30px"></td>
				<th><b>할인금액</b></th>
				<td><input type="text" id="totalCountPrice" name="totalCountPrice" disabled="disabled" value="0">원
				</td>
				<td><img alt="등호" src="../images/equal_logo.png" width="30px"
					height="30px"></td>
				<th><b>최종결제금액</b></th>
				<td>
					<span id="TotalPriceSpan"><b><%=firstPrice%></b></span>원
				</td>
			</tr>

			<tr>
				<th><b>쿠폰할인</b></th>
				<td><input type="text" id="couponText" name="couponText" disabled="disabled" value="-">
				</td>
				<td colspan="6">
				<input type="button" value="쿠폰적용" onclick="openPop(900,400)"></td>
			</tr>

			<tr>
				<th><b>마일리지</b></th>
				<td><input type="text" id="mileageInput" name="mileageInput"
					maxlength="8" value="0" onchange="changeMileage(this.value)">원</td>
				<td colspan="6">전체 마일리지: <span id="totalMileage"><%=firstMileage %></span>
				<div id="warningInput" style="color:red; font-size:7px;" ></div>
				</td>
			</tr>

		</table>
		<div align="center">
			<input type="button" id="goPage" value="확인"> 
			<input type="button" value="취소">
		</div>

	</form>
</div>


<br>
<br>

<!-- content end -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
