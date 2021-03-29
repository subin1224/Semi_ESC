<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.reserve.model.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="reserveService" class="com.proj.reserve.model.ReserveService" scope="session"></jsp:useBean>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-board').addClass('active');		
	});
</script>
<%
	String reserveNo=request.getParameter("reserveno");
	
	ReserveVO vo = new ReserveVO();
	try{
		vo=reserveService.selectByReserveNo(Integer.parseInt(reserveNo));	
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

    <div class="ftco-blocks-cover-1" >
    <!-- 헤더 부분 높이 수정 (지안, 수빈) -->
      <div class="site-section-cover1 overlay" data-stellar-background-ratio="0.5" >
        <div class="container" >
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Review</span>
              <h1 class="mb-3 font-weight-bold text-teal">Review-Write</h1>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
    <div class="site-section bg-light" >
      <div class="container " style="text-align: -webkit-center">
        <div class="justify-content-end">
        	<div class="col-md-2" style="width:300px"></div>
        	<div class="col-md-10">
        
	        	<div class="col-7 text-center mb-5">
				    <div class="block-counter-1" style="padding-top: 10px; " >
						<label style="color:white; background: red	; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
						R &nbsp&nbsp E &nbsp&nbsp V &nbsp&nbsp I &nbsp&nbsp E &nbsp&nbsp W</label>
					</div>
	    		</div>
	    		
		        <div>
		          <div class="col-lg-8" >
		            <form name="reviewFrm" method="post" action="<%=request.getContextPath()%>/esc/view/reviewWrite_ok.jsp" >
		            	<input type="hidden" value="<%=vo.getRoomNo() %>" name="roomNo">
		            	<input type="hidden" value="<%=vo.getUserNo() %>" name="userNo">
		            	<input type="hidden" value="<%=reserveNo%>" name="reserveNo">
		            	
						<div class="form-group row">
							<div class="col-md-6 ">
								<input type="text" class="form-control" name="themName" value="<%=vo.getThemeName()%>" readonly/>
							</div>      
		                
			                <div class="form-group row col-md-6">         
				            	<select class="form-control" style="color: rgb(23,162,184); border-radius: 10px;" name="rating">
					 				<option value="5">5</option>
					 				<option value="4.5">4.5</option>
					 				<option value="4">4</option>
					 				<option value="3.5">3.5</option>
					 				<option value="3">3</option>
					 				<option value="2.5">2.5</option>
					 				<option value="2">2</option>
									<option value="1">1</option>
								</select>
			                </div>
			              </div>
				
						<div class="col-md-12 ">
							<input type="text" class="form-control" name="reTitle"/>
						</div>  	
	      
			              <div class="form-group row">
			                <div class="col-md-12">
			                  <textarea style="border-radius: 10px;" class="form-control" placeholder="Write your Review." cols="30" rows="12" name="reContent"></textarea>
			                </div>
			              </div>
	              
			              <div class="form-group row">
			                <div class="col-md-6 m-auto">
			                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Review">
			                </div>
			              </div>
	              
	          		  </form>
	         	 </div>
	        </div>
	      </div>
      </div>
    </div>

        
</div>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


