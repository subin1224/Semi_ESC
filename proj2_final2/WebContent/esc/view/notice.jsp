<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.proj.notice.model.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<%
   String top_adid = (String) session.getAttribute("adid");
   String top_flag = (String) session.getAttribute("flag"); //권한
   boolean top_isLogin = false;
   if ((top_adid != null && !top_adid.isEmpty())) {
      top_isLogin = true; //로그인 된 경우
   }
%>
<jsp:useBean id="noticeVo" class="com.proj.notice.model.NoticeVO"
   scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo" />
<jsp:useBean id="noticeService"
   class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
<jsp:useBean id="brVo" class="com.proj.brand.model.BrandVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brVo" />
<jsp:useBean id="brService" class="com.proj.brand.model.BrandService"
   scope="session"></jsp:useBean>


<%
   //notice.jsp 에서 페이지 누를시 get방식으로 전송
   //notice.jsp 에서 검색할시 post방식으로 전송

//1   
request.setCharacterEncoding("utf-8");
String condition = request.getParameter("searchCondition");
String keyword = request.getParameter("searchKeyword");

//2
List<NoticeVO> noList = null;
try {
   noList = noticeService.selectAll(condition, keyword);
} catch (SQLException e) {
   e.printStackTrace();
}

//공지전체 조회

//페이징처리
int currentPage = 1; //현재 페이지

