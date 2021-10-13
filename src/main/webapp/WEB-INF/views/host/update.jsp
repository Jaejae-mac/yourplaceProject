<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Yourplace_장소 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
<script
	src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css" />

<link
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js?ver=12"></script>
<!-- JQuery Lib -->
<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- 다음 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--부트스트랩 추가 -->

<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
<%-- 	<link rel="stylesheet"
	href="<c:url value="/resources/place/css/style-regist.css" />" /> --%>
<link rel="stylesheet"
	href="<c:url value="/resources/place/css/regist-style.css" />" />
<script src="<c:url value="/resources/place/js/regist.js" />"></script>
<script>
	history.scrollRestoration = "manual"
</script>
</head>
<body class="sb-nav-fixed">
<%@include file="hostnav.jsp" %>

	<div id="layoutSidenav_content">
		<main style="width: 70%; margin: 0 auto;">
			<h1 style="text-align: center;">장소 등록</h1>
			<!-- 전송 폼태그. -->
			<form method="POST" enctype="multipart/form-data"
				action="/regist/place/registPlace.hdo" id="regist_form">
				
		    <c:forEach var="update" items="${updatePlace}">
		    
				<h3>지역 </h3>
				<div class="choose-area">
					<input type="text" value="${update.placeLocation}"
						style="width: 100%; min-height: 40px;" name="placeLocation" readonly="readonly">
				</div>
				<hr>
				<h3>주소</h3>
			
					<input type="text" value="${update.placeAddress}"
						style="width: 100%; min-height: 40px;" name="placeAddress" readonly="readonly">
				<hr>
				<!--카테고리 등록.-->
				<h3>카테고리 등록하기</h3>
				<p>대분류</p>
				<div class="choose-category">
					<input type="text" value="${update.placeMainCategory}"
						style="width: 100%; min-height: 40px;" name="placeMainCate" readonly="readonly">
					<p>소분류</p>
	
							<input type="text" value="${update.placeCategory}"
						style="width: 100%; min-height: 40px;" name="placeSubCate" readonly="readonly">
				</div>
				<hr>
				<!--제목-->
				<h3>제목</h3>
				<div>
					<input type="text" style="width: 100%; min-height: 40px;font-size: 16px; 
										border:1px solid black; border-radius:10px;padding-left:10px;" 
					name="placeName"
						id="place_name" value="${update.placeName}">
				</div>
				<hr>
				<!--소개-->
				<h3>소개</h3>
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding: 7px">
						<p>회원님의 개인정보 보호를 위해 등록 및 수정 과정에서 개인정보 또는 연락처 입력 시, 자동으로 편집되며
							향후 서비스 이용에 제약이 있을 수 있습니다.</p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 300px; padding: 10px">
						<textarea name="placeIntro" id="place_intro" cols="10" rows="15"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;">${update.placeIntro}</textarea>
					</div>
				</div>
				
				<hr>
	
				<hr>
				<!--해당 층-->
				<h3>해당 층</h3>
				<div class="choose-floor">
					
			<input type="text" value="${update.placeFloor}"
						style="width: 100%; min-height: 40px;" name="placeFloor">
					
				</div>
				<hr>
				<h3>장소 이용 규칙</h3>
				<!--장소이용규칙-->
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding-left: 14px; line-height: 30px;">
						<p style="vertical-align: middle;"></p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 300px; padding: 10px">
						<textarea name="placeRule" id="place_rule" cols="10" rows="15"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;">${update.placeRule}</textarea>
					</div>
				</div>
				<hr>
				<h3>주변 정보</h3>
				<!--주변정보-->
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px;">
						<p>게스트에게 호스트님의 장소 주변 정보를 알려주세요. 교통, 식당, 주차, 숙박 등 주변 정보를 알려주면
							많은 도움이 됩니다.</p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 200px; padding: 10px">
						<textarea name="placeSubInfo" id="place_surinfo" cols="10"
							rows="13"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;"
							>${update.placeSubInfo}</textarea>
					</div>
				</div>
				<hr>
	<hr>
				<!-- 파일전송 시작. -->
				<div class="file">
					<h3>이미지 등록</h3>
					<p>사진은 최대 10장 등록 가능합니다.</p>
					<div class="file-name-div">
						<ul id="file-name" class="file-name"></ul>
					</div>
					<div class="form-group2" style="display: inline; width: 30px;">
						<label for="input-file" class="input-file-button">업로드</label> <input
							type="file" class="form-control-file" id="input-file"
							accept="image/*" multiple onchange="processSelectedFiles(this)"
							name="file" style="display: none;" />
					</div>
				</div>
				<hr>
				<!--시간당 대여 금액-->
				<h3>시간당 대여 금액</h3>
				<div clsaa="price-per-hour">
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding-left: 14px; line-height: 30px;">
						<p>유어플레이스의 시간당 금액은 호스트가 설정한 시간당 디여 금액과 게스트 수수료, PG 수수료,
							부가세(VAT)를 바탕으로 산정되어 설정하신 금액보다 높게 노출됩니다.</p>
					</div>
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
						<input type="text"
							style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
							value="${update.placePrice}" id="place_price"
							name="placePrice"> <b
							style="font-size: 15px; min-height: 40px;">원</b>
					</div>
				</div>
				<hr>
				<!--최소 대여 시간-->
				<!--placeMinTime-->
				<div>
					<h3>최소 대여 시간</h3>
					<div clsaa="price-minTime">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								value="${update.placeMinTime}" id="place_min_time"
								name="placeMinTime"> <b
								style="font-size: 15px; min-height: 40px;">시간</b>
						</div>
					</div>
				</div>
				<hr>
				<!--주차 가능 대수-->
				<!--placeCapaCar-->
				<div>
					<h3>주차 가능 대수</h3>
					<div clsaa="place-capacar">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								value="${update.placeCarNum}" id="place_capa_car"
								name="placeCapaCar"> <b
								style="font-size: 15px; min-height: 40px;">대</b>
						</div>
					</div>

				</div>
				<hr>
				<!--기본 인원-->
				<!--placeCapa-->
				<div>
					<h3>기본 인원</h3>
					<div clsaa="place-capa">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								value="${update.placePersonNum}" id="place_capa" name="placePersonNum">
							<b style="font-size: 15px; min-height: 40px;">명</b>
						</div>
					</div>

				</div>
				</c:forEach>
				<hr>

				
				
				<hr>
				<input type="button" class="btn btn-primary" id="submit-btn"
					value="장소 등록하기" style="width: 100%; height: 50px;">
				<div style="min-height: 100px;" onclick="func()"></div>
			</form>

		</main>
	</div>

</body>




<script>
function func(){
console.log($('input-file').val());
};
</script>
</html>
