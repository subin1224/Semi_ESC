<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- content -->
   
    <div class="site-section bg-info">
      <div class="container">
        <br><br><br><br>
        <div class="row">
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="../images/flaticon/svg/002-target.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-teal">공지 사항</h3>
              	<ul class="ul-check list-unstyled danger" style="text-align: left">
  					<li><a href="#"> 예약확인시 주의사항 </a></li>
 					<li><a href="#">코로나19 확산에 따른 예약...</li>
  					<li><a href="#">정기 서버 점검 공지 </li>
  					<li><a href="#">신규 브랜드 런칭 공지 </li>
			  	</ul>
              <p><a href="#" onclick="openNotice()" class="btn btn-primary btn-custom-1 mt-4">more</a></p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="../images/flaticon/svg/001-jigsaw.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-success">자주하는 질문</h3>
             	<ul class="ul-check list-unstyled teal" style="text-align: left">
  					<li><a href="#">예약취소 시 환불은 어떻게...</a></li>
 					<li><a href="#">예약취소는 예약일로 부터....</li>
  					<li><a href="#">예약은 며칠 후까지 가능한지...</li>
  					<li><a href="#">일행 구하기 게시판에서 일행... </li>
			  	</ul>
              <p><a href="#" onclick="openFAQ()" class="btn btn-warning btn-custom-1 mt-4">more</a></p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="../images/flaticon/svg/003-mission.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-danger">Contact us</h3>
              <ul  style="list-style: none; padding-bottom: 10px;">
              	<li>Title : 여기 탈출</li>
              	<li>Tel : 02-1588-0000</li>
           		<li>Email: esc@esc_room.com</li>
           		<li>상담시간 : AM 09~12, PM 01~06</li>
           		<li>&nbsp</li>
              	<li>서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워)</li>
              	<li>&nbsp</li>
              	<li>&nbsp</li>
          	    
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<script type="text/javascript"> 
function openNotice(){  
    window.open("notice.jsp", "공지사항", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
} 

function openFAQ(){  
    window.open("faq.jsp", "자주하는 질문", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
} 
 
</script>  
  

    
<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>    