//페이지번호를 클릭한 경우 처리
if (request.getParameter("currentPage") != null) {
   currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

//[1] 현재 페이지와 무관한 변수
int totalRecord = 0; //총 레코드 수
if (noList != null && !noList.isEmpty()) {
   totalRecord = noList.size(); //예) 17
}

int pageSize = 5; //한 페이지에 보여줄 레코드(행) 수
int totalPage = (int) Math.ceil((float) totalRecord / pageSize);
//=> 총 페이지수
int blockSize = 5; //한 블럭에 보여줄 페이지 수

//[2] 현재 페이지를 이용하는 변수
int firstPage = currentPage - ((currentPage - 1) % blockSize);
//=> 블럭 시작 페이지 [1],[11],[21]...
int lastPage = firstPage + (blockSize - 1); //블럭 마지막 페이지
//=> [10],[20],[30]...

//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
int curPos = (currentPage - 1) * pageSize;

//페이지당 글 리스트 시작 번호
int num = totalRecord - (curPos); //예) 17, 12, 7, 2

//브랜드 아이디로 브랜드 정보 구하기
try {
   brVo = brService.selectByAdminId(top_adid);
} catch (SQLException e) {
   e.printStackTrace();
}


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

if(keyword==null || !keyword.isEmpty()){
   keyword="";
}
%>


<!-- 메뉴 부분 -->
<div class="ftco-blocks-cover-1">
   <!-- 헤더 부분 높이 수정 (지안, 수빈) -->
   <div class="site-section-cover1 overlay"
      data-stellar-background-ratio="0.5" style="background-image: url('<%=request.getContextPath()%>/esc/images/topbanner1.jpg')">
      <div class="container">
         <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
               <span class="text-cursive h5 text-red" style="color: red">notice</span>
               <h1 class="mb-3 font-weight-bold text-teal">Notice</h1>
               <p>
                  <a href="<%=request.getContextPath()%>/esc/index.jsp"
                     class="text-white">Home</a> <span class="mx-3">/</span> <strong>notice</strong>
                  <span class="mx-3">/</span> <a
                     href="<%=request.getContextPath()%>/esc/view/faq.jsp"
                     class="text-white">FAQ</a>
               </p>
            </div>

         </div>
      </div>
   </div>
</div>

   <div class="site-section bg-info">
      <div class="container">
         <div class="row">
            <div class="col-md-1">
               <div class="package text-center bg-info"></div>
            </div>
            <div class="col-md-10">
               <div class="package text-center bg-white">
                  <span class="img-wrap"><img
                     src="../images/flaticon/svg/002-target.svg" alt="Image"
                     class="img-fluid"></span>
                  <div class="block-counter-1" style="width: 100%;">
                     <h1>공지사항</h1>
                     <!-- 공지사항 테이블 돌아가는 부분 시작 -->
                     <Br>
                     <table class="table table-striped-even mb-0"
                        style="border-collapse: collapse; border-radius: 1em; overflow: hidden;">
                        <colgroup>
                           <col style="width: 10%;" />
                           <col style="width: 20%;" />
                           <col style="width: 40%;" />
                           <col style="width: 20%;" />
                           <col style="width: 10%;" />

                        </colgroup>
                        <thead style="background: rgb(23, 162, 184)">
                           <tr style="text-align: center">
                              <th>No</th>
                              <th>Brand</th>
                              <th>Title</th>
                              <th>Registration</th>
                              <th>Hit</th>
                           </tr>
                        </thead>
                        <tbody style="text-align: center;">
                           <!-- 반복되는 부분 list -->
                           <%
                              if (noList == null || noList.isEmpty()) {
                           %>
                           <tr>
                              <td colspan="4" class="align_center">데이터가 존재하지 않습니다.</td>
                           </tr>
                           <%
                              } else {
                           %>
                           <%
                           for(int i=0; i<pageSize;i++){
       						if(num<1) break;
       						
	       						noticeVo = noList.get(curPos++);
	       						num--;
	       						
	       						String brandName=brService.selectBrandNameByBrandNo(noticeVo.getBrandNo());
                        
                           %>
                           <tr>
                              <td><%=noticeVo.getNoticeNo()%></td>
                              <td><%=brandName %>
                              <!-- 내용 볼수있게 하는거 아직 못만들었어요.-->
                              <td><a href="<%=request.getContextPath()%>/esc/ok/countUpdateOk.jsp?noticeNo=<%=noticeVo.getNoticeNo() %>"><%=noticeVo.getNoTitle()%></a></td>
                              <td><%=sdf.format(noticeVo.getNoRegdate())%></td>
                              <td><%=noticeVo.getNoHit()%></td>
                           </tr>
                           <%
                              }
                           }
                           %>


                        </tbody>
                     </table>
                     <!-- 반복 완료 -->
                     <br> <Br>

                     <!-- 페이지 처리 페이지 처리 VO가 없어서.. 어쩔수없이 ㅜㅜ 맨위에 전부 붙여둠.. ㅜㅜ  -->
                     <div class="block-counter-1 " style="margin-left: 30px;">
                        <ul class="pagination pagination-sm justify-content-center">

                           <!-- 시작 -->
                           <%
                              if (firstPage > 1) {
                           %>
                           <li class="page-item"><a class="page-link"
                              href="<%=request.getContextPath()%>/esc/view/notice.jsp?currentPage=<%=firstPage - 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">이전</a>
                           </li>
                           <%
                              } //if

                           //번호 도는 부분
                           for (int i = firstPage; i <= lastPage; i++) {
                           if (i > totalPage)
                              break;
                           if (i == currentPage) {
                           %>
                           <li><span style="color: blue; font-weight: bold">&nbsp;[<%=i%>] &nbsp;
                           </span></li>
                           <%
                              } else {
                           %>
                           <li class="page-item"><a class="page-link"
                              href="<%=request.getContextPath()%>/esc/view/notice.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
                                 <%=i%></a></li>
                           <%
                              } //if
                           } //for
                           %>

                           <!-- 다음 버튼 부분  -->
                           <%
                              if (lastPage < totalPage) {
                           %>
                           <li><a class="page-link"
                              href="<%=request.getContextPath()%>/esc/view/notice.jsp?currentPage=<%=lastPage + 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">다음</a></li>
                           <%
                              } //if
                           %>
                        </ul>
                     </div>



                     <!-- 검색 조건 시작 -->
                  
                  <!-- 검색 조건 보내기 위해 폼 걸어뒀습니다. 만약 안되면 검색조건쪽에 폼을 옮겨야 할듯 해요...  -->
                  <form action="<%=request.getContextPath()%>/esc/view/notice.jsp" name="noticefrm" action="post">
                     <div class="col-md-12">
                        <div class="text-center " style="padding: 20px;">
                           <div class="block-counter-1">
                              <select class="combo-control " name="searchCondition"
                                 style="height: 40px; text-align-last: center; color: rgb(23, 162, 184); width: 100px; border-radius: 10px; border-color: #fd4d40;">
                                 <option value="notitle" <%if ("notitle".equals(condition)) {%>
                                    selected="selected" <%}%>>제목</option>
                                 <option value="nocontent" <%if ("nocontent".equals(condition)) {%>
                                    selected="selected" <%}%>>내용</option>
                              </select>
                              <!-- 검색어 입력 부분 시작 아직 검색어 부분 손을 못대서 null이뜹니다. -->
                              <input type="text" name="searchKeyword" title="검색어 입력"
                                 value="<%=keyword%>"
                                 style="text-align: right; height: 40px; color: rgb(23, 162, 184); width: 300px; border-radius: 10px; border-color: #fd4d40;"
                                 placeholder="검색어를 입력해주세요">
                              <!-- form 전송되게끔 submit 걸어놨어요 ...  -->
                              <button type="submit">
                                 <img alt="검색" width=30px; style="margin-left: 10px;"
                                    src="<%=request.getContextPath()%>/esc/images/searchIcon_red.png">
                              </button>
                           </div>
                        </div>
                     </div>
                  </form>

                           <!-- 관리자 유효성 검사후 버튼 나타나게 하기  -->
                           <div class="col-md-12" style="padding: 10px">
                              <div class="text-center">
                                 <div class="block-counter-1" style="margin-left: 20px;">
                                    <%
                                       if (top_isLogin && top_flag.equals("2")) {
                                    %>
                                    <input type="button" class="btn btn-primary"
                                       value="Register" style="width: 130px;"
                                       onclick="goNoticeRegister(600,500,'<%=top_adid%>')"
                                       style="align-self: center;">
                                    <%
                                    }
                                    %>
                                    <input type="button" onclick="closeNotice()" value="Close"
                                       class="btn btn-primary" style="width: 130px;"
                                       style="align-self: center;">
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>


         </div>


<script type="text/javascript"> 
   function closeNotice(){  
       history.back();
   }  
   
   //관리자 로그인 시 등록창 활성화
     function goNoticeRegister(sw,sh,adId){
        cw=screen.availWidth; //화면 너비
        ch=screen.availHeight; //화면 높이

        ml=(cw-sw)/2;
        mt=(ch-sh)/2;

        window.open('<%=request.getContextPath()%>/esc/view/noticeWriteAdmin.jsp?adId='+adId, 'Notice', 'width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');

   }
</script>


<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>

