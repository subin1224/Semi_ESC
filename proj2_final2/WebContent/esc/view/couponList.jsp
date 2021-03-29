<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.coupon.model.CouponVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	boolean top_isLogin=false;
	//탑에서의 userid = top_userid
	String top_userid = (String)session.getAttribute("userid");
	String top_adid = (String)session.getAttribute("adid");
	
	String top_flag = (String)session.getAttribute("flag");  //권한
		
	if((top_userid!=null && !top_userid.isEmpty()) || (top_adid!=null && !top_adid.isEmpty())){
		top_isLogin=true;		//로그인 된 경우
	}

	

	
%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>ㅇㄱㅌㅊ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700|Indie+Flower" rel="stylesheet">
 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/icomoon/style.css">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/bootstrap-datepicker.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jquery.fancybox.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/jianstyle.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/sjstyle.css">

	<jsp:useBean id="cpVo" class="com.proj.coupon.model.CouponVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="cpVo"/>
<jsp:useBean id="cpService" class="com.proj.coupon.model.CouponService" scope="session"></jsp:useBean>
<script type="text/javascript">
function sendChildValue(code,discount){
	opener.setChildValue(code,discount);
	window.close();

	}



</script>
 
  </head>
<body style = "width:100%; height:400px;">
<%
//페이징 처리
		int currentPage=1;  //현재 페이지
		
		
		List<CouponVO> cpList = null;
		try{
			cpList = cpService.selectAll();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//페이지번호를 클릭한 경우 처리
		if(request.getParameter("currentPage")!=null){
		  currentPage=Integer.parseInt(request.getParameter("currentPage"));		
		}
		
		//[1] 현재 페이지와 무관한 변수
		int totalRecord=0;  //총 레코드 수
		if(cpList!=null && !cpList.isEmpty()){
			totalRecord = cpList.size();  //예) 17
		}
		
		int pageSize=5;  //한 페이지에 보여줄 레코드(행) 수
		int totalPage = (int)Math.ceil((float)totalRecord/pageSize); 
			//=> 총 페이지수
		int blockSize=5; //한 블럭에 보여줄 페이지 수
					
		//[2] 현재 페이지를 이용하는 변수
		int firstPage=currentPage - ((currentPage-1)%blockSize);
		//=> 블럭 시작 페이지 [1],[11],[21]...
		int lastPage=firstPage + (blockSize-1); //블럭 마지막 페이지
		//=> [10],[20],[30]...
		
		//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
		int curPos=(currentPage-1)*pageSize;
		
		//페이지당 글 리스트 시작 번호
		int num=totalRecord-(curPos); //예) 17, 12, 7, 2

%>
<div class="container justify-content-center" style= "width:90%; margin-top:50px; margin-bottom:20px;">
	<h3 style="text-align: center;">쿠폰 리스트</h3>
</div>
<div class="container" style="width:100%;">
	<table class="table-striped-even" style="width:90%; ">
		<tbody>
			<tr class="text-center">
				<th style="width: 5%; font-size:20px;">번호</th>
				<th style="width: 30%; font-size:20px;">쿠폰이름</th>
				<th style="width: 20%; font-size:20px;">쿠폰코드</th>
				<th style="width: 10%; font-size:20px;">할인가격</th>
				<th style="width: 15%; font-size:20px;">적용시작일</th>		
				<th style="width: 15%; font-size:20px;">적용만료일</th>		
			</tr>
			<%
				if(cpList.size()==0){
				%>
				<tr class="text-center">
					<td colspan="7">현재 적용 중인 쿠폰이 없습니다.</td>
				</tr>
				<%
				}else{
					for(int i=0; i<pageSize;i++){
						if(num<1) break;
						cpVo = cpList.get(curPos++);
						num--;
						
						String couponCode=cpVo.getCouponCode();
						int discount =cpVo.getDiscount();
						%>
					<tr class="text-center">
						<td class="text-center" style="font-size:20px;"><%=cpVo.getCouponNo() %></td>
						<td style="font-size:20px;">
						<a  href="javascript:sendChildValue('<%=couponCode%>','<%=discount%>')">
						<%=cpVo.getCouponName()%></a></td>
						<td style="font-size:20px;"><%=couponCode %></td>
						<td class="text-center" style="font-size:20px;"><%=discount %></td>
						<td class="text-center" style="font-size:20px;"><%=sdf.format(cpVo.getStartDate()) %></td>
						<td class="text-center" style="font-size:20px;"><%=sdf.format(cpVo.getEndDate()) %></td>
					</tr>
				<%	}
				}	
			%>
		</tbody>
	</table>
	<br><br>
		<div class="block-counter-1 ">
			<ul class="pagination pagination-sm justify-content-center">
			<%if(firstPage>1){ %>
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/esc/view/couponList.jsp?currentPage=<%=firstPage-1%>">이전</a>
				</li>
				<%
			} //if
			 for(int i = firstPage; i <= lastPage; i++) {
					if (i > totalPage)
					break;
				if (i == currentPage){%>
					<li><span style="color: blue; font-weight: bold">[<%=i%>]</span></li>
				<% }else{ %>
					<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/esc/view/couponList.jsp?currentPage=<%=i%>">
					<%=i %></a></li>
				<%}//if
				}//for 	%>
			<%if(lastPage < totalPage){ %>
			 <li><a class="page-link" href="<%=request.getContextPath() %>/esc/view/couponList.jsp?currentPage=<%=lastPage+1%>">다음</a></li>
		<%}//if %>
			</ul>
		</div>
<br>
     <%
            if(cpList.size()==0){
               %>
            <div style="margin-left:45%;">
               <input  type="button" onclick="window.close()" value="확인">
            </div>   
               <%
            }
         
         %>	
</div>
 

 </body>
 </html>
	