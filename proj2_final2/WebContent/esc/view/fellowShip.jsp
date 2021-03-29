<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-board').addClass('active');			
		
		$('#fWrite').click(function(){
			location.href="<%=request.getContextPath()%>/esc/view/fellowWrite.jsp";
		});
	
	});
	
</script>
<!-- content -->
<div class="site-section" style="background: #ffc107;">
	<div class="container">
		<div class="row mb-5">
			<div class="col-12 text-center">
				<br>
				<br>
				<br>
				<br> <span class="text-cursive h5 text-red d-block">Latest
					Fellowship</span>
				<h2 class="text-white">가장 최근에 등록된 일행구하기</h2>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="testimonial-3-wrap" style="border-radius: 40px">

					<div class="owl-carousel nonloop-block-13">
						<div class="testimonial-3 d-flex">
							<div class="vcard-wrap mr-5">
								<img
									src="http://sevenclues.com/upload_file/thema/%EC%82%AC%EB%9D%BC%EC%A7%84%EB%B0%B1%EB%A7%88%EA%B5%90%EB%8F%84-%EC%9B%B9%EC%9A%A9.jpg"
									alt="Image" class="vcard img-fluid">
							</div>
							<div class="text-black">
								<h1>사라진 백마교도</h1>
								<h2 class="position">파멸의무위</h2>
								<p>[할인쿠폰]있으신 분들 같이 가요~</p>
							</div>
						</div>

						<div class="testimonial-3 d-flex">
							<div class="vcard-wrap mr-5">
								<img src="http://www.code-escape.com/file/theme/21_a.jpg"
									alt="Image" class="vcard img-fluid">
							</div>
							<div class="text-black">
								<h1>마피아게임</h1>
								<h2 class="position">냥이집사</h2>
								<p>"중절모 있으신 분만 참가 가능^^.</p>
							</div>
						</div>

						<div class="testimonial-3 d-flex">
							<div class="vcard-wrap mr-5">
								<img
									src="http://www.seoul-escape.com/static/image/rooms/p_404.jpg"
									alt="Image" class="vcard img-fluid">
							</div>
							<div class="text-black">
								<h1>404호 살인사건</h1>
								<h2 class="position">언년이</h2>
								<p>머니머니 해도 공포물은 학교괴담..어서오삼</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="site-section" style="background: #ffc107;"></div>

	<div class="site-section bg-light">
		<div class="block-counter-1 mb-5 mt-0" style="padding-top: 10px;">
			<label
				style="color: white; background: #16c3b0; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
				F &nbsp&nbsp E &nbsp&nbsp L &nbsp&nbsp L &nbsp&nbsp O &nbsp&nbsp W
				&nbsp&nbsp S &nbsp&nbsp H &nbsp&nbsp I &nbsp&nbsp P</label>
		</div>

		<!-- ㅇㅇㅇㅇㅇ -->
		<div class="block-counter-1 col-md-8"
			style="padding-left: 350px; width: 70%;">
			<table class="table table-striped-even mb-0"
				style="width: 135%; border-collapse: collapse; border-radius: 1em; overflow: hidden;">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 30%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 5%;" />
				</colgroup>
				<thead style="background: #ffc107;">
					<tr style="text-align: center">
						<th>No</th>
						<th>Brand</th>
						<th>Theme</th>
						<th>Title</th>
						<th>Write By</th>
						<th>Registration
						<th>Recruit</th>
						<th>Hit</th>
					</tr>
				</thead>

				<tbody style="text-align: center;">
					<!-- 반복되는 부분 list -->
					<tr>
						<td>790</td>
						<td>SEVEN CLUES</td>
						<td>사라진 백마교도</td>
						<td><a href="#">[할인쿠폰]있으신 분들 같이 가요~ </a></td>
						<td>파멸의무위</td>
						<td>2020-12-21</td>
						<td>모집중</td>
						<td>36</td>
					</tr>
					<tr>
						<td>789</td>
						<td>셜록홈즈</td>
						<td>마피아게임</td>
						<td><a href="#">"중절모 있으신 분만 참가 가능^^.</a></td>
						<td>냥이집사</td>
						<td>2020-12-21</td>
						<td>모집중</td>
						<td>21</td>
					</tr>

					<tr>
						<td>788</td>
						<td>미스터리룸 강남점</td>
						<td>404호 살인사건</td>
						<td><a href="#">머니머니 해도 공포물은 학교괴담..어서오삼</a></td>
						<td>언년이</td>
						<td>2020-12-21</td>
						<td>모집중</td>
						<td>10</td>
					</tr>
					<tr>
						<td>787</td>
						<td>비밀의화원</td>
						<td>학교의비밀</td>
						<td><a href="#">굉이 집사와 함께라면 올클리어 가능~/a></td>
						<td>굉이집사</td>
						<td>2020-12-21</td>
						<td>모집중</td>

						<td>15</td>
					</tr>
					<tr>
						<td>786</td>
						<td>체임버</td>
						<td>닥터츄</td>
						<td><a href="#">으스스한 수술실의 느낌 ..좋아하시는 분 손 </a></td>
						<td>배달의야식</td>
						<td>2020-12-21</td>
						<td>모집완료</td>
						<td>52</td>
					</tr>

					<tr>
						<td>785</td>
						<td>마스터키 강남점</td>
						<td>팬텀</td>
						<td><a href="#">스릴 넘치는 공포물 같이 정주행 하실분~~</a></td>
						<td>난야행성</td>
						<td>2020-12-20</td>
						<td>모집중</td>
						<td>3</td>
					</tr>

					<tr>
						<td>784</td>
						<td>코드이스케이프</td>
						<td>JAZZ IN THE RAIN</td>
						<td><a href="#">[게릴라 이벤트] 오늘 예약하면 20%할인한데요</a></td>
						<td>궁예의후예</td>
						<td>2020-12-19</td>
						<td>모집완료</td>
						<td>46</td>
					</tr>

					<tr>
						<td>783</td>
						<td>SEVEN CLUES</td>
						<td>사라진 백마교도</td>
						<td><a href="#">[할인쿠폰]있으신 분들 같이 가요~ </a></td>
						<td>파멸의무위</td>
						<td>2020-12-19</td>
						<td>모집완료</td>
						<td>36</td>
					</tr>
					<tr>
						<td>782</td>
						<td>트루이스케이프</td>
						<td>광복절특사</td>
						<td><a href="#">버스운전 잘합니다...어여 모이셈</a></td>
						<td>프로야식러</td>
						<td>2020-12-19</td>
						<td>모집완료</td>
						<td>52</td>
					</tr>

					<tr>
						<td>781</td>
						<td>GAME OF MINDS</td>
						<td>생명의서</td>
						<td><a href="#">다빈치는 평생 동안 연구하여 알아낸 만물의 진리를 ‘생명의 서’에
								기록했다. 이 책을..</a></td>
						<td>트루러브</td>
						<td>2020-12-19</td>
						<td>모집완료</td>
						<td>89</td>
					</tr>
					<!-- 반복 완료 -->
				</tbody>
			</table>
		</div>
		<div class="block-counter-1" style="padding-top: 10px">
			<a href="#"><img src="../images/first.JPG" alt="이전블럭으로 이동"></a>
			<span style="font-weight: bold">&nbsp 1 &nbsp</span> <span><a
				href="#">[2]</a></span> <span><a href="#">[3]</a></span> <span><a
				href="#">[4]</a></span> <span><a href="#">[5]</a></span> <span><a
				href="#">[6]</a></span> <span><a href="#">[7]</a></span> <span><a
				href="#">[8]</a></span> <span><a href="#">[9]</a></span> <span><a
				href="#">[10]</a></span> <a href="#"><img src="../images/last.JPG"
				alt="다음블럭으로 이동"></a>
		</div>
		<br>
		<div class="block-counter-1" style="padding-top: 10px;">
			검 색 : <select class="combo-control "
				style="color: rgb(23, 162, 184); width: 70px; border-radius: 10px; border-color: #fd4d40;">
				<option>선택</option>
				<option>테 마</option>
				<option>작성자</option>
				<option>내 용</option>
			</select> <input type="text"
				style="color: rgb(23, 162, 184); width: 200px; border-radius: 10px; border-color: #fd4d40;"
				value="검색어를 입력하세요"> <a href="#" alt="검색"><img
				src="../images/searchIcon_red.png" style="width: 30px"></a>
		</div>
		<br>
		<div class="block-counter-1" style="padding-top: 10px">
			<input type="button" value="Write" class="btn btn-primary"
				id="fWrite" style="align-self: center;">
		</div>
	</div>
</div>


<br>

<!-- content end-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
