<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
	<!-- 	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
 	-->	
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10981ca2a9ffd2b10be44bd43781bbe6"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 표시할 div
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
			level: 3 //지도의 확대 레벨
		};

		var map = new kakao.maps.Map(container, options); //지도 생성
		
		//마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
		
		//마커생성
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		//마커가 지도위에 표시 되도록 생성
		marker.setMap(map);
	</script>
</body>
</html>