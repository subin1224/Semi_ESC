<%@page import="com.proj.common.Utility"%>
<%@page import="com.proj.themeImg.model.ThemeImgVO"%>
<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.room.model.RoomTotalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandServiceif2" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>        
<jsp:useBean id="roomServiceif2" class="com.proj.room.model.RoomService" scope="session"></jsp:useBean>       
<jsp:useBean id="themeServiceif2" class="com.proj.theme.model.ThemeService" scope="session"></jsp:useBean>       
<jsp:useBean id="themeImgServiceif2" class="com.proj.themeImg.model.ThemeImgService" scope="session"></jsp:useBean>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>bm_themeManage</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function openPop(){
	window.open("bmPageif5.jsp","ThemeReg", "width=1400, height=600, scrollbars=0, toolbar=0, menubar=no");
}
</script>
<%
	//브랜드 관리자의 아이디로 => 브랜드 정보 뽑아서 => 브랜드VO의 브랜드no 가져오기
	String adidif2 = (String)session.getAttribute("adid");
	
	BrandVO voif2 = null;
	try{
		voif2=brandServiceif2.selectByAdminId(adidif2);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<RoomTotalVO> rtList=null;
	try {
		rtList=roomServiceif2.selectByBrandNo(voif2.getBrandNo());
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	ThemeVO themeVo=new ThemeVO();
	ThemeImgVO themeImgVo=null;
	RoomTotalVO rtVo=new RoomTotalVO();
%>
</head>
<body>
	<div class="container m-auto pl-5">
		<div class="align-items-stretch">
        	<p>
				<span style="font-family:'sans-serif'; font-size: 20px;">●테마 관리</span><br>
			</p>
			<button class="btn btn-info" style="width:180px; float:left;" id="threg" onclick=openPop() >테마 등록</button>
		</div>		
        <div class="align-items-stretch" id="d11" style="width:1200px;">
			<br><br>
          	<!-- 반복 부분 -->
	       <% if (rtList.isEmpty()) {%>
	    	  	<div class="row justify-content-center text-center">
		    	  	<div class="col-md-6">
		    	   		<span class="text-cursive text-red" style="font-size: 1.5em;">검색 조건에 해당하는 테마가 존재하지 않습니다.</span>
		    	    </div>
	    	    </div>
	       <%}else {  %>
	    	    <div class="row align-items-stretch">
		        <%for(int i=0; i<rtList.size(); i++){
					rtVo=rtList.get(i);
					
					System.out.println("디버깅1111!!"+themeVo.getThemeNo());
					System.out.println("디버깅2222!!"+rtVo.getThemeNo());
					
					int themeNo=rtVo.getThemeNo();
					String themeName=themeServiceif2.selectThemeNameByThemeNo(rtVo.getThemeNo());
					int brandNo=rtVo.getBrandNo();
					int unitNo=rtVo.getUnitNo();
					
					String img=themeImgServiceif2.selectImgSrcByThemeNo(rtVo.getThemeNo());
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
				                  <p class="card-text"><%=Utility.cutString(rtVo.getThemeContent(), 45)%></p>
				                </div>
			            	</div>
		       			</div>
		       		</div>
	
		       		<%
		       }//for
		   }//if%>
	       </div>


		</div>

		
		
	</div>
</body>
</html>