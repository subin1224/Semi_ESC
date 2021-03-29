<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript"> 
	function closeNotice(){  
  	  window.close();
	}

</script> 

<!-- 메뉴 부분 -->
<div class="ftco-blocks-cover-1">
	<!-- 헤더 부분 높이 수정 (지안, 수빈) -->
	<div class="site-section-cover1 overlay"
      data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/topbanner1.jpg')">
		<div class="container">
			<div class="row align-items-center ">

				<div class="col-md-5 mt-5 pt-5">
					<span class="text-cursive h5 text-red" style="color: red">FAQ</span>
					<h1 class="mb-3 font-weight-bold text-teal">FAQ</h1>
					<p>
  					 <a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a></span>
                     <span class="mx-3">/</span>
                     <a href="<%=request.getContextPath()%>/esc/view/notice.jsp" class="text-white">Notice</a><span class="mx-3">/</span><strong>FAQ</strong>

					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="site-section" style="background: #ffc107;">
	<div class="container">
		<div class="row">
			<div class="col-md-1">
				<div class="package text-center" id="faqInclude"></div>
			</div>
			<div class="col-md-10">
				<div class="package text-center bg-white"style="padding-top:70px;">
					<span class="img-wrap" >
						<img src="../images/flaticon/svg/001-jigsaw.svg" alt="Image" class="img-fluid">
					</span>
					<div class="block-counter-1" style="width: 100%;">
						<h1>FAQ</h1>
						<div class="package text-center">
							<div class="col-md-12 "  style="overflow: auto;">
								<%@ include  file="faqInclude.jsp"%>
							</div>
						</div>
					</div>
					
					<div class="col-md-12" style="padding: 10px">
						<div class="text-center">
							<div class="block-counter-1">
								<input type="button" onclick="location.href='<%=request.getContextPath() %>/esc/index.jsp'" value="확 인"
									class="btn btn-primary" style="align-self: center; margin-left:10px;">
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>

