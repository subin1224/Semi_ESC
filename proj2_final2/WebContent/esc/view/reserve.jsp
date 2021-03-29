<!--  12월 27일 수정 사항 : (지안) 전체적으로 reserve 페이지 수정했으니 ctrl+A로 전부 덮어씌워주시길 바랍니다. -->

<%@page import="com.proj.theme.model.ThemeVO"%>
<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="com.proj.brand.model.BrandService"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.location1.model.Location1VO"%>
<%@page import="java.util.List"%>
<%@page import="com.proj.location1.model.Location1Service"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="loc1Vo" class="com.proj.location1.model.Location1VO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="loc1Vo"/>
<jsp:useBean id="loc1Service" class="com.proj.location1.model.Location1Service" scope="session"></jsp:useBean>
<jsp:useBean id="brandVo" class="com.proj.brand.model.BrandVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="brandVo"/>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>
<jsp:useBean id="unitVo" class="com.proj.unit.model.UnitVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="unitVo"/>
<jsp:useBean id="unitService" class="com.proj.unit.model.UnitService" scope="session"></jsp:useBean>
<jsp:useBean id="themeVo" class="com.proj.theme.model.ThemeVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="themeVo"/>
<jsp:useBean id="themeService" class="com.proj.theme.model.ThemeService" scope="session"></jsp:useBean>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		var location = document.querySelector('#reserveSelectBox').offsetTop;
		window.scrollTo({top:location, behavior:'smooth'});
	})

	$(function(){
		$('#menu-reserve').addClass('active');			
	})
 
	function goPageBr(location1Code){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code;
	}
	function goPageUn(location1Code, brandNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code+"&brandNo="+brandNo;
	}
	function goPageTh(location1Code, brandNo,unitNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserve.jsp?location1Code="+location1Code+"&brandNo="+brandNo+"&unitNo="+unitNo;
	}
	
	function goThemePage(location1Code,brandNo,unitNo,themeNo){
		location.href="<%=request.getContextPath()%>/esc/view/reserveTheme.jsp?location1Code="+location1Code+"&brandNo="+brandNo+"&unitNo="+unitNo+"&themeNo="+themeNo;
	}
