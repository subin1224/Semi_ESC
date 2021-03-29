<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.review.model.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:useBean id="reviewService" class="com.proj.review.model.ReviewService" 
	scope="session"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	
$(function(){
	$('.block-counter-1 table tbody tr').hover(function(){
		$(this).css('background','lightblue');
	}, function(){
		$(this).css('background','');		
	});	
});
</script>
<%
	//1	
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	
	List<ReviewVO> list= null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	try{
		list = reviewService.sellectAll(keyword, condition);
	}catch (SQLException e){
		e.printStackTrace();
	}
	
	
	//페이징 처리
	int currentPage=1;  //현재 페이지
		
	//페이지번호를 클릭한 경우 처리
	if(request.getParameter("currentPage")!=null){
	  currentPage=Integer.parseInt(request.getParameter("currentPage"));		
	}
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=0;  //총 레코드 수
	if(list!=null && !list.isEmpty()){
		totalRecord = list.size();  //예) 17
	}
	
	int pageSize=10;  //한 페이지에 보여줄 레코드(행) 수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize); 
		//=> 총 페이지수
	int blockSize=10; //한 블럭에 보여줄 페이지 수
				
	//[2] 현재 페이지를 이용하는 변수
	int firstPage=currentPage - ((currentPage-1)%blockSize);
	//=> 블럭 시작 페이지 [1],[11],[21]...
	int lastPage=firstPage + (blockSize-1); //블럭 마지막 페이지
	//=> [10],[20],[30]...
	
	//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
	int curPos=(currentPage-1)*pageSize;
	
	//페이지당 글 리스트 시작 번호
	int num=totalRecord-(curPos); //예) 17, 12, 7, 2
	
	if(keyword ==null || keyword.isEmpty()){ 
		keyword="";
	}
%>

	

<!-- content -->
<div class="site-section bg-teal">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
          	<br><br><br><br>
            <span class="text-cursive h5 text-red d-block">Best Review</span>
            <h2 class="text-white">조회수가 가장 많은 Review</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="testimonial-4-wrap" style="border-radius: 40px">
              

              <div class="owl-carousel nonloop-block-13">
                <div class="testimonial-3 d-flex" >
                  <div class="vcard-wrap mr-5">
                    <img src="http://www.master-key.co.kr/upload/room/135_img1.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text-black">
                    <h1>泫月</h1>
                    <h2 class="position">오리엔탈특급</h2>
                    <p>왠지 고풍스런 느낌의 테마라서...</p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="http://www.master-key.co.kr/upload/room/155_img1.png" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text-black">
                    <h1>DELIVER</h1>
                    <h2 class="position">잠행특집</h2>
                    <p>"포스트맨은 벨을 두번 누른다""를 ...</p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="http://www.master-key.co.kr/upload/room/157_img1.png" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text-black">
                    <h1>시간여행자</h1>
                    <h2 class="position">어둠의 잠행자</h2>
                    <p>색다른 테마라서 굉장히 궁금 하였..</p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        
      </div>
    </div>
	<div class="block-counter-1" style="padding-top: 10px; " >
		<label style="color:white; background: red; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
		R &nbsp&nbsp E &nbsp&nbsp V &nbsp&nbsp I &nbsp&nbsp E &nbsp&nbsp W</label>
	</div>	
	<div class="block-counter-1" style="padding-left:160px; width : 100%;">
		<table class="table table-striped-even mb-0" style="width: 90%; 
		border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 35%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 5%;" />

			</colgroup>
			<thead style="background: rgb(23,162,184)">
				<tr style="text-align: center">
					<th>No</th>
					<th>Brand</th>
					<th>Theme</th>
					<th>Title</th>
					<th>Write By</th>
					<th>Registration</th>
					<th>Like</th>
				</tr>
			</thead>
		

			<tbody style="text-align: center;">
		<%if(list ==null || list.isEmpty()){ %>
			<tr>
				<td colspan="7" class="align_center">데이터가 존재하지 않습니다.</td>
			</tr>
		<%}else{ 
				for(int i=0;i<pageSize;i++){
				if(num<1) break;
				
				ReviewVO vo=list.get(curPos++);
				num--;
				%>
				<tr>
					<td><%=vo.getReviewNo()%></td>
					<td><%=vo.getBrandName() %></td>
					<td><%=vo.getThemeName() %></td>
					<td><a href="countUpdate.jsp?reviewNo=<%=vo.getReviewNo()%>&roomNo=<%=vo.getRoomNo()%>&userId=<%=vo.getUserId() %>"><%=vo.getReTitle() %>></a></td>
					<td><%=vo.getUserId() %></td>
					<td><%=sdf.format(vo.getReRegdate())%></td>
					<td><%=vo.getLikeCount() %></td>
				</tr>
				<%}//for
			}//if%>
				<!-- 반복 list 끝 -->
			</tbody>
		</table>
	</div>
	<div class="divPage block-counter-1" style="padding-top: 10px;">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<%if(firstPage>1){ %>
		<a href="review.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/first.JPG" alt="이전블럭으로 이동">
		</a>
	<%}//if %>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			
			if(i==currentPage){	%>
				<span style="color:blue;font-weight: bold">
					<%=i %></span>
			<%}else{ %>
				<a href
="review.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i %>]</a>
			<%}//if %>
	<%	}//for	%>
	
	<!-- 다음 블럭으로 이동 -->
	<%if(lastPage < totalPage){ %>
		<a href="review.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/last.JPG" alt="다음 블럭으로 이동">
		</a>
	<%}//if %>
	
	<!--  페이지 번호 끝 -->
</div><br>
<div class="block-counter-1 divSearch" style="padding-top: 10px;">
	<%if(keyword !=null && !keyword.isEmpty()){ %>
		<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
<%}%>
</div>

<div class="block-counter-1 divSearch" style="padding-top: 10px;">
	<form name="frmSearch" method="post" action='review.jsp'>
        <select name="searchCondition" class="combo-control "style="color: rgb(23,162,184);
        	width: 70px; border-radius: 10px;border-color: #fd4d40;">
            <option value="reTitle" 
            	<%if("reTitle".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >제목</option>
            <option value="themeName"
            	<%if("themeName".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >테마</option>
            <option value="userId" 
            	<%if("userId".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" value="<%=keyword%>" 
        style="color:rgb(23,162,184); width:200px; border-radius: 10px; border-color: #fd4d40;">   
		<input type="image" src="../images/searchIcon_red.png" style="width:30px" name="submit" value="submit" align="absmiddle">
    </form>
	
</div>
<br>
  
<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>    
