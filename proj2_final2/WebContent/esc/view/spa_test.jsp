<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var toggle=false;
		jQuery("#btnOk").click(function(){
			if(!toggle){
				toggle=true;
				// 단일자료 처리
				jQuery.ajax({
					type:"post",
					url:"test",
					dataType: "json",
					success:function(data){
						/* var str="<table border='1'>";
						str+="<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>"
						jQuery(data.datas).each(function(index, obj){
							str+="<tr>";
							str+="<td>"+obj["code"]+"</td>";
							str+="<td>"+obj["sang"]+"</td>";
							str+="<td>"+obj["su"]+"</td>";
							str+="<td>"+obj["dan"]+"</td>";
							str+="</tr>";
						});
						str+="</table>";
						jQuery("#showData").append(str); */
						alert('test 성공';
					}, error:function(){
						jQuery("#showData").text("ERROR");
					}
				});
			} else{
				toggle=false;
				jQuery("#showData").empty();
			}
		});
		
	});
</script>
</head>
<body>
	<h1>json 읽기 연습</h1>
	<input type="button" value="MORE" id="btnOk"><br>
	<div id="showData"></div>
</body>
</html>
