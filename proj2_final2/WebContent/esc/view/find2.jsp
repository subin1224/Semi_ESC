<%@page import="com.proj.common.Utility"%>
<%@page import="com.proj.room.model.RoomTotalVO"%>
<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="com.proj.unit.model.UnitService"%>
<%@page import="com.proj.room.model.RoomVO"%>
<%@page import="com.proj.brand.model.BrandService"%>
<%@page import="com.proj.themeImg.model.ThemeImgService"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="com.proj.themeImg.model.ThemeImgVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.proj.theme.model.ThemeService"%>
<%@page import="com.proj.theme.model.ThemeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="java.util.List"%>

<jsp:include page="../inc/top.jsp"></jsp:include>

<jsp:useBean id="roomService" class="com.proj.room.model.RoomService" scope="session"></jsp:useBean>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#menu-find').addClass('active');
		
	$('#textClear').click(function(){
		//close img 누르면 입력한 키워드 사라지고 디폴트 메시지 출력
		$('#theme_searchIn').val('');	
	});
	
});
</script>

<!-- content -->

<%
	//1) index.jsp 에서 Find => a태그 (get)
	//2) find.jsp 에서 submit => themeName 받아서 이동(post)

	//1. 인코딩
	request.setCharacterEncoding("utf-8");	
	System.out.println("encoding complete...");
	
	//2. getParameter
	String themeName=request.getParameter("themeName");
	System.out.println("getParam1, get themeName : "+themeName);
	if (themeName==null || themeName.isEmpty()){
		themeName="";
		System.out.println("getParam2, if themeName=null : "+themeName);
	}
	
	//3. DB작업
	ThemeService themeService=new ThemeService();
	ThemeImgService themeImgService=new ThemeImgService();
	/*BrandService brandService=new BrandService();
	UnitService unitService=new UnitService(); */
	
	List<RoomTotalVO> rtList=null;
	try {
		rtList=roomService.selectByThemeName(themeName);
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ThemeVO> themeList=null;
	try {
		themeList=themeService.selectByThemeName(themeName);
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ThemeImgVO> themeImgList=null;
	try{
		themeImgList=themeImgService.selectByAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	/*List<BrandVO> brandList=null;
	try{
		brandList=brandService.selectByAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<UnitVO> unitList=null;
	try{
		unitList=unitService.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}*/
	 
	ThemeVO themeVo=new ThemeVO();
	ThemeImgVO themeImgVo=null;
	/* RoomVO roomVo=new RoomVO();
	BrandVO brandVo=new BrandVO();
	UnitVO unitVo=new UnitVO(); */
	
	RoomTotalVO rtVo=new RoomTotalVO();
	
%>


<!-- header 쪽 사진 부분 -->
    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive text-red" style="font-size: 1.3em;">찾고 싶은 방탈출 테마가 있으신가요?</span>
              <h1 class="mb-3 font-weight-bold text-teal">About Theme</h1>
              <p><a href="<%=request.getContextPath() %>/esc/view/find2.jsp" class="text-white">Search Theme</a> <span class="mx-3">/</span> 
              <a href="<%=request.getContextPath()%>/esc/view/findDetail.jsp" class="text-white">Search Detail</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 본문  민트색 배경 : site-section bg-teal-->
    <div class="site-section bg-teal">
      <div class="container">
    
    <!-- 테마, 검색창 부분 -->
        <div class="row justify-content-center text-center mb-5 section-2-title">
          <div class="col-md-6">
            <h3 class="text-white text-center">테마</h3>
            <span class="text-cursive text-red h5">테마의 이름을 검색해보세요</span>
            <br>
	        <div class="block-counter-1">
		        <form name="frmSearchTheme" method="post" action="<%=request.getContextPath() %>/esc/view/find2.jsp">
			        <div class="container_search_in_icon">
			        	<div class="container_search" style="background: #ffffff; display: inline-block;  width: 80%">
					         <input type="text" id="theme_searchIn" style="width: 80%; border: none; height: 20px;" placeholder="테마 이름을 입력하세요" name="themeName" value="<%=themeName %>">
					         <button id="textClear" style="border: none; background: none"><img src="<%=request.getContextPath() %>/esc/images/close.png" style="width: 25px"></button>
				        </div>
				        <div style="display: inline; padding-left: 5px; padding-top: 5px;">
							<input type="submit" value="" class="sendSearch">
			        	</div>
			        </div>
		        </form>
	        </div>
          </div>
        </div> <!-- 검색창 부분 가장 바깥 div -->
        

          
       
       <!-- themeList 받아서 개수만큼 for문 돌리기 -->
       <% if (rtList.isEmpty()) {%>
    	  	<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
	    	   		<span class="text-cursive text-red" style="font-size: 1.5em;">검색 조건에 해당하는 테마가 존재하지 않습니다.</span>
	    	    </div>
    	    </div>
       <%}else {  %>
       
       		<div class="row justify-content-center text-center">
	    	  	<div class="col-md-6">
    	   			<span class="text-cursive text-red" style="font-size: 1.5em;">총 <%=rtList.size() %>건 검색되었습니다.</span><br><br>
    	    	</div>
    	    </div>
    	    <div class="row align-items-stretch">
	        <%for(int i=0; i<rtList.size(); i++){
				rtVo=rtList.get(i);
				
				System.out.println("디버깅1111!!"+themeVo.getThemeNo());
				System.out.println("디버깅2222!!"+rtVo.getThemeNo());
				
				int themeNo=rtVo.getThemeNo();
				themeName=themeService.selectThemeNameByThemeNo(rtVo.getThemeNo());
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
      			
	    	   %>
	       		<div class="col-lg-3 col-md-6 mb-5">
	       			<div class="post-entry-1 h-100">
		       			<div class="card" style="border-line: transparent;">
			                <img src="<%=thImg %>" style="height: 300px;" alt="<%=themeNo %>번 테마 이미지"/>
			                <div class="card-body" style="height: 200px;">
			                  <a href="<%=request.getContextPath()%>/esc/view/unitDetail.jsp?unitNo=<%=unitNo%>"><span><%=rtVo.getBrandName() %> | <%=rtVo.getUnitName() %></span></a>
			                  <h5 class="card-title"><a href="<%=request.getContextPath()%>/esc/view/roomDetail.jsp?roomNo=<%=rtVo.getRoomNo()%>"><%=themeName %></a></h5>
			                  <p class="card-text"><%=Utility.cutString(rtVo.getThemeContent(), 50)%></p>
			                </div>
		            	</div>
	       			</div>
	       		</div>

	       		<%
	       }//for
	   }//if%>
       </div>
       
    <!-- 본문 배경 div -->  
    
 
    </div>
  </div>
  
<!-- content end-->

<jsp:include page="../inc/bottom.jsp"></jsp:include>    