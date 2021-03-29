<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../inc/top.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-find').addClass('active');			
	});
</script>

<!-- content -->
<%
	//http://localhost:9000/semi2/esc/view/find/unitDetail.jsp?unitNo=1
	//find.jsp에서 지점 이름 누를 경우 그 지점 번호를 가지고 이동(a태그 =>get)
%>
<!-- content end-->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>    