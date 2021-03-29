<%@page import="com.proj.faq.model.FaqVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<jsp:useBean id="faqVo" class="com.proj.faq.model.FaqVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="faqVo"/>
<jsp:useBean id="faqService" class="com.proj.faq.model.FaqService" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  text-align: center;

  margin:5px;
}

faqAccordian.active, .accordion:hover {
  background-color: #ccc;
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
</style>
</head>
<body>
<%

	List<FaqVO> faqList = null;

	try{
		faqList = faqService.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}

	for(int i=0; i<faqList.size(); i++){
		faqVo = faqList.get(i);
		%>
		<button id="faqAccordian" class="accordion">#.<%=faqVo.getFaqNo()%> <b><%=faqVo.getQuestion() %></b></button>
		<div class="panel">
		  <p><%=faqVo.getAsk() %></p>
		</div>
		<%
	}


%>

	
	
	<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
	</script>

</body>
</html>
