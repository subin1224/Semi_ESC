<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="com.proj.theme.model.ThemeService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.proj.location1.model.Location1VO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.location1.model.Location1Service"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:include page="../../inc/top.jsp"></jsp:include>
<jsp:useBean id="themeService" class="com.proj.theme.model.ThemeService" scope="session"></jsp:useBean>
<jsp:useBean id="themeImgService" class="com.proj.themeImg.model.ThemeImgService" scope="session"></jsp:useBean>

<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>
<jsp:useBean id="loc1Service" class="com.proj.location1.model.Location1Service" scope="session"></jsp:useBean>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-find').addClass('active');			
	});

</script>

<%
	//findDatil.jsp에서 submit하면 post
	//1. 인코딩
	request.setCharacterEncoding("utf-8");
	System.out.println("encoding complete...");

	//2. get Param
	String themeName=request.getParameter("themeName");
	System.out.println("getParam1, get themeName : "+themeName);
	if (themeName==null || themeName.isEmpty()){
		themeName="";
		System.out.println("getParam2, if themeName=null : "+themeName);
	}
	
	String loc1Code=request.getParameter("chooseLoc1");
	System.out.println("get param, loc1Code="+loc1Code);
	
	String [] bNameList;
	bNameList=request.getParameterValues("chooseBrand");
	if (request.getParameter("chooseBrand")!=null){
		for (int i=0; i<bNameList.length; i++){
				String bName=bNameList[i];
				System.out.print(bName);
		}		
	}
	//String brandName=request.getParameter("chooseBrand");
	//System.out.println("get param, brandName="+brandName);

	
	String [] genreList;
	genreList=request.getParameterValues("chooseGenre");
	if (request.getParameter("chooseGenre")!=null){
		for (int i=0; i<genreList.length; i++){
				String genreName=genreList[i];
				System.out.print(genreName);
		}
	}
	//String genreName=request.getParameter("chooseGenre");
	//System.out.println("get param, genreName="+genreName);
	
	String [] difficultyList;
	difficultyList=request.getParameterValues("chooseDifficulty");
	if (request.getParameter("chooseDifficulty")!=null){
		for (int i=0; i<difficultyList.length; i++){
				String difficulty=difficultyList[i];
				System.out.print(difficulty);
		}
	}
	//String difficulty=request.getParameter("chooseDifficulty");
	//System.out.println("get param, difficulty="+difficulty);
	
	
	List<ThemeVO> themeList=null;
	
	try {
		themeList=themeService.selectByThemeName(themeName);
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	ThemeVO themeVo=new ThemeVO();
	//ThemeImgVO themeImgVo=new ThemeImgVO();
%>

<!-- content -->
	<div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">찾고 싶은 방탈출 테마가 있으신가요?</span>
              <h1 class="mb-3 font-weight-bold text-teal">About Theme</h1>
              <p><a href="<%=request.getContextPath() %>/esc/view/find1.jsp" class="text-white">Search Theme</a> <span class="mx-3">/</span> 
              <a href="<%=request.getContextPath()%>/esc/view/find/findDetail.jsp" class="text-white"> Search Detail</a></p>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
    <div class="site-section bg-info">
      <div class="container">
      
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h2 class="text-white">검색</h2>
            <span class="text-cursive h5 text-red d-block">검색 조건을 선택해주세요</span>
          </div>
        </div>
        
        
        <!-- 검색 조건 -->
       	<!-- 지역 -->
       	<form name="frmSearchDetail" method="post" action="<%=request.getContextPath()%>/esc/view/find/findDetail.jsp">
        <div class="row">
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-teal">지역</h3>
              <div class="category" id="location_category">
              <%
              	List<Location1VO> loc1List=null;	
             	loc1List=loc1Service.selectByAll();
             	Location1VO loc1Vo=null;
             	//Location1VO loc1Vo=loc1Service.selectByLocation1Code("seo");
              
              for (int i=0; i<loc1List.size(); i++){
            	  loc1Vo=loc1List.get(i);
              %>
				<input type="radio" name="chooseLoc1" id="loc1" value="<%=loc1Vo.getLocation1Code() %>"><%=loc1Vo.getLocation1Name() %><br>              	

			  <%}//for loc1 %>              	
              </div>
            </div>
          </div>
          
          
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-success">브랜드</h3>
              <div class="category" id="brand_category">
              <% 
              	List<BrandVO> brandList=null;
				brandList=brandService.selectByAll();
				BrandVO brandVo=null;
				
				for (int i=0; i<brandList.size(); i++){
					brandVo=brandList.get(i);
				
              %>
              	<input type="checkbox" name="chooseBrand" id="chooseBrand" value="<%=brandVo.getBrandNo()%>"><%=brandVo.getBrandName() %><br>
			  <% 
			  	}//for brand %>
              </div>
             </div>
          </div>
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-danger">장르</h3>
              <div class="chooseGenre">
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="공포">공포<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="활동성">활동성<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="미션">미션<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="어드벤처">어드벤처<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="역사">역사<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="스릴러">스릴러<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="로맨스">로맨스<br>
	              <input type="checkbox" name="chooseGenre" id="chooseGenre" value="SF">SF<br>

              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-danger">난이도</h3>
             <div class="chooseDifficulty">
             	<input type="checkbox" name="chooseDifficulty" id="diff5" value="5"><img src="<%=request.getContextPath()%>/esc/images/lock5_yellow.png" width="100px"><br>
             	<input type="checkbox" name="chooseDifficulty" id="diff4" value="4"><img src="<%=request.getContextPath()%>/esc/images/lock4_yellow.png" width="100px"><br>
             	<input type="checkbox" name="chooseDifficulty" id="diff3" value="3"><img src="<%=request.getContextPath()%>/esc/images/lock3_yellow.png" width="100px"><br>
             	<input type="checkbox" name="chooseDifficulty" id="diff2" value="2"><img src="<%=request.getContextPath()%>/esc/images/lock2_yellow.png" width="100px"><br>
             	<input type="checkbox" name="chooseDifficulty" id="diff1" value="1"><img src="<%=request.getContextPath()%>/esc/images/lock1_yellow.png" width="100px">
             	
             	
             </div>
            </div>
          </div>
          
          
        </div><br>
          <div class="block-counter-1">
          	<button type="submit" class="btn btn-warning btn-custom-1 mt-4">SEARCH</button>
          </div>
        </form>
          
	 	<div class="site-section">
	      <!-- <div class="container"> -->
 
          <div class="row align-items-stretch">
           
      <!-- themeList 붙이기 -->
      <!-- themeList 받아서 개수만큼 for문 돌리기 -->
       <% if (themeList.isEmpty()) {%>
    	  	<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
	    	   		<span class="text-cursive text-red" style="font-size: 1.5em;">검색 조건에 해당하는 테마가 존재하지 않습니다.</span>
	    	    </div>
    	    </div>
       <%}else {%>
       		<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
    	   			<span class="text-cursive text-red" style="font-size: 1.5em;">총 <%=themeList.size() %>건 검색되었습니다.</span><br><br>
    	    	</div>
    	    </div>
    	    <div class="row align-items-stretch">
	        <%for(int i=0; i<themeList.size(); i++){
	    	   themeVo=themeList.get(i);
	    	   //themeImgVo=themeImgList.get(i);
	    	   int themeNo=themeVo.getThemeNo();
	    	   int brandNo=themeVo.getBrandNo();
	    	   int unitNo;
	  
	    	   %>
	       		<div class="col-lg-3 col-md-6 mb-5">
	       			<div class="post-entry-1 h-100">
		       			<div class="card" style="border-line: transparent;">
		       			<% %>
			                <%-- <img src="<%=request.getContextPath()%>/esc/images/jianPick.png" alt="no_image" /> --%>
			                <img src="<%=themeImgService.selectImgSrcByThemeNo(themeNo) %>" style="height: 300px;" alt="<%=themeNo %>번 테마 이미지"/>
			                <div class="card-body">
			                  <span><%=brandService.selectBrandNameByNo(brandNo) %> + 지점이름</span>
			                  <h5 class="card-title"><%=themeVo.getThemeName() %></h5>
			                  <p class="card-text"><%=themeVo.getThemeContent() %></p>
			                </div>
		            	</div>
	       			</div>
	       		</div>

	       		<%
	       }//for
	   }//if%>
       </div>
       
           
        </div>
          <div class="block-counter-1">
          	<p><a href="#" class="btn btn-warning btn-custom-1 mt-4">MORE</a></p>
          </div>
          
      </div>
    </div>
   <!-- </div> -->
 </div>

<!-- content end-->


<jsp:include page="../../inc/bottom.jsp"></jsp:include>    