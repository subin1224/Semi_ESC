<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-join').addClass('active');

	    $('#btnChkId').click(function(){
	  	  	open("joinChkId.jsp?memid="+$('#memid').val(),"chk",
  			  "width=450,height=200,left=400,top=200,location=yes,resizable");
	  	 });		
		
		$('#memid').focusout(function(){
			if(!validate_userid($(this).val())){
				$('#er3').css('display','block');
				event.preventDefault();
				return false;
			}else{ //아이디를 입력 했을 경우
				$('#er3').css('display','none');
				if($('#chkId').val()!='Y'){
					$('#er2').css('display','block');
					event.preventDefault();
					return false;
				}
				return true;
			}
		});
		
		$('input[name=mempwd]').focusout(function(){
			if($('#mempwd').val().length<1){
				$('#er4').css('display','block');
				event.preventDefault();
				return false;
			}else{
				$('#er4').css('display','none');
				
				if($('#mempwd').val() != $('#mempwd2').val()){
					$('#er5').css('display','block');
					event.preventDefault();
					return false;
				}else{
					$('#er5').css('display','none');
					event.preventDefault();
					return true;
				}				
			}
		});
		
		$('#memname').focusout(function(){
			if($('#memname').val().length<1){
				$('#er6').css('display','block');
				event.preventDefault();
				return false;
			}else{
				$('#er6').css('display','none');
				event.preventDefault();
				return true;
			}			
		});		
		
		$('#memTel').focusout(function(){
			if($('#memTel').val().length<1){
				$('#er7').css('display','block');
				$('#er8').css('display','none');
				event.preventDefault();
				return false;
			}else{
				$('#er7').css('display','none');
				
				if(!validate_phone($(this).val())){
					$('#er7').css('display','none');
					$('#er8').css('display','block');
					return false;
					event.preventDefault();
				}
				
				
				return true;
			}			
		});
		
		
		$('#joinFrm').click(function(){
			if($('#memid').val().length<1){
				alert('아이디를 입력하세요')
				$('#memid').focus();
				event.preventDefault();
			}else if($('#memname').val().length<1){
				alert('이름을 입력하세요');
				$('#memname').focus();
				event.preventDefault();
			}else if($('#mempwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#mempwd').focus();
				event.preventDefault();
			}else if($('#mempwd').val()!=$('#mempwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#mempwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#memTel').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#memTel').focus();
				event.preventDefault();				
			}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인을 하셔야합니다');
				$('#btnChkId').focus();
				event.preventDefault();
			}
		});
		
	});
	
	

	//아이디 정규식에 맞지않거나 - span 영역이 애초에 있고 처음엔 hidden 이였다가 포커스아웃되면 보이는 경우 
				//이미 존재하는 아이디입니다. 다른 아이디를 해주세요 => chkDup 가 1 이상이면 form 못하게 도 막아놔야함
				//정규식에 맞지않는 아이디 => form 못하게 막아야 함 비밀번호 정규식은 나중에 생각
				//전화번호 필수입력 = 전화번호 안하면 or 정규식이 되지않으면 막아놔야함
	
	 function validate_userid(id){
	     var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	     return pattern.test(id);
	     /*
	     	a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미 
	     	닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미, 입력값이 없다면 false
	     */
	  }
	   
	  function validate_phone(tel){
	     var pattern = new RegExp(/^[0-9]*$/g);
	     return pattern.test(tel);
	     /*
	        0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
	       	닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복, 입력값이 없어도 true
	     */
	   }				
	
</script>
<!-- content -->

    <div class="ftco-blocks-cover-1" >
    <!-- 헤더 부분 높이 수정 (지안, 수빈) -->
      <div class="site-section-cover1 overlay" data-stellar-background-ratio="0.5" >
        <div class="container" >
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Join</span>
              <h1 class="mb-3 font-weight-bold text-teal">Member Join</h1>
              <p><a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a>  
                 <span class="mx-3">/</span> <strong>Member-Join</strong> <span class="mx-3">/</span>
              <a href="<%=request.getContextPath()%>/esc/view/adJoin.jsp" class="text-white">Admin-Join</a>
           
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
          <h2><img alt="로고" src="../images/logo_howToEscape.png" width="100px" height="100px"> </h2>
    
          <p> 탈출어때에 오신걸 환영합니다. </p>
        </div>
      </div>
      
      
        <div class="row justify-content-center">
          <div class="col-lg-8 mb-5" >
           <form name="memJoinFrm" method="post" action="<%=request.getContextPath()%>/esc/ok/memJoinOk.jsp" >
             
				<div class="form-group row">
              		<div class="col-md-12">
	              		<div class="col-md-9 row" style="display:inline-block;">
		                	<label for ="memid">아이디 </label>
		               		<input type="text" class="form-control" id="memid" name="memid" autofocus >
	                	</div>
	                	<div class="col-md-3 row" style="display:inline-block;">
	                		<button type="button" id="btnChkId" class="btn btn-primary text-white" style="width:200px;">중복 확인</button>
	                	</div>
                		<span id="er2" class="error_sp" style="color:red; display: none;"> * 아이디 중복 확인을 해주세요!</span>
                		<span id="er3" class="error_sp" style="color:red; display: none;"> * 아이디는 영어 / 0~9사이 숫자 / 특수기호 _ 만 사용 가능합니다!
						</span>
              		</div>
				</div>
				<!-- 아이디 밑에 저절로 span으로 중복확인 메시지 뜨게 만들 것! -->
				
				
 				<div class="form-group row">							  
                	<div class="col-md-12">
						<span>비밀번호</span>
                  		<input type="password" class="form-control" id="mempwd" name="mempwd" >
                  		<span id="er4" class="error_sp" style="color:red; display:none;"> * 비밀번호를 입력해주셔야 합니다!  </span>
                	</div>
			  	</div>

				<div class="form-group row">
	                <div class="col-md-12">
	                  <span>비밀번호 재확인</span>
	                  <input type="password" class="form-control" id="mempwd2" name="mempwd" >
	                  <span id="er5" class="error_sp" style="color:red; display:none;"> * 비밀번호가 일치하지 않습니다!  </span>
	                </div>
				</div>
				
				<div class="form-group row">
              		<div class="col-md-12">
                		<label for ="memname">이름 : </label>
                		<input type="text" class="form-control" id="memname" name="memname" >
                		<span id="er6" class="error_sp" style="color:red; display:none;"> * 이름을 입력해주셔야 합니다!  </span>
              		</div>
				</div>
	            
	            <div class="form-group row">
	            	<div class="col-md-12">
	            		<span>전화번호</span>
	            		<input type="text" class="form-control" id="memTel" name="memTel" placeholder="01012345678">
                		<span id="er7" class="error_sp" style="color:red; display:none;"> * 전화번호를 입력해주셔야 합니다!  </span>
                		<span id="er8" class="error_sp" style="color:red; display:none"> * 전화번호는 숫자만 입력 가능 합니다!</span>	            		
	            	</div>
	            </div>
	  			
	  			<input type ="hidden" name="chkId" id="chkId">            
	            
	            	<br>
	   
 				<div class="form-group row">
                	<div class="col-md-6 m-auto mt-5">
                  		<input type="submit" id="joinFrm" class="btn btn-block btn-primary text-white py-3 px-5" value="회원가입">
                	</div>
              	</div>
              
            </form>
          </div>
          

        </div>
      </div>
    </div>

 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


