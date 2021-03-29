<%@page import="com.proj.common.Utility"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.proj.room.model.RoomVO"%>
<%@page import="com.proj.room.model.RoomService"%>
<%@page import="com.proj.room.model.RoomTotalVO"%>
<%@page import="com.proj.unit.model.UnitService"%>
<%@page import="com.proj.brand.model.BrandService"%>
<%@page import="com.proj.themeImg.model.ThemeImgService"%>
<%@page import="com.proj.genre.model.GenreVO"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="com.proj.theme.model.ThemeService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.proj.location1.model.Location1VO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.location1.model.Location1Service"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="roomService" class="com.proj.room.model.RoomService" scope="session"></jsp:useBean>
<jsp:useBean id="genreService" class="com.proj.genre.model.GenreService" scope="session"></jsp:useBean>


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
	
	//1) 지역으로 받기
	String condition2="location1";
	String keyword2=request.getParameter("chooseLoc1");
	
		
	//2) 브랜드 이름으로 받기
	String condition="brand";
	List<String> keyword=new ArrayList<String>();
	//bNameList=request.getParameterValues("chooseBrand");
	
	
	String [] bNameList;
	String bName;
	bNameList=request.getParameterValues("chooseBrand");
	if(bNameList!=null){
		Arrays.asList(bNameList);
	}
	
		if (keyword.isEmpty() || keyword==null){
			keyword.add(0, "");
		}
	/*if (request.getParameter("chooseBrand")!=null){
		for (int i=0; i<bNameList.length; i++){
				bName=bNameList[i];
				//System.out.print(bName);
		}		
	}*/
	
	//String [] bNameList=request.getParameterValues("chooseBrand");

	//Arrays.asList(bNameList);
	//Arrays.asList(request.getParameterValues("chooseBrand"));
	
	
	
	/*String condition=request.getParameter("condition");
	String keyword=request.getParameter("keyword"); */
	
	/* System.out.println("getParam1, get themeName : "+themeName);
	if (themeName==null || themeName.isEmpty()){
		themeName="";
		System.out.println("getParam2, if themeName=null : "+themeName);
	} */
	
	
	List<RoomTotalVO> rtList=null;
	try {
		//if (request.getParameterValues("chooseBrand")==null){
			rtList=roomService.selectByCondition(condition2, keyword2);
		//}else {
		//rtList=roomService.selectByCondition(condition, keyword);
		//rtList=roomService.selectByCondition(condition, keyword); //keyword String 배열

			//rtList=roomService.selectByCondition(condition, keyword);		//keyword list<>
		//}
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	
	//String loc1Code=request.getParameter("chooseLoc1");
	//System.out.println("get param, loc1Code="+loc1Code);
	

	//String brandName=request.getParameter("chooseBrand");
	//System.out.println("get param, brandName="+brandName);

	
	String[] genList ;
	genList=request.getParameterValues("chooseGenre");
	if (request.getParameter("chooseGenre")!=null){
		for(int i=0; i<genList.length; i++){
			String genreName=genList[i];
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
	
	Location1Service loc1Service=new Location1Service();
	ThemeService themeService=new ThemeService();
	ThemeImgService themeImgService=new ThemeImgService();
	BrandService brandService=new BrandService();
	UnitService unitService=new UnitService();
	
	List<ThemeVO> themeList=null;
	
	/* try {
		themeList=themeService.selectByThemeName(themeName);
	} catch(SQLException e){
		e.printStackTrace();
	} */

	//List<ThemeVO> thGenreList=null;
	//ThemeVO thGenreVo=new ThemeVO();
	
	RoomTotalVO rtVo=new RoomTotalVO();
	ThemeVO themeVo=new ThemeVO();
	//ThemeImgVO themeImgVo=new ThemeImgVO();
	
	//GenreService GenreVO 장르
	List<GenreVO> gList = null;
	try{
		gList=genreService.selectByAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>

<!-- content -->
	<div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">찾고 싶은 방탈출 테마가 있으신가요?</span>
              <h1 class="mb-3 font-weight-bold text-teal">About Theme</h1>
              <p><a href="<%=request.getContextPath() %>/esc/view/find2.jsp" class="text-white">Search Theme</a> <span class="mx-3">/</span> 
              <a href="<%=request.getContextPath()%>/esc/view/findDetail.jsp" class="text-white"> Search Detail</a></p>
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
       	<form name="frmSearchDetail" method="post" action="<%=request.getContextPath()%>/esc/view/findDetail.jsp">
        <div class="row">
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-teal">지역</h3>
              <div class="category" id="location_category">
              <%
              	List<Location1VO> loc1List=null;	
             	loc1List=loc1Service.selectAll();
             	Location1VO loc1Vo=null;
              
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
				
				//rtList=roomService.selectByAll2();
				
				for (int i=0; i<brandList.size(); i++){
					brandVo=brandList.get(i);
					//rtVo=rtList.get(i);
				
              %>
              		<input type="checkbox" name="chooseBrand" id="chooseBrand" 
              		
              		value="<%=brandVo.getBrandNo()%>"><%=brandVo.getBrandName() %><br>
			  <% 
			  	}//for brand %>
              </div>
             </div>
          </div>
          
          
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-danger">장르</h3>
              <div class="category" id="genre_category">
        		  <!-- 장르붙이기 -->
        		  <%for(int i=0; i<gList.size(); i++){ 
        		  		GenreVO gVo = gList.get(i);
        		  %>
 					<input type="checkbox" name="chooseGenre" value="<%=gVo.getGenreCode()%>"><%=gVo.getGenreName() %><br>
 				<%} %>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3">
            <div class="package text-center bg-white">
              <h3 class="text-danger">난이도</h3>
             <div class="category" id="difficulty_category">
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
	     <div class="container">
 
          <!-- <div class="row align-items-stretch"> -->
           
      <!-- themeList 붙이기 -->
       <% if (rtList.isEmpty()) {%>
    	  	<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
	    	   		<span class="text-cursive text-red" style="font-size: 1.5em;">검색 조건에 해당하는 테마가 존재하지 않습니다.</span>
	    	    </div>
    	    </div>
       <%}else {%>
       		<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
    	   			<span class="text-cursive text-red" style="font-size: 1.5em;">총 <%=rtList.size() %>건 검색되었습니다.</span><br><br><br>
    	    	</div>
    	    </div>
    	    <div class="row align-items-stretch">
	        <%for(int i=0; i<rtList.size(); i++){
				rtVo=rtList.get(i);
				
				System.out.println("디버깅1111!!"+themeVo.getThemeNo());
				System.out.println("디버깅2222!!"+rtVo.getThemeNo());
				
				int themeNo=rtVo.getThemeNo();
				String themeName=themeService.selectThemeNameByThemeNo(rtVo.getThemeNo());
				int brandNo=rtVo.getBrandNo();
				int unitNo=rtVo.getUnitNo();
				
				String img=themeImgService.selectImgSrcByThemeNo(rtVo.getThemeNo());	//imgsrc
				String fileImg=rtVo.getOriginalFileName();
				
				System.out.println("fileImg Check!!"+fileImg);
				
				String thImg="../images/jianPick.png";
				if(fileImg!=null && !fileImg.isEmpty()) {
					thImg="../img_upload/"+fileImg;
				}else if(!img.isEmpty() && img!=null){
					thImg=img;
				}
				//thImg
	    	   %>
	       		<div class="col-lg-3 col-md-6 mb-5">
	       			<div class="post-entry-1 h-100">
		       			<div class="card" style="border-line: transparent;">
		       			<% %>
			                <img src="<%=thImg %>" style="height: 300px;" alt="<%=themeNo %>번 테마 이미지"/>
			                <div class="card-body">
			                  <span><%=rtVo.getBrandName() %> | <%=rtVo.getUnitName() %></span>
			                  <h5 class="card-title"><a href="<%=request.getContextPath()%>/esc/view/roomDetail.jsp?roomNo=<%=rtVo.getRoomNo()%>"><%=rtVo.getThemeName() %></a></h5>
			                  <p class="card-text"><%=Utility.cutString(rtVo.getThemeContent(), 30)%></p>
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
  </div>

<!-- content end-->


<jsp:include page="../inc/bottom.jsp"></jsp:include>    