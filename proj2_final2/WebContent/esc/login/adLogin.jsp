<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
<%
	//쿠키 읽어오기
	String ckValue="";
	Cookie[] ckArr=request.getCookies();
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			if(ckArr[i].getName().equals("ck_userid")){
				ckValue=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>	

</script>
<!-- content -->

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover1 overlay" data-stellar-background-ratio="0.5" >
        <div class="container">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Login</span>
              <h1 class="mb-3 font-weight-bold text-teal">Admin Login</h1>
              <p><a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a> <span class="mx-3">/</span> 
              <a href="<%=request.getContextPath()%>/esc/login/login.jsp" class="text-white">Member-Login</a>
              <span class="mx-3">/</span> <strong>Admin-Login</strong>
              </p>
            </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
          <h2>Login</h2>
          <span>관리자용 로그인 화면 입니다. </span>
          <p>홈페이지 관리자가 가입요청 확인 후 수락해야 이용이 가능합니다.</p> 
        </div>
      </div>
      
        <div class="row justify-content-center">
          <div class="col-lg-8 mb-5" >
            <form name="adJoinFrm" method="post" action="<%=request.getContextPath()%>/esc/login/adLoginOk.jsp" >
             
				<div class="form-group row">
              		<div class="col-md-12">
                		<span>아이디</span>
                		<input type="text" class="form-control" id="adid" name="adid">
              		</div>
				</div>
				
				<br>
 				
 				<div class="form-group row">							  
                	<div class="col-md-12">
						<span>비밀번호</span>
                  		<input type="password" class="form-control" id="adpwd" name="adpwd">
                	</div>
			  	</div>
				
				<br>
	
 				<div class="form-group row">
                	<div class="col-md-6 m-auto mt-5">
                  		<input type="submit" class="btn btn-block btn-warning text-black py-3 px-5 " value="Admin Login">	
                	</div>	        
              	</div> 	
            </form>
            
  				<div class="form-group row " style="float:right">
  					<div class="col-md-12 m-auto mt-5">
         	  			<!-- 아이디 기억하기 버튼 -->
						 <input type="checkbox" name="chkSave" class="custom-checkbox"
						 	<%if(ckValue!=null && !ckValue.isEmpty()){ %>
						 		checked="checked"
						 	<%} %>
						 	>
						<label for="chkSave">아이디 저장하기</label>   
					</div> 
  				</div>
  				
          </div>
			
	
        </div>
      </div>
    </div>

 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


