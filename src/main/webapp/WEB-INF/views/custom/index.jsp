<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/card.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/sample.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/banner.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/mainHome.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/bodyfont.css" />" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<title>YourPlace Home</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- 패스워드 재설정 이메일을 보내면 홈으로 이동된다. -->
	<!-- 홈으로 이동 후 메일이 전송되었다고 사용자에게 알리는 부분이 되겠다. -->
	<c:if test="${sendEmail == '1' }">
		<script>
			swal('', '이메일을 전송했습니다\n메일을 확인해주세요.', "success");
		</script>
	</c:if>
	<c:if test="${sendEmail == '2' }">
		<script>
			swal('', '비밀번호 변경을 완료했습니다.', "success");
		</script>
	</c:if>
	<c:if test="${noAccess == '1' }">
		<script>
			swal('', '유효하지 않은 페이지입니다.\n비밀번호 찾기를 다시 진행해주세요.', "success");
		</script>
	</c:if>

	<!--배너 스크립트-->
	<script>
		let banner = {
			rollId : null,
			interval : 2000,

			//롤링 배너 초기화
			rollInit : function(newinterval) {
				if (parseInt(newinterval) > 0) {
					this.interval = newinterval;
				}
				//현재 배너
				let firstitem = document.querySelector('.rollimgs li');
				if (firstitem) {
					firstitem.classList.add('currentroll');
				}
				//다음 배너
				let seconditem = document.querySelectorAll('.rollimgs li')[1];
				if (seconditem) {
					seconditem.classList.add('nextroll');
				}
				//이전 배너
				document.querySelector('.rollimgs li:last-child').classList
						.add('prevroll');
				this.rollId = setInterval(this.rollNext, this.interval);//롤링 인터벌 호출
			},

			//다음 배너 롤링
			rollNext : function() {
				if (document.querySelector('.prevroll')) {
					document.querySelector('.prevroll').classList
							.remove('prevroll');
				}
				if (document.querySelector('.currentroll')) {
					document.querySelector('.currentroll').classList
							.add('prevroll');
					document.querySelector('.currentroll').classList
							.remove('currentroll');
				}
				if (document.querySelector('.nextroll')) {
					document.querySelector('.nextroll').classList
							.add('currentroll');
					document.querySelector('.nextroll').classList
							.remove('nextroll');
				}
				//다음 이미지 있으면 다음 롤링 이미지로 선택, 없으면 첫번째 이미지를 롤링 이미지로 지정
				if (document.querySelector('.currentroll').nextElementSibling) {
					document.querySelector('.currentroll').nextElementSibling.classList
							.add('nextroll');
				} else {
					document.querySelector('.rollimgs li').classList
							.add('nextroll');
				}
			}
		}
		document.addEventListener('DOMContentLoaded', function() {
			banner.rollInit(4000); // 배너 롤링
		});
	</script>

	<!-- Banner -->
	<!--슬라이드 배너 테스트-->
	<div id="banner" style="position: relative; top: 100px;">
		<div
			style="position: relative; width: 1280px; height: 100%; left: -220px; margin: auto;">
			<div class="wrap_center">
				<div class="container h_column_center">
					<div class="img_wrap">
						<ul class="rollimgs">
						<!-- a href="#" : 이미지 클릭시 url mapping-->
						<!-- for each 문 시작 -->
						<c:forEach var="ban" items="${banner}">
							<li>
								<a href="${ban.bannerUrl }">
								<c:if test="${ban.bannerShow eq '1'}"><img src="https://s3.ap-northeast-2.amazonaws.com/yourplacebuc/${ban.s3FileName }" /></c:if>
							</a>
							</li>
						</c:forEach>
						<!-- for each 문 완료 -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 모든 카테고리-->
	<!-- Main body 시작 -->
	<!--메인 바디 카드 레이아웃-->
	<div class="main_card" style="position: relative; top: 100px; margin-bottom:40px">
		<div
			style="flex-direction: row; display: flex; justify-content: center; position: relative;">
			<div
				style="display: flex; flex-flow: row wrap; min-width: 1160px; max-width: 1160px;">
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">

					<div onclick="click_category(0,0)"
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<!--URL Mapping-->
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>
						<!-- 가정집-->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 1);window.location.href='/category/1';"-->
						<p>가정집</p>

						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(0,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_1_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">

						<div onclick="click_category(0,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>아파트</p>
						</div>
						<div onclick=" click_category(0,3)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>주택</p>
						</div>
						<div onclick=" click_category(0,4)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>빌라</p>
						</div>
						<div onclick=" click_category(0,5)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>원룸</p>
						</div>
						<div onclick=" click_category(0,6)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>한옥</p>
						</div>
						<div onclick=" click_category(0,7)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>홈오피스</p>
						</div>
					</div>
				</div>
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">
					<div onclick=" click_category(1,0)"
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>
						<!-- 스튜디오 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 1);window.location.href='/category/2';"-->
						<p>스튜디오</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick=" click_category(1,1)"
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_2_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">

						<div onclick="click_category(1,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>자연광</p>
						</div>
						<div onclick="click_category(1,3) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>호리존</p>
						</div>
						<div onclick=" click_category(1,4)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>유튜브</p>
						</div>
						<div onclick="click_category(1,5) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>단독주택형</p>
						</div>
						<div onclick=" click_category(1,6)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>빈티지</p>
						</div>
						<div onclick=" click_category(1,7)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>키친</p>
						</div>
						<div onclick=" click_category(1,8)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>무대형</p>
						</div>
						<div onclick=" click_category(1,9)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>세트장</p>
						</div>
						<div onclick=" click_category(1,10)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>무인</p>
						</div>
						<div onclick=" click_category(1,11)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>녹음실</p>
						</div>
						<div onclick=" click_category(1,12)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>연습실</p>
						</div>
						<div onclick=" click_category(1,13)"
							class="h_center h_hover_button right_side_button button_font_style">
							<p>파티룸</p>
						</div>
					</div>
				</div>
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">
					<div onclick="click_category(2,0) "
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>
						<!-- 상업 공간 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 5);window.location.href='/category/3';"-->
						<p>상업 공간</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(2,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_3_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">
						<div onclick=" click_category(2,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>카페</p>
						</div>
						<div onclick="click_category(2,3)  "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>식당</p>
						</div>
						<div onclick=" click_category(2,4) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>바/술집</p>
						</div>
						<div onclick="click_category(2,5)  "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>헬스장</p>
						</div>
						<div onclick="click_category(2,6)  "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>요가/필라테스</p>
						</div>
					</div>
				</div>
				<div style="margin-top: 60px; width: 274px;">
					<div onclick="click_category(3,0)"
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>
						<!-- 편의 시설 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 4);window.location.href='/category/4';"-->
						<p>편의 시설</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(3,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_4_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">
						<div onclick="click_category(3,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>편의점</p>
						</div>
						<div onclick="click_category(3,3) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>빨래방</p>
						</div>
						<div onclick="click_category(3,4) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>헤어샵</p>
						</div>
						<div onclick="click_category(3,5) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>PC방</p>
						</div>
						<div onclick="click_category(3,6) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>노래방</p>
						</div>
						<div onclick="click_category(3,7) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>오락실</p>
						</div>
						<div onclick="click_category(3,8) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>스포츠</p>
						</div>
					</div>
				</div>
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">
					<div onclick="click_category(4,0) "
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>
						<!-- 문화 공간 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 3);window.location.href='/category/5';"-->
						<p>문화 공간</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(4,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_5_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">

						<div onclick="click_category(4,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>복합문화공간</p>
						</div>
						<div onclick="click_category(4,3) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>갤러리</p>
						</div>
						<div onclick="click_category(4,4) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>공방/작업실</p>
						</div>
						<div onclick="click_category(4,5) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>책방</p>
						</div>
						<div onclick="click_category(4,6) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>공연장</p>
						</div>
						<div onclick="click_category(4,7) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>강당</p>
						</div>
						<div onclick="click_category(4,8) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>강의실</p>
						</div>
					</div>
				</div>
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">
					<div onclick="click_category(5,0) "
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>

						<!-- 특수 공간 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 6);window.location.href='/category/6';"-->

						<p>특수 공간</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(5,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_6_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">

						<div onclick=" click_category(5,2)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>사무실</p>
						</div>
						<div onclick="click_category(5,3) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>병원/약국</p>
						</div>
						<div onclick="click_category(5,4) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>학교</p>
						</div>
						<div onclick="click_category(5,5) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>학원</p>
						</div>
						<div onclick=" click_category(5,6)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>클럽</p>
						</div>
						<div onclick="click_category(5,7) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>웨딩</p>
						</div>
						<div onclick="click_category(5,8) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>호텔펜션</p>
						</div>

					</div>
				</div>
				<div style="margin-top: 60px; width: 274px; margin-right: 21px;">
					<div onclick="click_category(6,0) "
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>

						<!-- 대형 공간 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 6);window.location.href='/category/7';"-->

						<p>대형 공간</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(6,1)"
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_7_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">
						<div onclick="click_category(6,2) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>공장</p>
						</div>
						<div onclick="click_category(6,3) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>창고</p>
						</div>
						<div onclick=" click_category(6,4)"
							class="h_center h_hover_button left_side_button button_font_style">
							<p>지하실</p>
						</div>
						<div onclick="click_category(6,5) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>빈 공간</p>
						</div>


					</div>
				</div>


				<div style="margin-top: 60px; width: 274px;">
					<div onclick="click_category(6,0) "
						class="h_row_center h_pc_category_header"
						style="height: 40px; width: 100%;">
						<div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;">
						</div>

						<!-- 야외 -->
						<!--온 클릭 이벤트 OnClick Event-->
						<!--ex)onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 7);window.location.href='/category/8';"-->

						<p>야외</p>
						<img
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							class="h_pc_category_header_chevron"
							style="width: 20px; height: 20px;">
					</div>
					<div onclick="click_category(6,1) "
						style="margin-top: 10px; height: 150px; border-radius: 4px; overflow: hidden; cursor: pointer;">
						<img src="<c:url value="/resources/custom/image/main_8_v3.jpg" />"
							style="width: 100%; height: 100%; object-fit: cover;">
					</div>
					<div style="display: flex; flex-flow: row wrap;">
						<div onclick="click_category(6,6) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>옥상</p>
						</div>
						<div onclick="click_category(6,7) "
							class="h_center h_hover_button right_side_button button_font_style">
							<p>정원</p>
						</div>
						<div onclick="click_category(6,8) "
							class="h_center h_hover_button left_side_button button_font_style">
							<p>캠핑장</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--메인 바디 카드 레이아웃 끝-->

	<!--card_footer_button 시작-->
	<!--onclick 이벤트가 동작안함-->
	<div class="card_footer_button" style="position: relative; top: 100px;">
		<div
			style="flex-direction: row; display: flex; justify-content: center;">
			<div style="position: relative; width: 1160px; margin-top: 40px;">

				<div class="h_column_center" style="width: 100%;">
					<!-- 모든 장소 보기 url-->
					<!--ex) onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'all');window.location.href='/category';"-->
					<div
						onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'all');window.location.href='/category';"
						class="h_center h_hover_button"
						style="width: 280px; height: 56px; border-radius: 8px; background-color: rgb(245, 249, 255); cursor: pointer;">
						<div class="h_row_center show_all_category" onclick="location.href='/category.do?maincate=&subcate='">
							<p>아워플레이스 모든 장소 보기</p>
							<img
								src="<c:url value="/resources/custom/icon/before_blue.svg" />"
								style="margin: 0px 8px; width: 20px; height: 20px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!--신규 등록 추천 장소 시작-->

	<div
		style="flex-direction: row; display: flex; justify-content: center; background-color: rgb(250, 251, 251);">
		<div style="margin-top: 80px; margin-bottom: 80px; width: 1176px;">
			<div class="h_row_center">
				<!--onclick="" 신규 등록 장소 목록-->
				<div onclick=" " style="padding-left: 10px; cursor: pointer;">
					<div class="h_row_center new_reco_m_title"
						style="padding: 0px 0px 0px 0px;">

						<p>신규등록 장소 추천</p>
					</div>
					<div class="h_row_center new_reco_s_title"
						style="margin-top: -32px;">
						<p>맞춤 추천 더보기</p>

					</div>
				</div>
			</div>

			<div class="total_card_layout">
				<!--신규등록 장소 추천 반복 시작. -->
				<c:forEach var="latestPlace" items="${latestPlaces }"
					varStatus="status">
					<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
						<input type="hidden" id="place_num" name="place_num"
							value="${latestPlace.placeNum}" /> <input type="hidden"
							id="user_id" name="user_id" value="${latestPlace.userId }" />

						<div class="card">
							<div class="card_header"
								onclick="gotoDetail('#place_num${status.index }')">

								<img src="${latestPlace.placeThumb}" alt="이미지 넣는 곳" />
								<!-- 데이터 베이스의 해당 image 가져오기-->
							</div>
							<div class="card_body"
								onclick="gotoDetail('#place_num${status.index }')">
								<div class="card_body_header">
									<p>
										${latestPlace.placeCate } · ${latestPlace.placeArea }
										<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
									</p>
									<div class="card_body_header_right">
										<div>
											<img
												src="<c:url value="/resources/custom/icon/person.png" />">
											<p>
												${latestPlace.placeCapa}
												<!-- {{ place.people }} -->
											</p>
										</div>
										<div>
											<img
												src="<c:url value="/resources/custom/icon/parking.png" />">
											<p>
												${latestPlace.placeCapaCar }
												<!-- {{ place.parking }} -->
											</p>
										</div>
									</div>
								</div>
								<div class="card_body_title">
									${latestPlace.placeName }
									<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
								</div>
							</div>
							<div id="line"></div>
							<div class="card_body_footer">
								<img
									src="<c:url value="/resources/custom/icon/gold_star.png" />">
								<p class="card_body_footer_star">
									${latestPlace.avgRate }
									<!-- {{ place.feedback_rating }} -->
								</p>
								<p class="card_body_footer_review">
									리뷰 ${latestPlace.reviewCnt }
									<!-- 리뷰 {{ place.feedback_count }} -->
								</p>
								<p class="card_body_footer_price">
									${latestPlace.placePrice }원
									<!-- {{ place.price_guest }}원 -->
								</p>
								<c:choose>
									<c:when test="${latestPlace.bookmark eq false}">
										<img class=“card_body_footer_booking”
											src="<c:url value="/resources/custom/icon/bookmark_g.png"/>"
											style="width: 24px; height: 24px; margin-left: auto; text-align: center;"
											id="bookmark_img${latestPlace.placeNum }"
											onclick="yourplaceBookmark(${latestPlace.placeNum},'bookmark_img${latestPlace.placeNum }')" />
									</c:when>
									<c:otherwise>
										<img class=“card_body_footer_booking”
											src="<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>"
											style="width: 24px; height: 24px; margin-left: auto; text-align: center;"
											id="bookmark_img${latestPlace.placeNum }"
											onclick="yourplaceBookmark(${latestPlace.placeNum},'bookmark_img${latestPlace.placeNum }')" />
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<input type="hidden" id="place_num${status.index }"
						value="${latestPlace.placeNum} " />
				</c:forEach>
			</div>
			<!--total_card_layout END-->
		</div>
	</div>
	<!--신규 등록 장소 추천 끝 -->


	<!--이 주의 추천 장소 시작-->
	<div
		style="flex-direction: row; display: flex; justify-content: center; background-color: rgb(250, 251, 251);">
		<div style="margin-top: 80px; margin-bottom: 80px; width: 1176px;">
			<div class="h_row_center rating_reco_m_title"
				style="position: relative;">

				<!--onclick event 이주의 인기 장소 리스트로 -->
				<div onclick=" " style="padding-left: 10px; cursor: pointer;">
					<p>이 주의 인기 장소</p>
					<div class="h_row_center rating_reco_s_title"
						style="margin-top: -32px;">
						<p>인기 장소 더보기</p>
					</div>
				</div>
				<div class="h_row_center" style="position: absolute; right: 12px;">
					<div class="h_center"
						style="width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px; margin-right: 10px; cursor: pointer;">
						<!-- onclick event 이전페이지로-->
						<img onclick=" "
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							style="width: 16px; height: 16px;">
					</div>
					<div class="h_center"
						style="width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px; cursor: pointer;">
						<!-- onclick event 다음페이지로-->
						<img onclick=" "
							src="<c:url value="/resources/custom/icon/chevron_right_b.svg" />"
							style="width: 16px; height: 16px; transform: rotate(180deg);">
					</div>
				</div>
			</div>


			<div class="total_card_layout">
				<!-- 1번 추천 카드 레이아웃 -->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-1.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									주택 · 인천
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											4
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											2
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								작은 수영장과 중정이 있는 내추럴 무드의 단독주택 "떼까사"
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 12
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								64,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 2번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-2.jpg" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									주택 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											7
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											3
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								마루비 성산 - 80년대 주택을 개조한 빈티지 스튜디오 1F
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 195
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								111,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 3번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-3.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									빈티지 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											3
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											1
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								스튜디오 보리네
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								4.9
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 46
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								50,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>


				<!-- 4번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-4.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									빌라 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											2
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											1
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								오래된 원목 빌라 분위기있는 집
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 154
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								38,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 5번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-5.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									호리존 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											3
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											0
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								스튜디오 칠(studio chill)
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 154
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								11,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 6번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-6.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									주택 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											2
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											0
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								[녹사평] 비키홈스튜디오
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 25
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								68,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 7번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img
								src="<c:url value="/resources/custom/image/recommand/recommand-7.jfif" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									주택 · 인천
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											4
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											3
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								우드로 꾸민 프라이빗 공간, 햇살 머리금 주택, 혜담헌
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								5.0
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 44
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								65,000원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>

				<!-- 8번 추천 카드 레이아웃-->
				<div class="card_layout" style="padding: 0px 7.5px 0px 0px;">
					<div class="card">
						<div class="card_header">
							<img src="<c:url value="/resources/custom/image/신규4.jpg" />"
								alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body">
							<div class="card_body_header">
								<p>
									빈티지 · 서울
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											5
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img
											src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											1
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								[강남/선릉] 1980년대 쿄토 여작가 J의 낡은 작업실(쇼와 레트로)
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								4.7
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 36
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								34,900원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking"
								src="<c:url value="/resources/custom/icon/bookmark_g.png" />">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>


			</div>
			<!--total_card_layout END-->
		</div>
	</div>
	<!--이 주의 추천 장소 끝-->



	<!--footer-->

	<!-- script 시작 -->
	<script>
		var message_id = ''

		function toggle_h_noti() {
			if ($('.h_noti').css('display') === 'none') {
				h_show_popup('.h_noti')
				// $('.h_noti').show()
				close_search_container()
				close_category_all()
			} else {
				h_hide_popup('h_noti')
				// $('.h_noti').hide()
			}
		}
	</script>
	<!-- script 끝 -->
	<%@ include file="footer.jsp"%>
</body>
<script>
    $(".card_layout").click(function(event){
        console.log($(this).children("input[name='place_num']").val());
        console.log($(this).children("input[name='user_id']").val());
    });
	function interest(){
		console.log("img click");
	}
</script>
<script>
function gotoDetail(e){
	location.href="/detailPlaceForm.do?placeNum="+$(e).val();
}
</script>
<script>
    function yourplaceBookmark(placeNum,imgId){
    	console.log("bookmark Clicked");
    	console.log(imgId);
    	var sessionUser ="${userVO.userId}"; 
    	if(!sessionUser){
    		swal("","로그인 후 관심장소 등록이 가능합니다.","warning");
    	}else{
    		$.ajax({
                type:"GET",
                url: "/bookmark.do?userId="+sessionUser+"&placeNum="+placeNum,
                async:false,
                contentType: "application/json",
                success:function(data){
                	if(data === 'addBookmark'){
                		console.log("bookmark!!!");
                		$("#"+imgId).attr("src",'<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>');
                	}else{
                		$("#"+imgId).attr("src",'<c:url value="/resources/custom/icon/bookmark_g.png"/>');
                	}
                }
    		});	
    	}
    	
    }
</script>
</html>