<%@page import="com.proj.review.model.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top_ckedit.jsp"></jsp:include>
<%@page import="com.proj.review.model.ReviewService"%>
<%@page import="java.sql.SQLException"%>
<script type="text/javascript">
 function checkBlank(){
	 var rating= document.getElementById("rating");
	 var content= document.getElementById("reContent");
	 var title= document.getElementById("reTitle");
	 var rateText=rating.options[rating.selectedIndex].text;
	 
	 if(rateText == "평점"){
		 alert("평점을 선택하여 주세요.");
		 rating.focus();
		 return false;
	 }	
	 
	 if(content.value ==""){
		 alert("리뷰 내용을 입력하여 주세요.");
		 content.focus();
		 return false;
	 }
	 
	 if(title.value==""){
		 alert("제목을 입력하여 주세요.");
		 title.focus();
		 return false;
	 }
	 
	 return true;
 }
 
 </script>

<%
	//1
	//String reviewNo= request.getParameter("reviewNo");
	request.setCharacterEncoding("utf-8");
	
	String roomNo = request.getParameter("roomNo");
	String reviewNo = request.getParameter("reviewNo");
	
	//2
	ReviewService service =new ReviewService();
	
	String imgSrc="";
	try{
		imgSrc = service.imgByRoomNo(Integer.parseInt(roomNo));
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	
	if(imgSrc=="" || imgSrc==null){
		imgSrc="../images/jianPick.png";
	}	
	
	ReviewVO vo = null;
	
	try{
		vo= service.selectByReNo(Integer.parseInt(reviewNo));
		
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	String reContent = vo.getReContent();
	if(reContent == null || reContent.isEmpty()){
		reContent = "";
	}
	
	
%>

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
            <form id="frmRvWr" name="frmRvWr"  onsubmit="return checkBlank()" action="reEdit_ok.jsp" method="post">
              <input id="reviewNo" name="reviewNo" value="<%=vo.getReviewNo()%>" type="hidden">
              <div class="form-group row">
              	<div class="col-md-3 ">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select id="brand" class="form-control bg-light" name="brand" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled" >
	 					<option ><%=vo.getBrandName() %> </option>					
					</select>
                </div>
                <div class="col-md-3 ">
                  <!-- <input type="text" class="form-control" placeholder=""> -->
                  <select id="local" name="local" class="form-control bg-light" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled" >
	 					<option ><%=vo.getUnitName() %> </option>					
					</select>
                </div>
                
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select id="theme" name="theme" class="form-control bg-light" style="color: rgb(23,162,184); 
                  	border-radius: 10px;" disabled="disabled">
	 					<option ><%=vo.getThemeName() %> </option>				
					</select>
                </div>                 
                <div class="col-md-2">         
                  	<select id="rating" name="rating" class="form-control" style="color: rgb(23,162,184); border-radius: 10px;">
	 					<option> 평점 </option>
	 					<option value="5" <%if(vo.getRating() == 5){ %> selected="selected"<%}%>>5</option>
	 					<option value="4.5" <%if(vo.getRating() == 4.5){ %> selected="selected"<%}%>>4.5</option>
	 					<option value="4" <%if(vo.getRating() == 4){ %> selected="selected"<%}%>>4</option>
	 					<option	value="3.5" <%if(vo.getRating() == 3.5){ %> selected="selected"<%}%>>3.5</option>
	 					<option	value="3" <%if(vo.getRating() == 3){ %> selected="selected"<%}%>>3</option>
	 					<option	value="2.5" <%if(vo.getRating() == 2.5){ %> selected="selected"<%}%>>2.5</option>
	 					<option	value="2" <%if(vo.getRating() == 2){ %> selected="selected"<%}%>>2</option>
	 					<option	value="1.5" <%if(vo.getRating() == 1.5){ %> selected="selected"<%}%>>1.5</option>
	 					<option value="1.0" <%if(vo.getRating() == 1){ %> selected="selected"<%}%>>1</option>					
					</select>
                </div>
              </div>
              
              <div class="form-group row">
              	<div class="col-md-2" style="padding-top: 12px;">
                  <label style="font-weight: bold;" >T&nbspi&nbspt&nbspl&nbspe&nbsp:</label> 
                </div>
                <div class="col-md-10">
                  <input id="reTitle" name="reTitle" type="text"  style="border-radius: 10px;" 
                  	class="form-control" value="<%=vo.getReTitle()%>"> 
                </div>
              </div>      

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea id="reContent" name="reContent" style="border-radius: 10px; width:600px;" class="form-control" 
                  	cols="30" rows="12"><%=reContent %>                  	
                  </textarea>
                  <script>
                  	CKEDITOR.replace('reContent',{
        				height : 300,
        				width : 850

        			});
                  </script>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6 mr-auto" style="text-align: center">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send EDIT">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-3 ml-auto">
            <div class="p-3 p-md-5">
              <img src="<%=imgSrc %>">
            </div>
       
          </div>
        </div>
      </div>
    </div>
        
      </div>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


