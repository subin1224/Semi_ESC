<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-join').addClass('active');			
	})
</script>

<div class="container" align="center">
	<img alt="운전하는사람" src="<%=request.getContextPath()%>/esc/images/post_1.jpg">
	<form action="<%=request.getContextPath()%>/esc/view/reserveDetail.jsp">
		<br>
		<br>
		
		<div align="center">
			<input type="submit" value="예약확인" >
		</div>
	</form>
	
	<!-- 
	
	<!-- 
	<div class="row">
		<div class="col-md-1 mt-3 reserveBoxList">
				<span><b>지역</b>
					</span>
		</div>
		<div class="col-md-3 mt-3 reserveBoxList">
				<span><b>브랜드</b></span>
		</div>
		<div class="col-md-2 mt-3 reserveBoxList">
				<span><b>지점</b></span>
		</div>
		<div class="col-md-5  mt-3 reserveBoxList">
				<span><b>테마</b></span>
		</div>
	</div>
	
	/*
  	.reserveBoxList{
  		height:50px; 
  		background-color: rgb(23,162,184); 
  		text-align: center;
  		margin: 10px;
  	}
  
 	.reserveBoxList > span {
 		color:white; 
 		font-size: 26px;
 	}
 	
 	.reserveBoxList:first-of-type > span {
		padding-left:10px;	
	}
	
	.reserveBoxList:nth-of-type(2) > span{
		padding-right:10px;
	}
	
	.reserveBoxList:nth-of-type(3) >span {
		margin-left: 15px;
	}
 	
 	.reserveBoxList:last-of-type > span{
		padding-left:5px;
	}
  
 	*/
  	
	-->
	
	
	
	 -->

</div>