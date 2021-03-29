<%@page import="com.proj.genre.model.GenreVO"%>
<%@page import="com.proj.room.model.RoomTotalVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="com.proj.themeImg.model.ThemeImgVO"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>


<jsp:useBean id="themeService" class="com.proj.theme.model.ThemeService" scope="session"></jsp:useBean>
<jsp:useBean id="themeImgService" class="com.proj.themeImg.model.ThemeImgService" scope="session"></jsp:useBean>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>
<jsp:useBean id="unitService" class="com.proj.unit.model.UnitService" scope="session"></jsp:useBean>
<jsp:useBean id="genreService" class="com.proj.genre.model.GenreService" scope="session"></jsp:useBean>
<jsp:useBean id="roomService" class="com.proj.room.model.RoomService" scope="session"></jsp:useBean>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
      
   
      $('form[name=frmDetailToReserve]').submit(function(){
         if($('#datePicker').val().length<1){
            alert('날짜를 선택해 주세요');
            $('#datePicker').focus();
            event.preventDefault();
         }else if($('#timePicker').val().length<1){
            alert('시간을 선택해 주세요');
            $('#timePicker').focus();
            event.preventDefault();
         }
      });
      
      
 });
   
function setTime(clickTime){
	event.preventDefault();
	document.getElementById("clickTime").value = clickTime;

}
//성능 테스트 위해 추가한 함수
	function goLogin(){
		if(confirm('로그인 하시겠습니까?')){
			location.href="<%=request.getContextPath()%>/esc/login/login.jsp";
		}
	}
      

</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<style>
p {
	margin: 20px 0px;
}
</style>

<!-- content -->
<%//http://localhost:9000s/esc/view/roomDetail.jsp?roomNo=1
//find.jsp에서 테마 이름 누를 경우 룸넘버를 가지고 이동(a태그 =>get)
//findDetail.jsp에서 테마 이름 누를 경우 브랜드+지점/테마=> 방 번호 가지고 이동(a태그=>get)

//1. 인코딩
request.setCharacterEncoding("utf-8");
		
String top_userid = (String) session.getAttribute("userid");
System.out.println("Encoding complete.");

//2. 파라미터 받기
/* String themeName=request.getParameter("themeName");
String brandNo=request.getParameter("brandNo");
String unitNo=request.getParameter("unitNo");
String themeNo=request.getParameter("themeNo"); */
String roomNo=request.getParameter("roomNo");
System.out.println("getParam complete.");

//유효성검사
if (roomNo==null || roomNo.isEmpty()){%>
	<script type="text/javascript">
	alert('잘못된 room 접근방식!');
	response.sendRedirect("<%=request.getContextPath()%>/esc/view/find2.jsp");
</script>
<%}


//3. DB 
RoomTotalVO rtVo=null;
rtVo=roomService.selectByRoomNo2(Integer.parseInt(roomNo));

String brandName=rtVo.getBrandName();
String unitName=rtVo.getUnitName();
int themeNo=rtVo.getThemeNo();
String themeName=rtVo.getThemeName();

 
ThemeVO themeVo=new ThemeVO();
//ThemeImgVO themeImgVo1=new ThemeImgVO();
ThemeImgVO themeImgVo2=new ThemeImgVO();
BrandVO brandVo=new BrandVO();
UnitVO unitVo=new UnitVO();
GenreVO genreVo=new GenreVO();

genreVo=genreService.selectByGenreCode(rtVo.getGenreCode());

themeVo=themeService.selectByThemeNo(themeNo);
String imgSrc=themeImgService.selectImgSrcByThemeNo(themeNo);
themeImgVo2=themeImgService.selectByThemeNo(themeNo);
brandVo=brandService.selectByNo(rtVo.getBrandNo());
unitVo=unitService.selectByUnitNo(rtVo.getUnitNo());

double latitude=Math.floor(unitVo.getLatitude()*1000000)/1000000;
double longitude=Math.floor(unitVo.getLongitude()*1000000)/1000000;
System.out.println("orgin: "+latitude+","+longitude);

if (latitude==0){
	latitude=37.498915;
}
if(longitude==0){
	longitude=127.031856;
}
//37.498915356916065, 127.0318568825343

unitVo.setLatitude(latitude);
unitVo.setLongitude(longitude);
System.out.println("after:"+latitude+","+longitude);

int playTime=themeVo.getPlayTime();
int startTime1=10, startTime2=0, interval=15;
String st2="00";


//4. 화면처리

//4. 화면처리
%>
<div class="ftco-blocks-cover-1">
	<!-- data-stellar-background-ratio="0.5" style="background-image: url('images/hero_1.jpg')" -->
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('<%=request.getContextPath()%>/esc/images/hero_1.jpg')">
		<div class="container">
			<div class="row align-items-center "></div>
		</div>
	</div>
</div>

