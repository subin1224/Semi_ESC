<%@page import="com.proj.review.model.ReviewService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.reserve.model.ReserveVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="memServiceif2" class="com.proj.member.model.MemberService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reserveServiceif2" class="com.proj.reserve.model.ReserveService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reviewServiceif2" class="com.proj.review.model.ReviewService"
	scope="session"></jsp:useBean>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>memPage_Reservation</title>
<%
	String useridif2 = (String)session.getAttribute("userid");
	
	MemberVO voif2=null;
	try{
		voif2 = memServiceif2.selectMember(useridif2);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	// userNo : vo.getUserNo()
	List<ReserveVO> rListif2=null;
	try{
		rListif2=reserveServiceif2.selectReserveByUserNo(voif2.getUserNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
%>     
</head>
<body>
	<div class="container m-auto">
		<h2><span style="font-family:'sans-serif'">▶예약 내역 조회</span></h2>
		<!-- 예약내역 테이블 전체조회 - 페이징처리 -->
		<table class="table table-striped m-auto">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:25%;" />
				<col style="width:25%;" />
				<col style="width:25%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>No</th>
				<th>브랜드 명</th>
				<th>테마 명</th>
				<th>예약날짜</th>
				<th colspan="2">예약상태</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
			<%if(rListif2==null || rListif2.isEmpty()){ %>
				<tr>
					<td colspan="6" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ 
				for(int i=0;i<rListif2.size();i++){
					ReserveVO rVo=rListif2.get(i);
			%>
					<tr >
						<td><%=rVo.getReserveNo() %></td>
						<td><%=rVo.getBrandName() %></td>
						<td><a href="#"><%=rVo.getThemeName() %></a></td>
						<td><%=rVo.getReserveDay() %>-<%=rVo.getReserveTime() %></td>
						<td>
							<%if(rVo.getReserveFlag().equals("Y")){ %>
								예약완료
							<%}else{ %>
								예약취소
							<%} %>
						</td>
						<td>
						<%  
							SimpleDateFormat sdfif2 = new SimpleDateFormat("yyyy-MM-dd");
							Date rvDate = sdfif2.parse(rVo.getReserveDay());
							Date today = new Date();
							long diff =(long)(today.getTime()-rvDate.getTime())/(24*60*60*1000);
							
							int chk=reviewServiceif2.chkReview(rVo.getReserveNo(), voif2.getUserNo());
							
							if(diff>1){
						%>
							<a href="<%=request.getContextPath()%>/esc/view/reviewWrite.jsp?reserveno=<%=rVo.getReserveNo()%>">
								리뷰작성</a>
						<% 
							}else if(diff>1 && chk!=1){
						%>
							작성완료
						<%	}else{ %>
								대기중
					<% 		} %>
						</td>
					</tr>
				<%} %>
			<%} %>	
			<!-- 반복 완료 -->
			</tbody>
		</table>
		<br>

	</div>
</body>
</html>