<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.review.model.ReviewTotalVO"%>
<%@page import="com.proj.reserve.model.ReserveVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<jsp:useBean id="memService" class="com.proj.member.model.MemberService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reserveService" class="com.proj.reserve.model.ReserveService"
	scope="session"></jsp:useBean>  
<jsp:useBean id="reviewService" class="com.proj.review.model.ReviewService"
	scope="session"></jsp:useBean>  
<%
	String userid = (String)session.getAttribute("userid");
	
	MemberVO vo=null;
	try{
		vo = memService.selectMember(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	// userNo : vo.getUserNo()
	List<ReserveVO> rList=null;
	try{
		rList=reserveService.selectReserveByUserNo(vo.getUserNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	List<ReviewTotalVO> reviewList = null;
	try{
		reviewList=reviewService.selectReviewByUser(vo.getUserNo());
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">
 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/icomoon/style.css">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap-datepicker.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jquery.fancybox.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/aos.css">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/style.css">
<title>memPage_main</title>
</head>
<body>
<!-- 글 조회는 최신순 5개까지만 -->
	<div class="container mb-0">
		<div>
			<h4 style="float: left;"><%=vo.getUserName() %> 님 </h4><span style="float: right;">보유중인 마일리지 : <%=vo.getMileage() %>원 </span>
		</div><br><br>
		<span style="font-family:'sans-serif'">▶예약내역 조회</span>
		<table class="table table-striped mb-0">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:10%;" />
				<col style="width:25%;" />
				<col style="width:20%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>No</th>
				<th>브랜드 명</th>
				<th>테마 명</th>
				<th>예약 날짜</th>
				<th>예약 상태</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
			<%if(rList==null || rList.isEmpty()){ %>
				<tr>
					<td colspan="5" class="align_center">데이터가 존재하지 않습니다.</td>
				</tr>
			<%}else{ 
				for(int i=0;i<rList.size();i++){
					ReserveVO rVo=rList.get(i);
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
								예약 취소
							<%} %>
						</td>
					</tr>
				<%} %>
			<%} %>	
			<!-- 반복 완료 -->
			</tbody>
		</table>
		<div style="text-align: right;" class="m-0">
			<a href="#"><img src="<%=request.getContextPath()%>/esc/images/bin_more.png"></a>
		</div>
		
		
		<br><br>
		<div class="row">
			<div class="col-md-6 mb-0">
			<span style="font-family:'sans-serif'">▶내가 쓴 리뷰</span>
				<!-- test1 : 리뷰 조회 -->
				<table class="table table-striped mb-0">
					<colgroup>
						<col style="width:5%;" />
						<col style="width:20%;" />
						<col style="width:5%;" />
						<col style="width:13%;" />
					</colgroup>
					<thead>
					<tr style="text-align:center">
						<th>No</th>
						<th>테마명</th>
						<th>평점</th>
						<th>등록일</th>
					</tr>
					</thead>
					
					<tbody style="text-align:center;">
					<%if(rList==null || rList.isEmpty()){ %>
						<tr>
							<td colspan="4" class="align_center">데이터가 존재하지 않습니다.</td>
						</tr>
					<%}else{ 
						for(int i=0;i<reviewList.size();i++){
							ReviewTotalVO rtVo=reviewList.get(i);
					%>
							<tr >
								<td><%=rtVo.getReviewNo() %></td>
								<td><%=rtVo.getThemeName() %></td>
								<td><%=rtVo.getRating() %></td>
								<td><%=sdf.format(rtVo.getReRegdate()) %> </td>
							</tr>
						<%} %>
					<%} %>	
					<!-- 반복 완료 -->
					</tbody>
				</table>
				<div style="text-align: right;" class="m-0">
					<a href="#"><img src="<%=request.getContextPath()%>/esc/images/bin_more.png"></a>
				</div>				
			</div>
			
			<div class="col-md-6 mb-0">
			<!-- test2 : Find-Person 조회 -->
			<span style="font-family:'sans-serif'">▶내가 쓴 게시물</span>			
				<table class="table table-striped mb-0">
					<colgroup>
						<col style="width:5%;" />
						<col style="width:25%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
					<tr style="text-align:center">
						<th>No</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					</thead>
					<tbody style="text-align:center;">
					<!-- 반복되는 부분 list -->
						<tr >
							<td>1</td>
							<td><a href="#">초밥먹고싶다</a></td>
							<td>2020-12-22</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#">배고프다</a></td>
							<td>2020-12-21</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="#">자고싶다</a></td>
							<td>2020-12-20</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="#">잠을못잤다ㅠ</a></td>
							<td>2020-12-19</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="#">단거먹고싶다</a></td>
							<td>2020-12-17</td>
						</tr>
					<!-- 반복 완료 -->
					</tbody>
				</table>
				<div style="text-align: right;" class="m-0">
					<a href="#"><img src="<%=request.getContextPath()%>/esc/images/bin_more.png"></a>
				</div>
			</div>
		</div>
	</div>






    <script src="<%=request.getContextPath()%>/esc/js/jquery-3.3.1.min.js"></script>
</body>
</html>