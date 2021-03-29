<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- 브랜드 아이디 받아와야합니돠~~ -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$('#mainPage').click(function(){
		$('#bmPageif').css("display","block");
		$('#bmPageif2').css("display","none");
		$('#bmPageif3').css("display","none");
		$('#bmPageif4').css("display","none");
		$('#bmPageif6').css("display","none");
	});
	
	$('#themePage').click(function(){
		$('#bmPageif').css("display","none");
		$('#bmPageif2').css("display","block");
 		$('#bmPageif3').css("display","none");
		$('#bmPageif4').css("display","none");
		$('#bmPageif6').css("display","none");
	});
	
 	$('#rcPage').click(function(){
		$('#bmPageif').css("display","none");
		$('#bmPageif2').css("display","none");
		$('#bmPageif3').css("display","block");
		$('#bmPageif4').css("display","none");
		$('#bmPageif6').css("display","none");
	});

	$('#reviewPage').click(function(){
		$('#bmPageif').css("display","none");
		$('#bmPageif2').css("display","none");
		$('#bmPageif3').css("display","none");
		$('#bmPageif4').css("display","block");
		$('#bmPageif6').css("display","none");
	}); 
	
	$('#regPage').click(function(){
		$('#bmPageif').css("display","none");
		$('#bmPageif2').css("display","none");
		$('#bmPageif3').css("display","none");
		$('#bmPageif4').css("display","none");
		$('#bmPageif6').css("display","block");
	});
	
});


</script>
<!-- content -->

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" >
        <div class="container" style="margin-left: 150px;">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Brand Manager Page</span>
              <h1 class="mb-3 font-weight-bold text-teal">My Page</h1>
              <p><a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a> 
              <span class="mx-3">/</span> <strong>MyPage</strong>
              </p>
            </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section" id="contact-section" style="padding-top: 20px; padding-bottom:20px;">
      <div class="container"  style="margin-left: 150px;">
        <div class="row" >
        	<div class="col-md-2 mt-3">
        		<br><br>
        		<ul class="list-unstyled text-black" >
        			<li class="nav-item ">
        				<button id="mainPage" class="btn btn-info btn-custom-1 mt-4" style="width:180px">My Page</button>
        			</li>
        			<li class="nav-item">
        				<button id="themePage" class="btn btn-info btn-custom-1 mt-4 " style="width:180px">테마 관리</button>
        			</li>
        			<li class="nav-item">
        				<button id="rcPage" class="btn btn-info btn-custom-1 mt-4 " style="width:180px">예약 확인</button>
        			</li>
        			<li class="nav-item">
        				<button id="reviewPage" class="btn btn-info btn-custom-1 mt-4 " style="width:180px"> 리뷰 조회</button>
        			</li>
        			<li class="nav-item">
        				<button id="regPage" class="btn btn-info btn-custom-1 mt-4 " style="width:180px"> 지점 등록</button>
        			</li>
        			<li class="nav-item">
        				<a href="<%=request.getContextPath()%>/esc/mypage/bmEdit.jsp" class="btn btn-info btn-custom-1 mt-4" style="width:180px">브랜드명 수정</a>
        			</li>
        		</ul>
        	</div>
        
        	<div class="col-md-10 " id="bmPageif">
        		<%@ include file="bmPageif1.jsp" %>
        	</div>

       		<div class="col-md-10 " id="bmPageif2" style="display: none;">
      		  	<%@ include file="bmPageif2.jsp" %>
        	</div>
        	
       		<div class="col-md-10 " id="bmPageif3" style="display: none;">
        		<%@ include file="bmPageif3.jsp" %>
        	</div>

       		<div class="col-md-10 " id="bmPageif4" style="display: none;">
        		<%@ include file="bmPageif4.jsp" %>
        	</div> 

       		<div class="col-md-10 " id="bmPageif6" style="display: none;">
        		<%@ include file="bmPageif6.jsp" %>
        	</div> 

 
        </div>

      </div>
    </div>

 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


