<%@page import="com.proj.unit.model.UnitVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.reserve.model.ReserveVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reserveService" class="com.proj.reserve.model.ReserveService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="unitServiceif1" class="com.proj.unit.model.UnitService" scope="session"></jsp:useBean>  
<%
	String adid = (String)session.getAttribute("adid");
	
	BrandVO vo=null;
	try{
		vo=brandService.selectByAdminId(adid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ReserveVO> rList = null;
	try{
		rList=reserveService.selectByBrandNO(vo.getBrandNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	List<UnitVO> uList = null;
	try{
		uList=unitServiceif1.selectUnitByBrandNo(vo.getBrandNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>memPage_Reservation</title>
</head>
<body>
	<div class="container m-auto">
		<div style="width:1100px">
			<h4 style="float: left;"><%=vo.getBrandName() %> 관리자 님 </h4><br><br>
			<span style="float: left;">●예약 현황 | 진행중인 예약중 최근5건을 보여드립니다</span>
		</div>
		<!-- 해당 지점 중 예약중인 테이블 -->
		<table class="table table-striped m-auto" style="width:1100px; border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:30%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>예약 번호</th>
				<th>테마 명</th>
				<th>예약 날짜</th>
				<th>인원 수</th>
				<th>회원 아이디</th>
				<th>예약 등록일</th>
				<th>예약 상태</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
			<%if(rList==null || rList.isEmpty()){ %>
				<tr>	
					<td colspan="7" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0;i<rList.size();i++){ 
					ReserveVO rVo=rList.get(i);
				%>
				<tr >
					<td><%=rVo.getReserveNo() %></td>
					<td><%=rVo.getThemeName() %></td>
					<td><%=rVo.getReserveDay() %></td>
					<td><%=rVo.getPlayerNum() %></td>
					<td><%=rVo.getUserId() %></td>
					<td><%=sdf.format(rVo.getReserveReg()) %></td>
					<td><%=rVo.getReserveFlag() %></td>
				</tr>
			<%} 
			}%>
			
			<!-- 반복 완료 -->
			</tbody>
		</table>
		<br>
		<div style="width:1100px">
			<span style="float: left;">●지점 조회 | 해당 브랜드에 등록되어 있는 지점입니다.</span>
		</div>
		<table class="table table-striped m-auto" style="width:1100px; border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:30%;" />
				<col style="width:30%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>No</th>
				<th>지점 명</th>
				<th>상세 주소</th>
				<th>전화번호</th>
				<th>등록일</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
			<%if(rList==null || rList.isEmpty()){ %>
				<tr>	
					<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0;i<uList.size();i++){ 
					UnitVO uVo=uList.get(i);
				%>
				<tr >
					<td><%=uVo.getUnitNo() %></td>
					<td><%=uVo.getUnitName() %></td>
					<td><%=uVo.getUnitAddress() %></td>
					<td><%=uVo.getUnitTel() %></td>
					<td><%=sdf.format(uVo.getUnitRegdate()) %></td>
				</tr>
			<%} 
			}%>
			</tbody>
		</table>		
	</div>
</body>
</html>