<form name="frmDetailToReserve" method="post"
	action="<%=request.getContextPath()%>/esc/view/reserveDetail.jsp">
	<input type="hidden" name="brandNameInput" value="<%=brandName%>">
	<input type="hidden" name="unitNameInput" value="<%=unitName%>">
	<input type="hidden" name="themeNameInput" value="<%=themeName%>">
	<input type="hidden" name="brandNoInput" value="<%=rtVo.getBrandNo()%>">
	<input type="hidden" name="unitNoInput" value="<%=rtVo.getUnitNo()%>"> 
	<input type="hidden" name="themeNoInput" value="<%=themeNo%>"> 
	<input type="hidden" name="clickTime" id="clickTime" value="">

	<div class="container">
		<div class="row">
			<div class="col-lg-4 mb-4 mb-lg-0">
				<div class="package text-center bg-white">
					<img class="img-fluid" src="<%=imgSrc%>" alt="<%=themeNo%>번 테마 이미지">
				</div>
			</div>

			<div class="col-lg-5 mb-5 mb-lg-0">
				<br> <a
					href="<%=request.getContextPath()%>/esc/view/unitDetail.jsp"><p>
						<%=brandVo.getBrandName()%>
						<%=unitVo.getUnitName()%>
					</p></a>
				<!-- (전체 a 태그, 클릭 시 unitDetail로 이동) -->
				<h4 class="text-black"><%=themeName%>
				</h4>
				<br> <span>&nbsp;&nbsp;&nbsp;<%=themeVo.getThemeContent()%></span>
			</div>

			<div class="col-lg-3 mb-3 mb-lg-0">
				<br>
				<p>
				<h6 class="text-info">날짜를 선택해주세요</h6>
				<div id="datepicker_div">
					<input type="text" id="datePicker" name="datePicker">
					</p>
					<script
						src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
         </script>
					<script
						src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
					<script type="text/javascript">
            $('#datePicker').datepicker({
               format : "yyyy-mm-dd",
               todayHighlight: true,
               startDate: '0d',
               endDate: '+7d',
               autoclose: true
            });
            
            /* $('$click-btn').on('click', function(){
               var date=$('#dateRangePicker').val();
               alert(date);
            }); */
         </script>
				</div>
				<!-- 날짜 -->
				<p>
				<h6 class="text-info">시간을 선택해주세요</h6>
				<div id="timepicker">
					<!-- <input type="text" id="timePicker"></p> -->
					<div id="buttonArr_div">
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

							if (startTime2 == 0) {
								st2 = "00";
							}
							System.out.println(i + "번째 startTime1=" + startTime1 + " : startTime2=" + startTime2);
						%>
						<button class="btn btn-teal btn-custom-1 mt-4" name="timePicker"
							id="timePicker" value="<%=startTime1%>:<%=st2%>"
							onclick="setTime(this.value)"><%=startTime1%>:<%=st2%></button>
						<%
							} //for
						%>

						<%
							if (top_userid == null || top_userid.isEmpty()) {
						%>
						<!-- 시간 버튼 -->
						<input type="button" class="btn btn-danger btn-custom-1 mt-4"
							style="width: 100%;" onclick="goLogin()" value="예약" />

						<%
							} else {
						%>
						<input type="submit" class="btn btn-danger btn-custom-1 mt-4"
							style="width: 100%;" value="예약" />
						<%
							}
						%>
					</div>
					<!-- 버튼 집합 -->
				</div>
				<!-- 시간 버튼 -->
			</div>


		</div>
	</div>

</form>

	<div class="container">
      <div class="row">
        <div class="col">
          <!-- <p>Tab</p> -->
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#roomDetail">상세보기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#roomReview">리뷰</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#roomFindPeople">일행 구하기</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="roomDetail">
              <!-- <iframe style="width:100%; height:600px;" src="" title=""> -->

                <p>브랜드 이름 : <%=brandVo.getBrandName() %></p>
                <p>지점 이름 : <%=unitVo.getUnitName() %></p>
                <img src="<%=unitVo.getUnitImg()%>" alt="unit_img">

                <p>테마 이름 : <%=themeVo.getThemeName() %></p>
                <p>장르 이름 : <%=genreVo.getGenreName() %></p>
                <p>난이도 : <%=rtVo.getDifficulty() %>.0 / 5.0</p>

                <p>지점 전화번호 : <%=unitVo.getUnitTel() %></p>
                <p>지점 주소 : <%=unitVo.getUnitAddress() %></p>
                <p>지점 사이트 : <a href="<%=unitVo.getUnitUrl()%>"><%=unitVo.getUnitUrl() %></a></p>
           		<!--<p>roomNo=>themeNo=>content select</p>-->
                
                <div id="map" style="width:600px; height:400px;">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	532a497ed7eeeeb56f58da3400bad7e4"></script>
					<script type="text/javascript">
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>), //지도의 중심좌표.
							level: 3 //지도의 레벨(확대, 축소 정도)
						};
						
						
						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
						
				
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>); 
				
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
				
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						
						//줌 막기			
						map.getZoomable(false);
						
					</script>
				
				</div>
              <!-- </iframe> -->
                
              </div>
              
              <div class="tab-pane fade" id="roomReview">
              <iframe style="width:100%; height:600px;" src="" title="">
                <!-- <p>리뷰게시판에서 roomNo로 검색, select</p>
                <p>리뷰게시판 불러오기 (iframe)</p> -->
              
              </iframe>
              </div>
              
              <div class="tab-pane fade" id="roomFindPeople">
              <iframe style="width:100%; height:600px;" src="" title="">
                <!-- <p>일행구하기 게시판에서 roomNo로 검색, select</p>
                <p>일행구하기 게시판 불러오기(iframe)</p> -->
              
              </iframe>
              </div>
              
              
            </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	
 
 
<!-- content end-->

<jsp:include page="../inc/bottom.jsp"></jsp:include>    
