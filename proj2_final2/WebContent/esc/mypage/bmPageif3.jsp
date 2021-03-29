<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.reserve.model.ReserveVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandServiceif3" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reserveServiceif3" class="com.proj.reserve.model.ReserveService"
	scope="session"></jsp:useBean>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>bm_Reservation</title>
<%
	String adidif3 = (String)session.getAttribute("adid");
	
	BrandVO voif3=null;
	try{
		voif3=brandServiceif3.selectByAdminId(adidif3);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ReserveVO> rListif3 = null;
	try{
		rListif3=reserveServiceif3.selectByBrandNoAll(voif3.getBrandNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdfif3 = new SimpleDateFormat("yyyy-MM-dd");

%>       
</head>
<body>
	<div class="container m-auto">
		<div style="width:800px; margin-bottom:10px;" >
			<span style="float: left;"><h4>●예약 확인 | 테마의 예약 내역들을 보여드립니다</h4></span>
		</div>
		<!-- 해당 브랜드의 예약내역 테이블 -->
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
			<%if(rListif3==null || rListif3.isEmpty()){ %>
				<tr>	
					<td colspan="7" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0;i<rListif3.size();i++){ 
					ReserveVO rVo=rListif3.get(i);
				%>
				<tr >
					<td><%=rVo.getReserveNo() %></td>
					<td><%=rVo.getThemeName() %></td>
					<td><%=rVo.getReserveDay() %></td>
					<td><%=rVo.getPlayerNum() %></td>
					<td><%=rVo.getUserId() %></td>
					<td><%=sdfif3.format(rVo.getReserveReg()) %></td>
					<td><%=rVo.getReserveFlag() %></td>
				</tr>
			<%} 
			}%>
			
			<!-- 반복 완료 -->
			</tbody>
		</table>

		<br>

	</div>
</body>
</html>