<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../inc/top.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-find').addClass('active');			
	});
</script>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <style>
      p { margin:20px 0px; }
    </style>

<!-- content -->
<%
	//http://localhost:9000s/esc/view/find/roomDetail.jsp?no=1
	//find.jsp에서 테마 이름 누를 경우 브랜드+지점/테마=> 번호를 가지고 이동(a태그 =>get)
	//findDetail.jsp에서 테마 이름 누를 경우 브랜드+지점/테마=> 방 번호 가지고 이동(a태그=>get)
	
	//1. 인코딩
	request.setCharacterEncoding("utf-8");
	System.out.println("Encoding complete.");
	
	//2. 파라미터 받기
	String brandNo=request.getParameter("brandNo");
	String unitNo=request.getParameter("unitNo");
	String themeNo=request.getParameter("themeNo");
	String roomNo=request.getParameter("roomNo");
	System.out.println("getParam complete.");
	
	//유효성검사
	if (brandNo==null || brandNo.isEmpty() || unitNo==null || unitNo.isEmpty()
		|| themeNo==null || themeNo.isEmpty() || roomNo==null || roomNo.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 room 접근방식!');
			history.go(-1);
		</script>
	<%
	
	
	}
	
	//3. DB 
	
	//4. 화면처리

%>
  <div class="ftco-blocks-cover-1">
       <!-- data-stellar-background-ratio="0.5" style="background-image: url('images/hero_1.jpg')" -->
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            
          </div>
        </div>
      </div>
    </div>

	<div class="container">
      <div class="row">
		<div class="col-lg-4 mb-4 mb-lg-0">
			<div class="package text-center bg-white">
		      <img class="img-fluid" src="<%=request.getContextPath()%>/esc/images/jianPick.png" alt="imgae_not_exsist">
			</div>
		</div>

		<div class="col-lg-5 mb-5 mb-lg-0">
			<br>
			<a href="<%=request.getContextPath()%>/esc/view/find/unitDetail.jsp"><p> 브랜드이름 +지역이름  </p></a>
			<!-- (전체 a 태그, 클릭 시 unitDetail로 이동) -->
			<h4 class="text-black">테마 이름 ThemeName </h4><br>
			<span>&nbsp;&nbsp;&nbsp;테마 소개: 테마 소개를 content에서 불러올 것. themeNo + unitNo 통해 theme 테이블에서 content를 불러온다</span>
		</div>
		
		<div class="col-lg-3 mb-3 mb-lg-0">
			<br>
			<p><h6 class="text-info">날짜를 선택해주세요</h6>
			<div id="datepicker">
				<input type="text" id="datePicker"></p>
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
			</script>
			<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
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
			<div>
				<p><h6 class="text-info">시간을 선택해주세요</h6>
				<div id="timepicker">
					<!-- <input type="text" id="timePicker"></p> -->
					<div id="buttonArr">
						<button class="btn btn-teal btn-custom-1 mt-4">10:20</button>
						<button class="btn btn-teal btn-custom-1 mt-4">11:30</button>
						<button class="btn btn-teal btn-custom-1 mt-4">12:40</button>
						<button class="btn btn-teal btn-custom-1 mt-4">13:50</button>
						<button class="btn btn-teal btn-custom-1 mt-4">15:00</button>
						<button class="btn btn-teal btn-custom-1 mt-4">16:10</button>
						<button class="btn btn-teal btn-custom-1 mt-4">17:20</button>
						<button class="btn btn-teal btn-custom-1 mt-4">18:30</button>
					</div>
				</div>
			</div>
			</div>
		</div>
		
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
              <iframe style="width:960px; height:600px;" src="findDetail.jsp" title=""></iframe>
           		<!--<p>roomNo=>themeNo=>content select</p>
                <p>-테마 장르, 제목, 난이도, 장르</p>
                <p>-지역, 브랜드, 유닛 이름, 위치(도로명), 전화번호, 사이트URL</p>
                <p>-지도 API (marker 활용)</p> -->
              </div>
              <div class="tab-pane fade" id="roomReview">
              <iframe style="width:960px; height:600px;" src="" title=""></iframe>
                <!-- <p>리뷰게시판에서 roomNo로 검색, select</p>
                <p>리뷰게시판 불러오기 (iframe)</p> -->
              </div>
              <div class="tab-pane fade" id="roomFindPeople">
              <iframe style="width:960px; height:600px;" src="" title=""></iframe>
                <!-- <p>일행구하기 게시판에서 roomNo로 검색, select</p>
                <p>일행구하기 게시판 불러오기(iframe)</p> -->
              </div>
            </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	
 
  </div>
<!-- content end-->

<jsp:include page="../../inc/bottom.jsp"></jsp:include>    