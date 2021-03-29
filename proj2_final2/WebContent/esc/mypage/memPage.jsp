<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- 유저 아이디 받아와야합니돠~~ -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$('#mainPage').click(function(){
		$('#memPageif').css("display","block");
		$('#memPageif2').css("display","none");
		/* $('#memPageif3').css("display","none"); */
		$('#memPageif4').css("display","none");
	});
	
	$('#revPage').click(function(){
		$('#memPageif').css("display","none");
		$('#memPageif2').css("display","block");
		/* $('#memPageif3').css("display","none"); */
		$('#memPageif4').css("display","none");
	});
	
	$('#boardPage').click(function(){
		$('#memPageif').css("display","none");
		$('#memPageif2').css("display","none");
	/* 	$('#memPageif3').css("display","block"); */
		$('#memPageif4').css("display","none");
	});

	$('#editPage').click(function(){
		$('#memPageif').css("display","none");
		$('#memPageif2').css("display","none");
	/* 	$('#memPageif3').css("display","none"); */
		$('#memPageif4').css("display","block");
	});
	
});


</script>
<!-- content -->

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" >
        <div class="container" style="margin-left: 150px;">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">MyPage</span>
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
        				<button id="mainPage" class="btn btn-warning btn-custom-1 mt-4" style="width:180px">My Page</button>
        			</li>
        			<li class="nav-item">
        				<button id="revPage" class="btn btn-warning btn-custom-1 mt-4 " style="width:180px">예약 조회</button>
        			</li>
    <!--     			<li class="nav-item">
        				<button id="boardPage" class="btn btn-warning btn-custom-1 mt-4 " style="width:180px"> 내가 쓴 글 조회</button>
        			</li> -->
        			<li class="nav-item">
        				<button id="editPage" class="btn btn-warning btn-custom-1 mt-4 " style="width:180px"> 회원 수정</button>
        				<br><br><br><br><br><br><br><br>
        			</li>
        		</ul>
        	</div>
        
        	<div class="col-md-10" id="memPageif">
        		<%@ include file="memPageif1.jsp" %>
        	</div>

       		<div class="col-md-10 " id="memPageif2" style="display: none;">
        		<%@ include file="memPageif2.jsp" %>
        	</div>
  <%--       	
       		<div class="col-md-10 " id="memPageif3" style="display: none;">
        		<%@ include file="memPageif3.jsp" %>
        	</div> --%>

       		<div class="col-md-10 " id="memPageif4" style="display: none;">
        		<%@ include file="memPageif4.jsp" %>
        	</div>
        	
        	
   
        	
        </div>
        
      </div>
    </div>

 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


