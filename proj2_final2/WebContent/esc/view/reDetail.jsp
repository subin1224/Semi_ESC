<%@page import="com.proj.review.model.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%@page import="com.proj.review.model.ReviewService"%>
<%@page import="java.sql.SQLException"%>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
<%
	//1
	String reviewNo = request.getParameter("reviewNo");
	String roomNo = request.getParameter("roomNo");
	String userId = request.getParameter("userId");
	String login_userid = (String)session.getAttribute("userid");
	String login_adid = (String)session.getAttribute("adid");

	if(login_userid==null || login_userid.isEmpty()){
		login_userid=login_adid;
	}
	
	if(login_adid==null || login_adid.isEmpty()){
		login_adid=login_userid;
	}
	
	//2
	
	ReviewService service= new ReviewService();
	ReviewVO vo= new ReviewVO();
	
	String imgSrc="";
	try{
		imgSrc = service.imgByRoomNo(Integer.parseInt(roomNo));
		vo= service.selectByReNo(Integer.parseInt(reviewNo));	
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	if(imgSrc=="" || imgSrc==null){
		imgSrc="../images/jianPick.png";
	}
	
	String reContent = vo.getReContent();
	if(reContent == null || reContent.isEmpty()){
		reContent = "";
	}
	//유효성검사 완료
	if(login_userid.equals(userId) || login_adid.equals(userId)){ %>	
		$(function(){
			$('#qkq123').css("visibility","visible");	
			$('#qkq12').css("visibility","visible");	
			
		});
<%	}
	
%>
</script>

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
        <br><br><br>
    <div class="block-counter-1" style="padding-top: 10px; " >
		<label style="color:white; background: red	; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
		R &nbsp&nbsp E &nbsp&nbsp V &nbsp&nbsp I &nbsp&nbsp E &nbsp&nbsp W</label>
	</div>
      </div>
        <div class="row">
          <div class="col-lg-9 mb-5" >
            <form id="frmRvWr" name="frmRvWr"  action="reEdit.jsp" method="post">        		
              <div class="form-group row mb-1">
              	<div class="col-md-2" style="padding-top: 12px;">
                  <label style="font-weight: bold;" >Review&nbsp No:</label> 
                </div>
              	<div class="col-md-2 mt-2">
                  <label style="text-align: center"><%=vo.getReviewNo() %></label>
                </div>
                
              	<div class="col-md-4 mt-2">            
              		<label style="text-align: center; font-weight: bold;">Brand&nbsp:</label>
	 				 <label style="text-align: center">&nbsp<%=vo.getBrandName() %></label>				
                </div>
                <div class="col-md-4 mt-2">
	 				<label style="text-align: center; font-weight: bold;">Unit&nbsp:</label>
	 				<label style="text-align: center;"> &nbsp<%=vo.getUnitName() %> </label>		
                </div>
              </div>
              
              <div class="form-group row">
              	<hr>
              	<div class="col-md-2" style="padding-top: 12px;">
                  <label style="font-weight: bold;" >Written:</label> 
                </div>
                <div class="col-md-2 mt-2">
					<label style="text-align: center;"> &nbsp<%=vo.getUserId()%> </label>
                </div>            
                <div class="col-md-5 mt-2">             
                	<label style="text-align: center; font-weight: bold;">ThemeName&nbsp:&nbsp</label>
                	<label style="text-align: center;"><%=vo.getThemeName() %></label> 			
                </div> 
                
                <div class="col-md-3 mt-2" style="width:100px; text-align: left;">         
                	<label style="text-align: center; font-weight: bold;">Rating&nbsp:&nbsp</label>
                	<label style="text-align: center;"><%=vo.getRating() %></label>                 	
                </div>
              </div>
              
              <div class="form-group row">
              	
              	<div class="col-md-2" style="padding-top: 9px;">
                  <label style="font-weight: bold;" >Title:</label> 
                </div>
                <div class="col-md-10" style="text-align: center" >
                  <label style="text-align: center;"><%=vo.getReTitle()%></label> 
                </div>
              </div>      

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea id="reContent" name="reContent" style="border-radius: 10px;" class="form-control bg-white" 
                  	cols="30" rows="12" disabled="disabled"><%=reContent %>
                  </textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-4 mr-auto" id="qkq12" style=" visibility: hidden;">
                  <input type="button" class="btn btn-block btn-primary text-white py-3 px-5" 
                  	value="DELETE" >
                </div>
                <div class="col-md-4 mr-auto">
                  <input type="button" class="btn btn-block btn-primary text-white py-3 px-5" 
                  	value="LIST" onclick="location.href='review.jsp';">
                </div>
               <div class="col-md-4 mr-auto" id="qkq123" style=" visibility: hidden;">
                  <input type="button" class="btn btn-block btn-primary text-white py-3 px-5"
                  	value="EDIT" onclick="location.href='reEdit.jsp?roomNo=<%=vo.getRoomNo()%>&reviewNo=<%=vo.getReviewNo()%>';">                 
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 ml-auto">
            <div class="p-3 p-md-5">
              <img src="<%=imgSrc %>" style="width: 240%;">
            </div>
          </div>
        </div>
      </div>
    </div>
        
      </div>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


