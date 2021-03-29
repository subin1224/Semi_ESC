<%@page import="java.sql.SQLException"%>
<%@page import="com.proj.brand.model.BrandVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<!-- 브랜드 아이디 받아와야합니돠~~ -->
<jsp:useBean id="brandService" class="com.proj.brand.model.BrandService"
	scope="session"></jsp:useBean>  
<%
	String adid = (String)session.getAttribute("adid");
	
	BrandVO vo=null;
	try{
		vo=brandService.selectByAdminId(adid);
	}catch(SQLException e){
		e.printStackTrace();
	}

%>   
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>
<!-- content -->
    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover1 overlay" data-stellar-background-ratio="0.5" >
        <div class="container">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Brand Manager Page</span>
              <h1 class="mb-3 font-weight-bold text-teal">Brand Name Edit</h1>
              <p><a href="<%=request.getContextPath()%>/esc/index.jsp" class="text-white">Home</a> <span class="mx-3">/</span> 
              <strong>Brnad Name Edit</strong>            
              </p>
            </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section bg-light" id="contact-section">
      <div class="container">
      
        <div class="row justify-content-center">
          <div class="col-lg-8 mb-5" >
            <form name="memJoinFrm" method="post" action="<%=request.getContextPath()%>/esc/ok/bmEditOk.jsp" >
             <input type="hidden" name="brandNo" value="<%=vo.getBrandNo()%>">
            <div class="form-group row">
                    <div class="col-md-12">
                      <span>브랜드명</span>					<!-- value= 에 해당 브랜드의 이름 넣기 -->
                      <input type="text" class="form-control" id="brandName" name="brandName" value="<%=vo.getBrandName() %>" autofocus>
                    </div>
            </div>            
            <br> 
             <div class="form-group row">
                   <div class="col-md-6 m-auto mt-5">
                        <input type="submit" class="btn btn-block btn-info text-white py-3 px-5" value="Edit">   
                   </div>           
             </div>                         
            </form>
            
              
          </div>
          

        </div>
      </div>
    </div>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


