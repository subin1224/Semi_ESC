<%@page import="com.proj.brand.model.BrandService"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.location1.model.Location1VO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.location1.model.Location1Service"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<jsp:useBean id="l1Vo" class="com.proj.location1.model.Location1VO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="loc1Vo"/>
<jsp:useBean id="l1Service" class="com.proj.location1.model.Location1Service" scope="session"></jsp:useBean>
<jsp:useBean id="brVo" class="com.proj.brand.model.BrandVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="brandVo"/>
<jsp:useBean id="bmService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>


<!-- content -->
<!-- 오른쪽에 아이디 , 자물쇠이미지 따야함 -->
<%
	List<Location1VO> loc1list = null;
	try{
		loc1list=l1Service.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}

	String adid123 = (String)session.getAttribute("adid");
	
	try{
		brVo=bmService.selectByAdminId(adid123);
	}catch(SQLException e){
		e.printStackTrace();
	}	
	
/* 	List<Location2VO> loc2list = null;
	try{
		loc2list=loc2Service.selectByLocation1Code(location1Code);
	}catch(SQLException e){
		e.printStackTrace();
	} */
	
%>

<body>
	<div class="container m-auto">
		<div style="width:800px; margin-bottom:10px;" >
			<span style="float: left;">●지점 등록 | 해당 브랜드의 지점을 등록 할 수 있습니다.</span><br><br>
        </div>
			<form name="unitFrm" method="post" action="<%=request.getContextPath()%>/esc/mypage/unitRegOk.jsp">
     		  <div style="margin-left:180px;">
				<div class="form-group row">
					<input type="hidden" name="brandno" value=<%=brVo.getBrandNo()%>>
	            	<div class="col-md-5 mb-lg-5">
		           		<span>지역</span>
						<select id="location1Code" name="location1Code"  class="form-control">
							<%
							for(int i=0; i<loc1list.size(); i++){
								l1Vo = loc1list.get(i);
								String Location1Code2 = l1Vo.getLocation1Code();
							%>
							<option value="<%=Location1Code2 %>">
								<%=l1Vo.getLocation1Name() %>
							</option>
						<%	}//for%>
						</select> 
					</div>
					<div class="col-md-5 ml-1">
							<span>지점 명</span>
							<input type="text" class="form-control" id="unitname" name="unitname" placeholder="ex)강남점">       	
       		  		</div>
         		</div>
         		
	            <div class="form-group row">
	            	<div class="col-md-10 ">
	            		<span>상세주소</span>
	            		<input type="text" class="form-control" name="unitAddress" id="unitAddress">
	            	</div>
	            </div>    
	            
	            <div class="form-group row">
	            	<div class="col-md-10">
	            		<span>지점 전화번호</span>
	            		<input type="text" class="form-control" name="unitTel" id="unitTel">
	            	</div>
	            </div>
	          </div>
 				<div class="form-group row">
                	<div class="col-md-4 m-auto mt-5">
                  		<input type="submit" class="btn btn-block btn-info text-white py-3 px-5" value="지점 등록" >
                	</div>
              	</div>			
			</form>
		</div>	

</body>
</html>