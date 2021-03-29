<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<jsp:useBean id="brVo" class="com.proj.brand.model.BrandVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="brVo"/>
<jsp:useBean id="brService" class="com.proj.brand.model.BrandService" scope="session"></jsp:useBean>

<!-- 통합매니저 아이디 받아와야합니돠~~ -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
<%-- function openPopPop(sw,sh,brandNo){
   cw=screen.availWidth; //화면 너비
   ch=screen.availHeight; //화면 높이

   ml=(cw-sw)/2;
   mt=(ch-sh)/2;

   test=window.open('<%=request.getContextPath()%>/esc/view/noticeWriteAdmin.jsp?brandNo='+brandNo,'brand','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
} --%>

</script>
<!-- content -->

<%

   
   //1   
   request.setCharacterEncoding("utf-8");
   

   List<BrandVO> brList = null;

   try{
   brList = brService.selectByAll();
   }catch(SQLException e){
      e.printStackTrace();
   }
   

%>

<div class="container m-auto" style="width: 1100px; height:700px;">
   <div
      style="width: 100%; font-size: 40px; font-weight: bold; text-align: center; height: 100px; padding-top: 10px;">
      <span>브랜드 조회</span>
   </div>

   <div style="overflow: auto; width: 1100px; height:500px;">
   <table class="table table-striped m-auto"
      style="width: 100%; border-collapse: collapse; border-radius: 1em;  " >

      <colgroup>
         <col style="width: 20%;" />
         <col style="width: 50%;" />
         <col style="width: 20%;" />
         <col style="width: 10%;"/>

      </colgroup>
      <thead>
         <tr style="text-align: center">
            <th>번호</th>
            <th>브랜드 명</th>
            <th>아이디</th>
            <th>승인여부</th>
         </tr>
      </thead>

      <tbody style="text-align: center;">
         <!-- 반복되는 부분 list -->
         
         
         <%
         for(int i=0; i<brList.size(); i++){
            if(brList.size()==0){
               %>
               <tr>
                  <td colspan="4"> 등록된 브랜드가 없습니다 </td>
               </tr>
               <%
            }else{
               brVo = brList.get(i);
               %>
               <tr>
                  <td><%=brVo.getBrandNo() %></td>
                  <td><%-- <a href="javascript:openPopPop(500,600,'<%=brVo.getBrandNo()%>')"> --%><%=brVo.getBrandName() %></td>
                  <td><%=brVo.getAdId() %></td>
                  <td><%=brVo.getAdFlag() %></td>               
               </tr>
               <%
               
            }
         }
         %>

      </tbody>
   </table>
   </div>
   <br>
</div>

   <%-- <form name="frmSearch" method="post" action='list.jsp'>
      <div style="text-align: center; margin-top:28px;">
         <div>
         <select name="searchCondition" class="form-select" style="height:45px; text-align-last: center; "aria-label="Default select example">
              <option value="brandName" 
              <%if("brandName".equals(condition)){ %>
                  selected="selected"
               <%} %>>브랜드 명</option>
              <option value="adminId" 
              <%if("adminId".equals(condition)){ %>
                     selected="selected"
               <%} %>>관리자 아이디</option>
         </select>
         <input type="text" name="searchKeyword" style="height:45px; width:250px; margin-left:10px;" value="<%=keyword%>">
         <button id="noticeWrite" class="btn btn-danger btn-custom-1"
            style="width: 100px; height:40px;margin-left:10px; font-size:17px;">검색</button>
         </div>
      </div>
   </form>
   <br>
    </div>
 --%>

 <!-- content end-->   
