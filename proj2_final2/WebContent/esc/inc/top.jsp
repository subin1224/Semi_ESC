<%@page import="com.proj.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	boolean top_isLogin=false;
	//탑에서의 userid = top_userid
	String top_userid = (String)session.getAttribute("userid");
	String top_adid = (String)session.getAttribute("adid");
	
	String top_flag = (String)session.getAttribute("flag");  //권한 : 회원이 1 , 관리자 2
		
	if((top_userid!=null && !top_userid.isEmpty()) || (top_adid!=null && !top_adid.isEmpty())){
		top_isLogin=true;		//로그인 된 경우
	}

%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>탈출어때</title>
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
                  <li id="menu-find"><a href="<%=request.getContextPath()%>/esc/view/find2.jsp" class="nav-link">Find</a></li>
                  <li id="menu-reserve"><a href="<%=request.getContextPath()%>/esc/view/reserve.jsp" class="nav-link">Reserve</a></li>
                
                 <!-- down_bak :: href 수정하셔야합니다  -->
<%--                   <li id="menu-board"><a href="<%=request.getContextPath()%>/esc/view/board.jsp" class="nav-link">Board</a></li>
 --%>                  	
				  <li id="menu-board" class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					     Board
					</a>                  	
                   	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  		<li><a class="dropdown-item" href="<%=request.getContextPath()%>/esc/view/review.jsp">Review</a></li>
                  		<li><a class="dropdown-item" href="<%=request.getContextPath()%>/esc/view/fellowShip.jsp">Find-Person</a></li>
                  	</ul>
                  </li>
      	      
<%--   bak                <li id="menu-more"><a href="<%=request.getContextPath()%>/esc/view/more.jsp" class="nav-link">More</a></li>
 --%>                
                <li id="menu-more" class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					     More
					</a>                  	
                   	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  		<li><a class="dropdown-item" href="<%=request.getContextPath()%>/esc/view/notice.jsp">Notice</a></li>
       					<li><a class="dropdown-item" href="<%=request.getContextPath()%>/esc/view/faq.jsp#faqInclude">FAQ</a></li>                  	</ul>
                  </li>
                
                </ul>
              </nav>
              
 			 <nav class="site-navigation text-right mr-0 d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav mr-auto ">
                <%if(!top_isLogin){  //로그인이 안된 경우 %>              
	              <li class='active'><a href="<%=request.getContextPath()%>/esc/login/login.jsp" class="nav-link">Login</a></li>
	              <li id="menu-join"><a href="<%=request.getContextPath()%>/esc/view/join.jsp" class="nav-link">Join</a></li>
				<%}else{ //로그인 된 경우 
					if(top_flag.equals("1")){ //회원%>
		              <li id="menu-mypage"><a href="<%=request.getContextPath()%>/esc/mypage/memPage.jsp" class="nav-link">MyPage</a></li>
		           <%}else if(top_flag.equals("2") && !top_adid.equals("admin")){ //브랜드 %>   
		              <li id="menu-mypage"><a href="<%=request.getContextPath()%>/esc/mypage/bmPage.jsp" class="nav-link">MyPage</a></li>	              
		           <%}else if(top_flag.equals("2") && top_adid.equals("admin")){ //통합관리자 %>
		              <li id="menu-mypage"><a href="<%=request.getContextPath()%>/esc/mypage/hmPage.jsp" class="nav-link">MyPage</a></li>
		           <%} //if %>
	              <li><a href="<%=request.getContextPath()%>/esc/login/logout.jsp" class="nav-link">Logout</a></li>              
           		<%}// %>
           		</ul>
             </nav>
 
          </div>
        </div>
      </header>
    </div>