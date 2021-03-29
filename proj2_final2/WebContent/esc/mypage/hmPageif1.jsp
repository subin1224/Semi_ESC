<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>      
<%
	List<BrandVO> nList=null;
	try{
		nList = brandService.selectFlagN();
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
	<div class="container m-auto" style="width:1100px;">
		<!--  -->
		<div
			style="width: 100%; font-size: 40px; font-weight: bold; text-align: center; height: 100px; padding-top: 10px;">
			<span>승인 요청 내역</span>
		</div>
		
		<div style="width:100%;">
			<span style="float: left;">＠ 승인 대기 중 | 가입 승인 요청중인 브랜드 입니다</span>
		</div>

		<!-- 브랜드 매니저 플래그가 N -->
		<table class="table table-striped m-auto" style="width:1100px; border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:30%;" />
				<col style="width:20%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>요청 번호</th>
				<th>브랜드 명</th>
				<th>브랜드 관리자</th>
				<th>관리자 연락처</th>
				<th>요청 상태</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
				<!-- 반복되는 부분 list -->
			<%if(nList==null || nList.isEmpty()){ %>
				<tr>	
					<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0;i<nList.size();i++){ 
					BrandVO vo=nList.get(i);
				%>
					<tr  style="text-align:center">
						<td><%=vo.getBrandNo() %></td>
						<td style="text-align:center"> <%=vo.getBrandName() %> </td>
						<td><%=vo.getAdId() %></td>
						<td><%=vo.getAdTel() %></td>
						<td><a href="hmRequest.jsp?brandno=<%=vo.getBrandNo() %>">요청 수락</a> | <a href="hmRequestDel.jsp?brandno=<%=vo.getBrandNo() %>">요청 삭제</a></td>		
					</tr> 
			<%}//for 
			}//if%> 
			<!-- 반복 완료 -->
			</tbody>
		</table>
		<br>
	<div class="block-counter-1 ">
			<ul class="pagination pagination-sm justify-content-center">
			    <li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/esc/mypage/hmPageif2.jsp">이전</a></li>
			    <li class="page-item"><a class="page-link" href="">1</a></li>
			    <li class="page-item"><a class="page-link" href="">2</a></li>
			    <li class="page-item"><a class="page-link" href="">3</a></li>
			    <li class="page-item"><a class="page-link" href="">4</a></li>
			    <li class="page-item"><a class="page-link" href="">5</a></li>
			    <li><a class="page-link" href="">다음</a></li>
			</ul>
		</div>
	<br>

	</div>
</body>
</html>