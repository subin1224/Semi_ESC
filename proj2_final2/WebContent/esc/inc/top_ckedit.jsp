<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	boolean top_isLogin=false;
	//탑에서의 userid = top_userid
	String top_userid = (String)session.getAttribute("userid");
	if(top_userid!=null && !top_userid.isEmpty()){
		top_isLogin=true;		//로그인 된 경우	
	}
%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title></title>
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
    <script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
	<script src="<%=request.getContextPath()%>/ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/ckeditor/samlpes/css/samples.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/esc/css/style.css">

  </head>

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
	  </div>
 
      <header class="site-navbar site-navbar-target" role="banner">

        <div class="container mb-3">
          <div class="d-flex align-items-center">
             <div class="site-logo m-auto">
               <a href="<%=request.getContextPath()%>/esc/index.jsp"><img src="<%=request.getContextPath()%>/esc/images/logo_howToEscape.png" width="60px" height="60px"><span class="text-primary"></span></a>
             </div>
            </div>
          </div>

        <div class="container">
          <div class="menu-wrap d-flex align-items-center">
            <span class="d-inline-block d-lg-none"><a href="#" class="text-black site-menu-toggle js-menu-toggle py-5"><span class="icon-menu h3 text-black"></span></a></span>

              <nav class="site-navigation text-left mr-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav mr-auto ">
                  <li id="menu-home"><a href="<%=request.getContextPath()%>/esc/index.jsp" class="nav-link">Home</a></li>
                  <li id="menu-find"><a href="<%=request.getContextPath()%>/esc/view/find.jsp" class="nav-link">Find</a></li>
                  <li id="menu-reserve"><a href="<%=request.getContextPath()%>/esc/view/reserve.jsp" class="nav-link">Reserve</a></li>
                  <li id="menu-board"><a href="<%=request.getContextPath()%>/esc/view/board.jsp" class="nav-link">Board</a></li>
                  <li id="menu-notice"><a href="<%=request.getContextPath()%>/esc/view/notice.jsp" class="nav-link">Notice</a></li>
                </ul>
              </nav>
              
 			 <nav class="site-navigation text-right mr-0 d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav mr-auto ">
                <%if(!top_isLogin){  //로그인이 안된 경우 %>              
	              <li class='active'><a href="<%=request.getContextPath()%>/esc/view/contact.jsp" class="nav-link">Login</a></li>
	              <li id="menu-join"><a href="<%=request.getContextPath()%>/esc/view/gallery.jsp" class="nav-link">Join</a></li>
				<%}else{ //로그인 된 경우 %>
	              <li id="menu-mypage"><a href="<%=request.getContextPath()%>/esc/view/gallery.jsp" class="nav-link">MyPage</a></li>
	              <li><a href="<%=request.getContextPath()%>/esc/view/gallery.jsp" class="nav-link">Logout</a></li>              
           		<%} %>
           		</ul>
             </nav>
 
          </div>
        </div>
      </header>
    </div>