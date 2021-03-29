<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.notice.model.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   <jsp:useBean id="noticeVo" class="com.proj.notice.model.NoticeVO"
   scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVo" />
<jsp:useBean id="noticeService"
 class="com.proj.notice.model.NoticeService" scope="session"></jsp:useBean>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
   
<%
      String top_adid = (String)session.getAttribute("adid");
   
      
%>

   
<script type="text/javascript">
   $(function(){
      $('#menu-find').addClass('active');         

   });
   
   /* function openPop(){
      window.open("noticeWrite.jsp","Notice", "width=800, height=600, scrollbars=0, toolbar=0, menubar=no");
   } */
   
//관리자 로그인 시 등록창 활성화
     function openPopPop(sw,sh,adId){
        cw=screen.availWidth; //화면 너비
        ch=screen.availHeight; //화면 높이

        ml=(cw-sw)/2;
        mt=(ch-sh)/2;

        window.open('<%=request.getContextPath()%>/esc/view/noticeWriteAdmin.jsp?adId='+adId,'Notice','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
     
    }

</script>

<%

SimpleDateFormat sdfif3 = new SimpleDateFormat("yyyy-MM-dd");

   
   //2
   List<NoticeVO> noList = null;
   try {
      noList = noticeService.selectAll();
   } catch (SQLException e) {
      e.printStackTrace();
   }
   

%>
<div class="container m-auto" style="width: 1100px;">
   <div
      style="width: 100%; font-size: 40px; font-weight: bold; text-align: center; height: 100px; padding-top: 10px;">
      <span>공지사항</span>
   </div>

   <div style="overflow: auto; width: 1100px; height:500px;">
      <table class="table table-striped-even mb-0" style="border-collapse: collapse;  border-radius: 1em;  overflow: hidden;">
				  <colgroup>
                  <col style="width: 30%;" />
                  <col style="width: 40%;" />
                  <col style="width: 30%;" />
                  </colgroup>
                  <thead style="background: rgb(23,162,184)">
                     <tr style="text-align: center">
                        <th>No</th>
                        <th>Title</th>
                        <th>Registration</th>
                     </tr>
                  </thead>
                  <tbody style="text-align: center;">
                  <%
                     for(int i=0; i<noList.size();i++){
                        noticeVo = noList.get(i);
                        %>
                        <tr>
                           <td><%=noticeVo.getNoticeNo() %></td>
                           <td><a href="<%=request.getContextPath()%>/esc/view/notice.jsp"><%=noticeVo.getNoTitle() %></a></td>
                           <td><%=sdfif3.format(noticeVo.getNoRegdate()) %></td>
                        </tr>
                        <%
                     }
                  %>
                  
               
                  </tbody>
               </table>
   <br>
   </div>
   <br>
   <div class="row justify-content-center" >
      <button id="noticeWrite" class="btn btn-danger btn-custom-1"
         style="width: 150px;" onclick="openPopPop(600,500,'<%=top_adid%>')" >등록</button>
   </div>
   <br>
</div>
</body>
</html>