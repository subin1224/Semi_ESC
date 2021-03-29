<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- 통합매니저 아이디 받아와야합니돠~~ -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$('#mainPage').click(function(){
		$('#hmPageif1').css("display","block");
		$('#hmPageif2').css("display","none");
		$('#hmPageif3').css("display","none");
		$('#hmPageif4').css("display","none");
	});
	
	$('#brandPage').click(function(){
		$('#hmPageif1').css("display","none");
		$('#hmPageif2').css("display","block");
		$('#hmPageif3').css("display","none");
		$('#hmPageif4').css("display","none");
	});
	
	$('#noticePage').click(function(){
		$('#hmPageif1').css("display","none");
		$('#hmPageif2').css("display","none");
		$('#hmPageif3').css("display","block");
		$('#hmPageif4').css("display","none");
	});

	$('#couponPage').click(function(){
		$('#hmPageif1').css("display","none");
		$('#hmPageif2').css("display","none");
		$('#hmPageif3').css("display","none");
		$('#hmPageif4').css("display","block");
	});
	
});


</script>
<!-- content -->

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" 
		data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/puzzle3.jpg')">
        <div class="container" style="margin-left: 150px;">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Main Manager</span>
              <h1 class="mb-3 font-weight-bold text-teal">My Page</h1>
              <p><a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a> 
              <span class="mx-3">/</span> <strong>MyPage</strong>
              </p>
            </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section" id="contact-section" style=" padding-top: 20px; padding-bottom:20px;">
      <div class="container "  style=" margin-left: 150px; ">
        <div class="row" >
        	<div class="col-md-2 mt-5">
        		<br><br>
        		<ul class="list-unstyled text-black" >
        			<li class="nav-item ">
        			
        				<button id="mainPage" class="btn btn-danger btn-custom-1 mt-4" style="width:180px">My Page</button>
        			</li>
        			<li class="nav-item">
        				<button id="brandPage" class="btn btn-danger btn-custom-1 mt-4 " style="width:180px">브랜드 조회</button>
        			</li>
        			<li class="nav-item">
        				<button id="noticePage" class="btn btn-danger btn-custom-1 mt-4 " style="width:180px">공지사항 관리 </button>
        			</li>
        			<li class="nav-item">
        				<button id="couponPage" class="btn btn-danger btn-custom-1 mt-4 " style="width:180px"> 쿠폰 등록하기</button>
        				<br><br><br><br><br><br><br><br>
        			</li>
        		</ul>
        	</div>
        	<div class="col-md-10 " id="hmPageif1">
        		<%@ include file="hmPageif1.jsp" %>
        	</div>
  	
       		<div class="col-md-10 " id="hmPageif2" style="display: none;">
       		      <%@ include file="hmPageif2.jsp" %> 
        	</div>

       		<div class="col-md-10 " id="hmPageif3" style="display: none;">
        		<%@ include file="hmPageif3.jsp" %>
        	</div>

       		<div class="col-md-10 " id="hmPageif4" style="display: none;">
        		<%@ include file="hmPageif4.jsp" %>
        	</div>
   
        	
        </div>
      </div>
    </div>

 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


