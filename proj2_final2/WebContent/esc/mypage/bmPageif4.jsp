<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="com.proj.review.model.ReviewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="reviewServiceif4" class="com.proj.review.model.ReviewService" scope="session"></jsp:useBean>     
<jsp:useBean id="brandServiceif4" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>bmPage_review</title>
</head>
<body>
<%
	String adidif4 = (String)session.getAttribute("adid");
	
	//브랜드 아이디로 브랜드 번호 뽑기
	BrandVO bVo = null;
	try{
		bVo=brandServiceif4.selectByAdminId(adidif4);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//테마네임, 리뷰의 번호, 제목, 평점, 작성자, 등록일 있어야 함  reviewServiceif4
	List<ReviewVO> list4 = null;
	try{
		list4=reviewServiceif4.selectByBrandNo(bVo.getBrandNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd");
	
%>
	<div class="container m-auto">
		<div style="width:800px; margin-bottom:10px;" >
			<span style="float: left; font-size: 30px;">●리뷰 조회 | 테마의 리뷰 내역들을 보여드립니다</span>
		</div>
		<div style="width:300px; height:100px; margin-bottom:10px; margin-top:10px;">
			<br>
		</div>
		<!-- 해당 브랜드의 예약내역 테이블 -->
		<table class="table table-striped m-auto" style="width:1100px; border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:22%;" />
				<col style="width:33%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:20%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>번호</th>
				<th>테마 명</th>
				<th>제목</th>
				<th>평점</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			</thead>
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
			<%if(list4==null || list4.isEmpty()){ %>
				<tr>	
					<td colspan="6" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ %>			
				<%for(int i=0; i<list4.size(); i++){ 
					ReviewVO rVo4 = list4.get(i);
				%>
					<tr >
						<td><%=rVo4.getReviewNo() %></td>
						<td><%=rVo4.getThemeName() %></td>
						<td><a href="#"><%=rVo4.getReTitle() %></a></td>
						<td><%=rVo4.getRating() %></td>
						<td><%=rVo4.getUserId() %></td>
						<td><%=sdf4.format(rVo4.getReRegdate()) %></td>
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