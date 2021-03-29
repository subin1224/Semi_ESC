<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>memPage_Edit</title>
<jsp:useBean id="mService" class="com.proj.member.model.MemberService"
	scope="session"></jsp:useBean>  
<%
	String userid44 = (String)session.getAttribute("userid");
	
	MemberVO vo4=null;
	try{
		vo4=mService.selectMember(userid44);
	}catch(SQLException e){
		e.printStackTrace();
	}

%>   
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
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
	});
</script>
</head>
<body>
	<div class="container m-auto">
		<h2><span style="font-family:'sans-serif'">▶회원 수정</span></h2>

<!-- 아이디, 이름, 전화번호는 유저 아이디에 맞게 value값 셋팅 -->

        <div class="row justify-content-center">
          <div class="col-lg-8 mb-5" >
            <form name="memEditFrm" method="post" action="<%=request.getContextPath()%>/esc/ok/memEditOk.jsp" >
             
            <div class="form-group row">
                    <div class="col-md-12">
                      <label for ="memid">아이디  </label>
                      <input type="text" class="form-control" id="memid" name="memid" value="<%=vo4.getUserId() %>" readonly>
                    </div>
            </div>
            
            <div class="form-group row">
                    <div class="col-md-12">
                      <label for ="memname">이름  </label>
                      <input type="text" class="form-control" id="memname" name="memname" value="<%=vo4.getUserName()%>">
                    </div>
            </div>
            
             <div class="form-group row">                       
                   <div class="col-md-12">
                  <span>비밀번호</span>
                        <input type="password" class="form-control" id="mempwd" name="mempwd">
                        <span id="er4" class="error_sp" style="color:red; display:none;"> * 비밀번호를 입력해주셔야 합니다!  </span>
                   </div>
              </div>

            <div class="form-group row">
                   <div class="col-md-12">
                     <span>비밀번호 재확인</span>
                     <input type="password" class="form-control" id="mempwd2" name="mempwd">
 	                 <span id="er5" class="error_sp" style="color:red; display:none;"> * 비밀번호가 일치하지 않습니다!  </span>
                     
                   </div>
            </div>
            
               
               <div class="form-group row">
                  <div class="col-md-12">
                     <span>전화번호</span>
                     <input type="text" class="form-control" id="memTel" name="memTel" value="<%=vo4.getUserTel()%>">
                  </div>
               </div>
               
                  <br>
      
             <div class="form-group row">
                   <div class="col-md-6 m-auto mt-5">
                        <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="회원수정">
                   </div>
                 </div>
              
            </form>
          </div>
          

        </div>		

		
	</div>
</body>
</html>