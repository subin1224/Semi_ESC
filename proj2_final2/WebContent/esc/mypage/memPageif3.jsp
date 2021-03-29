<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>memPage_Reservation</title>
</head>
<body>
	<div class="container m-auto">
		<h2><span style="font-family:'sans-serif'">▶내가 쓴 글 조회</span></h2>
		<!-- 내가 글 쓴 내역 테이블 전체조회 - 페이징처리 -->
		<table class="table table-striped m-auto">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:30%;" />
				<col style="width:30%;" />
				<col style="width:15%;" />
				<col style="width:10%;" />
			</colgroup>
			<thead>
			<tr style="text-align:center">
				<th>No</th>
				<th>테마</th>
				<th>제목</th>
				<th>등록일</th>
				<th>모집 상태</th>
			</tr>
			</thead>
			
			<tbody style="text-align:center;">
			<!-- 반복되는 부분 list -->
				<tr >
					<td>1</td>
					<td>Nerd</td>
					<td><a href="#">벌써새벽1시</a></td>
					<td>2020-12-23</td>
					<td><a>모집중</a></td>
				</tr>
				<tr >
					<td>2</td>
					<td>단잠</td>
					<td><a href="#">난 왜 이렇게 못하지..</a></td>
					<td>2020-12-20</td>
					<td><a>모집완료</a></td>
				</tr>
				
			<!-- 반복 완료 -->
			</tbody>
		</table>
		<br>
		<div class="block-counter-1 ">
			<ul class="pagination pagination-sm">
			    <li class="page-item"><a class="page-link" href="">이전</a></li>
			    <li class="page-item"><a class="page-link" href="">1</a></li>
			    <li class="page-item"><a class="page-link" href="">2</a></li>
			    <li class="page-item"><a class="page-link" href="">3</a></li>
			    <li><a class="page-link" href="">다음</a></li>
			</ul>
		</div>
	</div>
</body>
</html>