</script>
<!-- content -->
<!-- 오른쪽에 아이디 , 자물쇠이미지 따야함 -->
<%
	//inc - top.jsp 에서 [reserve] 클릭하면 get 방식으로 이동
	//1. 
	
	request.setCharacterEncoding("utf-8");
	String location1Code = request.getParameter("location1Code");
	String brandNo = request.getParameter("brandNo");
	String unitNo = request.getParameter("unitNo");
	String themeNo = request.getParameter("themeNo");
	
	if(location1Code==null || location1Code.isEmpty()){
		location1Code = "0";
	}
	if(brandNo==null || brandNo.isEmpty()){
		brandNo = "0";
	}
	if(unitNo==null || unitNo.isEmpty()){
		unitNo = "0";
	}
	if(themeNo==null || themeNo.isEmpty()){
		themeNo = "0";
	}
	
	
	
	
	List<Location1VO> loc1list = null;
	try{
		loc1list=loc1Service.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<BrandVO> brlist = null;
	try{
		brlist=brandService.selectByLoc1(location1Code);		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	List<UnitVO> unlist = null;
	try{
		unlist=unitService.selectUnitByBrandLocation1(Integer.parseInt(brandNo), location1Code);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ThemeVO> thlist=null;
	try{
		thlist=themeService.selectThemeByBrandUnit(Integer.parseInt(brandNo), Integer.parseInt(unitNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	if(brandNo.equals("0")){%>
			<script>
			$(function(){
				$('#location1Img').css("display","inline");
				$('#brandNoImg').css("display","none");
				$('#unitNoImg').css("display","none");
				$('#themeNoImg').css("display","none");
			})
			</script>
	<%}else if(unitNo.equals("0")){%>
			<script>
				$(function(){
					$('#location1Img').css("display","none");
					$('#brandNoImg').css("display","inline");
					$('#unitNoImg').css("display","none");
					$('#themeNoImg').css("display","none");
				})
			</script>
	<%}else if(themeNo.equals("0")){%>
		<script>
			$(function(){
				$('#location1Img').css("display","none");
				$('#brandNoImg').css("display","none");
				$('#unitNoImg').css("display","inline");
				$('#themeNoImg').css("display","none");
			})
		</script>
	<%}%>


<div class="ftco-blocks-cover-1">
	<!-- 헤더 부분 높이 수정 (지안, 수빈) -->
	<div class="site-section-cover1 overlay"
		data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/topbanner2.jpg')">
		<div class="container">
			<div class="row align-items-center ">

				<div class="col-md-5 mt-5 pt-5">
					<span class="text-cursive h5 text-red" style="color:red">reserve</span>
					<h1 class="mb-3 font-weight-bold text-teal">Reserve</h1>
					<p>
						<a href="<%=request.getContextPath()%>/esc/index.jsp"
							class="text-white">Home</a> <span class="mx-3">/</span> <strong>Reserve</strong>
					</p>
				</div>

			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>

<div class="container" id="reserveBox">
	<div class="reserveBoxList">
		<div>
			<span>지역</span> 
			<img id="location1Img"  alt="달리는 사람" style="display:inline;" src="../images/reserveRunYellow.png" width="60px">
		</div>

		<div class=" justify-content-center">
			<span>브랜드 </span>
				<img id="brandNoImg" alt="달리는 사람"  style="display:none;" src="../images/reserveRunYellow.png" width="60px">
		</div>

		<div>
			<span>지점</span> 
				<img id="unitNoImg" alt="달리는 사람" style="display:none;" src="../images/reserveRunYellow.png" width="60px">
		</div>
		<div>
			<span>테마</span> 
				<img id="themeNoImg" alt="달리는 사람" style="display:none;" src="../images/reserveRunYellow.png" width="60px">
		</div>
	</div>

	<br>
	
	<div class="reserveSelectBox" id="reserveSelectBox">
		<hr style="border: 2px solid gray">
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="location1Code" name="location1Code" onchange="goPageBr(this.value)">
			<%
				for(int i=0; i<loc1list.size(); i++){
						loc1Vo = loc1list.get(i);
						String Location1Code2 = loc1Vo.getLocation1Code();
						%>
							<option value="<%=Location1Code2 %>"
								<%if(Location1Code2.equals(location1Code)){ %>
            						selected="selected"
            					<%} %>
							><%=loc1Vo.getLocation1Name() %></option>
							<%
					}
				%>
		</select> 
	
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="brandNo" name="brandNo" onchange="goPageUn(location1Code.value,this.value)">
 			<%
 				if(brlist.size()==0 || brandNo.equals(0)){
				%>
						<option value="0" selected disabled="disabled" >브랜드</option>
				<%
 				}else{
 					for(int i=0; i<brlist.size(); i++){
						brandVo = brlist.get(i);
						int brandNo2 = brandVo.getBrandNo();
							%>
							<option value="<%=brandNo2%>"
								<%if(brandNo2==Integer.parseInt(brandNo)){ %>
            						selected="selected"
            					<%} %>
							><%=brandVo.getBrandName()%></option>
							<%
					}
 				}
			
			%>
 		</select> 
		
		
	
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="unitNo" name="unitNo" onchange="goPageTh(location1Code.value,brandNo.value,this.value)">
			<%
				if(unlist.size()==0 || unitNo.equals(0)){
				%>
					<option value="0" selected disabled="disabled" >지점</option>
				<%
				}else{
					for(int i=0; i<unlist.size(); i++){
						unitVo = unlist.get(i);
						int unitNo2 = unitVo.getUnitNo();
							%>
							<option value="<%=unitNo2 %>"
								<%if(unitNo2==Integer.parseInt(unitNo)){ %>
            						selected="selected"
            					<%} %>
							><%=unitVo.getUnitName() %></option>
							<%
					}
				}
			%>
		</select> 
		<select class="form-select" size="10" multiple
			aria-label="multiple select example" id="themeNo" name="themeNo" onchange="goThemePage(location1Code.value,brandNo.value,unitNo.value,this.value)">
					<%
				if(thlist.size()==0 || unitNo.equals(0)){
				%>
					<option value="0" selected disabled="disabled" >테마</option>
				<%
				}else{
					for(int i=0; i<thlist.size(); i++){
						themeVo = thlist.get(i);
							%>
							<option value="<%=themeVo.getThemeNo()%>"><%=themeVo.getThemeName() %></option>
							<%
					}
				}
			%>
		</select>
		<hr style="border: 2px solid gray">
	</div>

	<br> <br> <br>
	<br> <br> <br> <br>
</div>





<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>


