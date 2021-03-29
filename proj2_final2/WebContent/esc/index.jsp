<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="inc/top.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-home').addClass('active');			
	})
</script>

<!-- content -->
    <div class="ftco-blocks-cover-1">
       
      <div class="site-section-cover1 overlay" data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/puzzle4.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
            
         	</div>
            <div class="col-md-6 ml-auto align-self-end">
    	    </div>
          </div>
        </div>
      </div>
    </div> <!-- frco-blocks-cover-1 -->

	<!-- 섹션1 : 테마 슬라이더 -->
 <div id="mainHeader">
 	<div>
 		
 		<span class="text-cursive" style="font-family: 'DX하늘구름'">POPULAR THEME</span>
 		<hr>
 	</div>
 	
 </div>
  
  
  
 
 <!--  1227 지안 수정사항 시작  -->
<div  id="mainImg">

<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2500">
      	<a href="<%=request.getContextPath()%>/esc/view/roomDetail.jsp?roomNo=39">
      		<img src="https://yologuys.com/Escape_img/theme/134.jpg" class="w-40" alt="인기순위1"></a>
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      	<a href="<%=request.getContextPath()%>/esc/view/roomDetail.jsp?roomNo=66">
      		<img src="https://yologuys.com/Escape_img/theme/122.jpg" class="w-40" alt="인기순위2" >
      	</a>
    </div>
    <div class="carousel-item"  data-bs-interval="2500">
      	<a href="<%=request.getContextPath()%>/esc/view/roomDetail.jsp?roomNo=89">	
      		<img src="https://yologuys.com/Escape_img/theme/1083.jpg" class="w-40" alt="인기순위3">
      	</a>
    </div>
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-bs-slide="prev" >
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </a>
  <hr>
</div>

</div>

 <!--  1227 지안 수정사항 끝 -->

	<div class="site-section">
 		 <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="testimonial-3-wrap">
              

              <div class="owl-carousel nonloop-block-13">
                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="images/person_1.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>코로나19 관련 공지사항</h3>
                    <p class="position">탈출어때 통합관리자</p>
                    <p>코로나19 방역지침에 따라 탈출어때는 각 방탈출 카페 지점에 안전 및 방역 규칙을 철저히 지켜주실 것을 연락드렸으며, 
                    	이와 관련하여 불편함을 겪으신 분들은 탈출어때 측(02-123-5678)에 문의해주시기 바랍니다. </p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                  	<img src="images/person_3.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>탈출어때 리뷰 이벤트</h3>
                    <p class="position">탈출어때 통합관리자</p>
                    <p>탈출어때가 1주년을 맞이하여 리뷰 이벤트를 진행합니다. 탈출어때를 통해 방탈출카페 이용을 하시고 리뷰를 작성해주신 방탈출러 100분을 뽑아, 방탈출 50% 할인 쿠폰을 드립니다!
                    <br>(리뷰 작성 시 자동으로 이벤트에 참가되며, 1매 2인 이용 가능합니다 :D)</p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="images/person_2.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>1/1 공휴일 휴무 안내</h3>
                    <p class="position">탈출어때 통합관리자</p>
                    <p>1/1(신정) 탈출어때 고객센터 휴무일입니다. 방탈출과 관련한 사항은 각 지점에 별도의 문의 부탁드리며, 탈출어때 고객센터와의 연결이 어려울 수 있습니다.
                    	<br>02-123-5678 // 월-토 10:00 - 18:00, 주말 및 공휴일 휴무 </p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
        
 
	<!-- 섹션3 : 코드이미지 + 내용 텍스트 -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
            <img src="images/dec_code.png" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-5 ml-auto pl-md-5">
            <span class="text-cursive h5 text-red" style="font-family: '함초롬바탕'">이달의 쿠폰</span>
            <h3 class="text-black">12월 연말 감사 쿠폰</h3>
            <br><p><span>한 해의 마무리도 방탈출과 함께!</span>
            <span>이번 한 해 방탈출을 맘껏 즐기셨나요? 탈출어때와 함께 해주시는 여러분께 감사한 마음을 담아 연말 쿠폰 코드를 공개합니다!</span>
            <br><span>쿠폰 코드는 결제 시 쿠폰 코드 입력창에 입력하시면 적용됩니다.</span></p>
            <a href="<%=request.getContextPath() %>/esc/view/reserve.jsp" class="btn btn-block btn-primary text-white py-3 px-5">바로 예약하기</a>

          </div>
        </div>
      </div>
    </div>
    
    <!-- 섹션4: 일행구하기 / 리뷰 게시판 -->
    <div class="site-section bg-info">
      <div class="container">
        <div class="row">
          
          <div class="col-lg-6 mb-6 mb-lg-0">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="images/flaticon/svg/001-jigsaw.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-success" style="font-family: '함초롬바탕'">일행구하기</h3>
			  <table class="table-striped-even">
			  	<tbody>
			  		<tr>
			  			<th>번호/말머리</th>
			  			<th style="width: 80%;">제목</th>
			  		</tr>
			  		<tr>
			  			<td><span class="text-warning">모집중</span></td>
			  			<td>넥스트에디션 강남점 12/25 19:20 5명</td>			  			
			  		</tr>
			  		<tr>
			  			<td><span class="text-warning">모집중</span></td>
			  			<td>키이스케이프 홍대점 12/26 15:00 3명</td>			  			
			  		</tr>
			  		<tr>
			  			<td><span class="text-success">모집완료</span></td>
			  			<td>셜록홈즈 신촌점 12/21 16:45 3명</td>			  			
			  		</tr>
			  	</tbody>
			  </table>
              <p><a href="<%=request.getContextPath() %>/esc/view/fellowShip.jsp" class="btn btn-success btn-custom-1 mt-4">More</a></p>
            </div>
          </div>
          <div class="col-lg-6 mb-6 mb-lg-0">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="images/flaticon/svg/002-target.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-warning" style="font-family: '함초롬바탕'">리뷰</h3>
              <table class="table-striped-even">
			  	<tbody>
			  		<tr>
			  			<th>별점</th>
			  			<th>&nbsp;&nbsp;&nbsp;</th>
			  			<th style="width: 85%;">제목</th>
			  		</tr>
			  		<tr>
			  			<td><span class="text-warning">★★★★★</span></td>
			  			<td></td>
			  			<td>셜록 홈즈: 비밀의 방 </td>			  			
			  		</tr>
			  		<tr>
			  			<td><span class="text-warning">★★★☆☆</span></td>
			  			<td></td>
			  			<td>파라오의 분노212/26 </td>			  			
			  		</tr>
			  		<tr>
			  			<td><span class="text-warning">★★★★☆</span></td>
			  			<td></td>
			  			<td>타임어택: 테러범을 찾아라 </td>			  			
			  		</tr>
			  	</tbody>
			  </table>
              <p><a href="<%=request.getContextPath() %>/esc/view/review.jsp" class="btn btn-warning btn-custom-1 mt-4">More</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>


<!-- content end -->
    
<%@ include file="inc/bottom.jsp" %>

