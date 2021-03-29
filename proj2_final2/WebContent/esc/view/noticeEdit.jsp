<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<jsp:useBean id="noticeVo" class="com.proj.notice.model.NoticeVO"
   scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo" />
<jsp:useBean id="noticeService"
   class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
<jsp:useBean id="brVo" class="com.proj.brand.model.BrandVO"
   scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brVo" />
<jsp:useBean id="brService"
   class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>


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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/binstyle.css">

<!-- MAIN CSS -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/esc/css/style.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/esc/css/jianstyle.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/esc/css/sjstyle.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function goDelete(noticeNo){
		if(confirm("정말 삭제 하시겠습니까?")){
			location.href='<%=request.getContextPath() %>/esc/ok/noticeDeleteOk.jsp?noticeNo='+noticeNo;
		}else{
			history.back();
		}
	}
   
</script>
   
<!-- content -->

<%
	request.setCharacterEncoding("utf-8");
	
	
	//countUpdateOk.jsp 에서 get방식으로 이동
	String noticeNo = request.getParameter("noticeNo");

	
	
	//공지사항 번호로 공지사항 조회
	try{
		noticeVo = noticeService.selectByNo(Integer.parseInt(noticeNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	int brandNo = noticeVo.getBrandNo();
	
	
	//브랜드 번호로 브랜드 전체 저회
	try{
		brVo = brService.selectByNo(brandNo);
	}catch(SQLException e){
		e.printStackTrace();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
 <div class="ftco-blocks-cover-1">
       
      <div class="site-section-cover1 overlay">
        <div class="container">
          <div class="row align-items-center ">
            <div class="col-md-5 mt-5 pt-5">
            
            </div>
            <div class="col-md-6 ml-auto align-self-end">
           </div>
          </div>
        </div>
      </div>
    </div> <!-- frco-blocks-cover-1 -->


<div class="site-section">
	<div class="container">
		<div class="row">

			<div class="col-md-9" style="margin-left: 13%;">
				<div style="text-align: center;">
					<h2>공지사항</h2>
				</div>
				<br>
				<br>
				<div>
					<form
						action="<%=request.getContextPath()%>/esc/ok/noticeUpdateOk.jsp"
						method="post">
						<input type="hidden" name="noticeNo"
							value="<%=noticeVo.getNoticeNo() %>">
						<table style="width: 100%;">
							<tr>
								<td colspan="3"><h6>
										#<%=brVo.getBrandName() %></h6></td>
							</tr>
							<tr>
								<td colspan="3"><h5>
										제목 : <input type="text" name="noTitle" style="width: 100%;"
											value="<%=noticeVo.getNoTitle() %>">
									</h5></td>
							</tr>
							<tr>
								<td colspan="1">작성자 : <%=brVo.getAdId() %></td>
								<td style="width: 20%;"></td>
								<td style="width: 15%;"><%=sdf.format(noticeVo.getNoRegdate()) %></td>
								<td style="width: 15%;">조회수 : <%=noticeVo.getNoHit() %></td>
							</tr>
							<tr>
								<td colspan="5"><hr></td>
							</tr>
							<tr style="height: 50%;">
								<td colspan="5"><p>
										<textarea class="form-control" id="rvEditor" name="noContent"><%=noticeVo.getNoContent()%></textarea>
										<script type="text/javascript">
									CKEDITOR.replace('rvEditor', {
											height : 300,
											width : 800

									});
								</script></td>
							</tr>
						</table>
						<div class="row justify-content-center">
							<!-- 하부 내용물 가운데정렬 -->
							<input type="submit"
								class="btn btn-danger btn-custom-2 mt-4 text-white" style="margin-right:5px;" value="수정">
						
							<!-- 하부 내용물 가운데정렬 -->
						<button 
                        class="btn btn-danger btn-custom-2 mt-4 text-white"
                        onclick="location.href=<%=request.getContextPath()%>/esc/view/notice.jsp">글목록</button>
                 	 </div>

					</form>
				</div>
			</div>



		</div>

	</div>

</div>



<!--  content-end -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>    