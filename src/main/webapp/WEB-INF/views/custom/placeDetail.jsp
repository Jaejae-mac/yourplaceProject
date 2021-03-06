<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="<c:url value="/resources/css/sample.css" />"
	rel="stylesheet" type="text/css">
<!--달력 script-->

<!-- jquery -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
</head>

<body>
	<form action="startingReserv.do" method="post">
		<div class="h_row_center"
			style="position: relative; width: 1160px; height: 100px; margin: auto;">
			<img src="https://s3.hourplace.co.kr/web/images/icon/logo_b.svg"
				onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'tab', 'home');window.location.href='/'"
				style="width: 130px; height: 32px; cursor: pointer;">
			<div class="h_row_center" style="position: absolute; right: 0px;">
				<div
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'tab', 'all');toggle_category_all()"
					class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						모든 장소</p>
				</div>
				<div class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						가성비 스튜디오</p>
				</div>
				<div class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						신규</p>
				</div>
				<div class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						장르별</p>
				</div>
				<div class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						컨셉별</p>
				</div>
				<div class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
						공간별</p>
				</div>
				<div class="h_center h_header_button"
					style="margin-left: 8px; width: 1px; height: 16px; background: rgb(201, 205, 210);"></div>
				<div
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'tab', 'hosting');window.location.href='/info/hosting'"
					class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-style: normal; font-weight: normal; font-size: 15px; line-height: 20px; text-align: center; color: rgb(114, 120, 127);">
						장소 등록</p>
				</div>
				<div onclick="show_login()" class="h_center h_header_button"
					style="padding: 0px 13px; height: 40px; margin-left: 8px;">
					<p
						style="font-style: normal; font-weight: normal; font-size: 15px; line-height: 20px; text-align: center; color: rgb(114, 120, 127);">
						로그인</p>
				</div>
				<div
					style="width: 1px; height: 16px; background-color: rgb(201, 205, 210); margin-right: 10px; margin-left: 20px;">
				</div>
				<div
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'search');toggle_search_container()"
					class="h_center"
					style="width: 44px; height: 44px; cursor: pointer;">
					<img src="https://s3.hourplace.co.kr/web/images/icon/search_b.svg"
						style="width: 24px; height: 24px;">
				</div>
			</div>
		</div>

		<!--장소 이름 위 카테고리, 위치 -->
		<div class="h_row_center"
			style="margin-top: 20px; position: relative; left: 200px;">
			<p
				style="font-size: 18px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
				빈티지 · 서울</p>
		</div>
		<!--이름-->
		<div style="position: relative; left: 200px;">
			<p
				style="margin-top: 5px; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
				샘플 장소 이름</p>
			<!--리뷰별점 , 리뷰 보기-->
			<!--onclick -- 별점 불러오는 메서드-->
			<div onclick="go_feedback()" class="h_row_center"
				style="cursor: pointer;">
				<div class="review_star_big" style="margin-left: -2px;">
					<span style="width: 98%;">별점 평균</span>
				</div>
				<div style="position: relative; left: 80px; top: 4px;">
					<p
						style="margin-left: 12px; font-style: normal; font-weight: 500; font-size: 15px; line-height: 24px; letter-spacing: -0.1px; text-decoration-line: underline; color: rgb(27, 29, 31);">
						n개 리뷰보기</p>
				</div>
			</div>
		</div>
		<!--장소 이미지-->
		<div class="flipsnap_container"
			style="margin-top: 50px; overflow: hidden; display: flex; width: 720px; height: 480px; border-radius: 6px; position: relative; left: 200px;">
			<!--720px X 480px-->
			<div class="flipsnap_list"
				style="display: flex; width: 100%; min-width: 100%; transition-property: transform; transition-timing-function: cubic-bezier(0, 0, 0.25, 1); transition-duration: 350ms; transform: translate3d(0px, 0px, 0px);">
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="https://img.hourplace.co.kr/temp/images/2019/05/13/52980499-0a22-3d0a-9545-e324879c9c19.jpg?s=1440x960&t=cover&q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/13/eac757fa-801d-3de4-9b6e-04532816ffd6.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/13/424ca485-0edc-3ebb-aee0-c34a689a6166.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/9308486f-bacc-34b0-ac3f-587ba04a7bd1?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/13/364f8bd3-f6bd-39c6-a212-c3f8b6f01538.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/20/62a82469-bcc4-3b3a-9035-5d6c8105c3c2.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/23/f578a436-280b-3f73-8af2-269a5d7b6b39.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/23/8eb8ccf0-84c4-3a39-85b6-ed0466a22129.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/23/4b34c334-aa6d-3b1d-81f4-96720e205542.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/06/17/9b8ac58f-07e7-3023-8bd4-8ee986e5599d.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/23/dc736664-ba13-3dde-92ca-f9ca6d1845c6.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/05/23/4c270b3c-8683-3db7-bb67-834412ef79f1.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/06/04/539a8fe0-cfe9-3d75-bb43-c37bc8ec5097.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/06/04/f7987a98-00b5-314a-b4b8-70665f1b6edb.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/06/04/f29c02c9-7dfb-36fe-963f-e1f6b97c851e.jpg?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/0a8a57b9-7366-3800-953a-a872e4d04c98?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/7bfa50d5-5af3-3a49-a25b-20e6a99c94d8?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/bf6f719e-dfb6-3257-85f6-6e0350e1b03a?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/bd269f4c-8aec-31ee-9515-6967696e9d77?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
				<div class="h_row_center"
					style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
					<img
						src="//img.hourplace.co.kr/place/user/1017/2021/06/05/01e49b66-498c-32c5-b63a-3ddfab51d8de?s=1440x960&amp;t=cover&amp;q=80"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
			</div>
		</div>

		<div
			style="width: 400px; position: absolute; top: 255px; left: 950px;">
			<!--예약 시작-->

			<div style="width: 100%; margin-top: 40px;">
				<div
					style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
					<div style="margin: 30px;">
						<div class="h_row_center"
							style="margin-top: 8px; flex-wrap: wrap;">
							<div class="h_center"
								style="height: 28px; margin-right: 6px; margin-bottom: 6px; border-radius: 4px; background-color: rgba(193, 159, 99, 0.098);">

							</div>

							<div class="h_center"
								style="height: 28px; margin-right: 6px; margin-bottom: 6px; border-radius: 4px; background-color: rgb(245, 248, 253);">
								<p
									style="margin: 0px 10px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; color: rgb(36, 111, 248);">
									최소 n시간부터 대여 가능</p>
							</div>

						</div>
						<div
							style="margin-top: 8px; display: flex; flex-direction: row; align-items: flex-end;">
							<p
								style="font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
								50,000원</p>
							<p
								style="margin-left: 5px; padding-bottom: 2px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(27, 29, 31);">
								/ 시간</p>
						</div>
						<div
							style="margin-top: 16px; height: 1px; background-color: rgb(231, 234, 238);"></div>
						<div class="h_row_center" style="margin-top: 20px;">
							<p
								style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
								세부 선택</p>



							<div class="h_row_center"
								style="position: absolute; right: 0px; cursor: pointer;">
								<img
									src="https://s3.hourplace.co.kr/web/images/icon/more_place.svg"
									style="width: 14px; height: 14px;">
								<p
									style="margin-left: 4px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: right; color: var(- -blue-030);">
									예약 안내</p>
							</div>
						</div>


						<!--라디오 버튼 (세부 방 선택 시작)-->

						<div>

							<input type="radio" id="room1" name="room" value="1"
								onchange="setDisplay()"> n번룸 <br> <br>
						</div>

						<input type="radio" id="room2" name="room" value="2"
							onchange="setDisplay()"> n번룸2
						<!--라디오버튼 눌러야만 값 보이게끔 하기 위해서 style-->

						<div id="divId" style="display: none;">

							<div id="divId">
								<div class="meetspace-info">
									<!--장소 룸 이미지 -->
								</div>
								<p class="meetspace-info-desc">
									4m(가로) x 5m(세로) x 3m(높이)<br> <br>블랙톤의 다크룸 입니다. 배치되어
									있는 소품들은 제거 후 자유롭게 사용 가능합니다.
								</p>
							</div>
							<ul class="list_detail">
								<li><span class="tit">공간유형</span> <span class="data"><span>촬영스튜디오
									</span><span>호리존 </span><span>라이브방송 </span></span></li>
								<li><span class="tit">예약시간</span> <span class="data">최소
										1시간 부터</span></li>
								<li><span class="tit">수용인원</span> <span class="data">최소
										1명 ~ 최대 15명</span></li>
								<!---->
							</ul>
							<div class="facility_wrap">
								<ul class="facility_list">
									<li><i class="sp_icon ico_alchole"></i> <span
										class="txt_name"> 주류반입 <em class="br">가능</em></span></li>
									<li><i class="sp_icon ico_table"></i> <span
										class="txt_name"> 의자/ 테이블</span></li>
									<li><i class="sp_icon ico_fittingroom"></i> <span
										class="txt_name"> 탈의실 <!---->
									</span></li>
									<li><i class="sp_icon ico_food"></i> <span
										class="txt_name"> 음식물 반입가능</span></li>
									<li><i class="sp_icon ico_toilet"></i> <span
										class="txt_name"> 내부 화장실</span></li>
									<li><i class="sp_icon ico_nonsmocking"></i> <span
										class="txt_name"> 금연 <!---->
									</span></li>
									<li><i class="sp_icon ico_parking"></i> <span
										class="txt_name"> 주차 <!---->
									</span></li>
									<li><i class="sp_icon ico_wifi"></i> <span
										class="txt_name"> 인터넷/ WIFI</span></li>
								</ul>
							</div>

						</div>
					</div>
					<div id="divId2" style="display: none;">
						<div id="divId">
							<div class="meetspace-info">
								<!--장소 룸 이미지 -->
							</div>
							<p class="meetspace-info-desc">
								7m(가로) x 5m(세로) x 3m(높이)<br> <br>블랙톤의 다크룸 입니다. 배치되어 있는
								소품들은 제거 후 자유롭게 사용 가능합니다.
							</p>
						</div>
						<ul class="list_detail">
							<li><span class="tit">공간유형</span> <span class="data"><span>촬영스튜디오
								</span><span>호리존 </span><span>라이브방송 </span></span></li>
							<li><span class="tit">예약시간</span> <span class="data">최소
									1시간 부터</span></li>
							<li><span class="tit">수용인원</span> <span class="data">최소
									1명 ~ 최대 15명</span></li>
							<!---->
						</ul>
						<div class="facility_wrap">
							<ul class="facility_list">
								<li><i class="sp_icon ico_alchole"></i> <span
									class="txt_name"> 주류반입 가능</span></li>
								<li><i class="sp_icon ico_table"></i> <span
									class="txt_name"> 의자/ 테이블</span></li>
								<li><i class="sp_icon ico_fittingroom"></i> <span
									class="txt_name"> 탈의실 <!---->
								</span></li>
								<li><i class="sp_icon ico_food"></i> <span class="txt_name">
										음식물 반입가능</span></li>
								<li><i class="sp_icon ico_toilet"></i> <span
									class="txt_name"> 내부 화장실</span></li>
								<li><i class="sp_icon ico_nonsmocking"></i> <span
									class="txt_name"> 금연 <!---->
								</span></li>
								<li><i class="sp_icon ico_parking"></i> <span
									class="txt_name"> 주차 <!---->
								</span></li>
								<li><i class="sp_icon ico_wifi"></i> <span class="txt_name">
										인터넷/ WIFI</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<h2 class="meetspace-heading">예약선택</h2>
			<div class="meetspace-radio">
				<div class="meetspace-radio-item">
					<label>시간 단위 예약하기(최소 1시간 부터)</label> <br>
					<!--예약 캘린더-->

					<input type="text" id="date" name="date" style="width: 200px;">
					<label for="date" style="font-size: small;">(날짜 선택)</label> <br>
					<!--시간 선택-->
					<!--시작시간-->
					<input type="text" id="startTime" name="startTime"
						style="width: 100px;"> ~
					<!--끝나는 시간-->
					<input type="text" id="endTime" name="endTime"
						style="width: 100px;"> <label for="endTime"
						style="font-size: small;">(시간 선택)</label> <input type="number"
						name="person" id="person" min="1" value="1" /> <label
						for="person" style="font-size: small;">(인원수 선택)</label>

					<p
						style="padding-right: 10px; font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31); text-decoration: underline; cursor: pointer;">
						(시간당 가격) x (시간) 가격</p>

					<br> <br> <br>

					<!--예약 버튼-->

					<input type="submit" id="Submitbutton" class="Submitbutton"
						value="예약하기"
						style="width: 400px; height: 50px; position: relative; left: -30px; text-align: center;">
				</div>
			</div>
		</div>
	</form>
	<div class="h_column_center"
		style="position: relative; left: px; bottom: -16px; width: 193px;">
	</div>

	<div class="triangle-with-shadow-down blue" style="margin-top: -1px;"></div>

	<!--관심장소 공유하기 버튼 추가-->

	<!--호스트 이미지 들어가는 곳-->
	<div style="width: 60px; height: 100px; margin-right: 20px;">
		<!-- <img src="#"  style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">-->
	</div>
	<div style="max-width: 513px; margin-right: 20px; width: fit-content;">
		<div style="width: fit-content;">
			<div style="position: relative; left: 200px; top: 50px;">
				<p
					style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(114, 120, 127);">
					호스트</p>

				<!--호스트 이름-->
				<p
					style="margin-top: 2px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
					샘플 호스트 이름</p>
			</div>
		</div>
	</div>
	<div style="position: relative; left: 800px;">
		<div class="h_center"
			style="margin-top: 8px; border-radius: 14px; border: 1px solid rgb(37, 113, 255); width: 107px; height: 28px;">
			<p
				style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: -0.1px; color: rgb(36, 111, 248); text-align: center;">
				장소번호 00000</p>
		</div>

	</div>

	<div
		style="margin-top: 30px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	<p
		style="margin-top: 80px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
		장소 소개</p>
	<div
		style="margin-top: 12px; width: 100%; display: flex; flex-wrap: wrap;">
		<!--onclick 태그 시작-->
		<div onclick="window.location.href='/tag/연희동'" class="h_center"
			style="margin-right: 8px; margin-top: 8px; height: 32px; border-radius: 4px; background-color: rgb(245, 247, 248); cursor: pointer;">
			<p
				style="padding: 0px 18px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; color: rgb(69, 75, 80);">
				#연희동</p>
		</div>
		<div onclick="window.location.href='/tag/빈티지'" class="h_center"
			style="margin-right: 8px; margin-top: 8px; height: 32px; border-radius: 4px; background-color: rgb(245, 247, 248); cursor: pointer;">
			<p
				style="padding: 0px 18px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; color: rgb(69, 75, 80);">
				#빈티지</p>
		</div>
		<div onclick="window.location.href='/tag/단독'" class="h_center"
			style="margin-right: 8px; margin-top: 8px; height: 32px; border-radius: 4px; background-color: rgb(245, 247, 248); cursor: pointer;">
			<p
				style="padding: 0px 18px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; color: rgb(69, 75, 80);">
				#단독</p>
		</div>
		<div onclick="window.location.href='/tag/자연광스튜디오'" class="h_center"
			style="margin-right: 8px; margin-top: 8px; height: 32px; border-radius: 4px; background-color: rgb(245, 247, 248); cursor: pointer;">
			<p
				style="padding: 0px 18px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; color: rgb(69, 75, 80);">
				#자연광스튜디오</p>
		</div>
	</div>

	<!--태그 끝-->
	<!--장소 소개 컨텐츠-->
	<p
		style="margin-top: 16px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
		샘플 장소 소개<br> 장소 소개 샘플입니다
	</p>
	<div class="h_row_center"
		style="margin-top: 24px; height: 110px; width: 100%;">
		<div class="h_center"
			style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">

			<!--평수-->

			<div class="h_column_center"
				style="width: fit-content; height: fit-content;">
				<img src="https://s3.hourplace.co.kr/web/images/icon/area.svg"
					style="width: 32px; height: 32px;">
				<p
					style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
					n평 /nm²</p>
			</div>
		</div>
		<!--층수-->
		<div class="h_center"
			style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
			<div class="h_column_center"
				style="width: fit-content; height: fit-content;">
				<img src="https://s3.hourplace.co.kr/web/images/icon/floor.svg"
					style="width: 32px; height: 32px;">
				<p
					style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
					지상 n층</p>
			</div>
		</div>
		<!--인원수-->
		<div class="h_center"
			style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
			<div class="h_column_center"
				style="width: fit-content; height: fit-content;">
				<img src="https://s3.hourplace.co.kr/web/images/icon/person.svg"
					style="width: 32px; height: 32px;">
				<p
					style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
					기본 n명</p>
			</div>
		</div>
		<!--주차 대수-->
		<div class="h_center"
			style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
			<div class="h_column_center"
				style="width: fit-content; height: fit-content;">
				<img src="https://s3.hourplace.co.kr/web/images/icon/parking.svg"
					style="width: 32px; height: 32px;">
				<p
					style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
					주차 n대 가능</p>
			</div>
		</div>
	</div>
	<!--장소 이용 규칙 컨텐츠-->
	<div
		style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	<p
		style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
		장소 이용 규칙 샘플입니당</p>
	<!--장소 이용규칙 이게 default-->
	<p
		style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
		default 이용규칙 입니다! 샘플!!!!! [시간 엄수]<br> - 계약된 시간을 꼭 준수하여 주시기 바랍니다.
		<br> - 이용요금은 [시작시간] 및 [종료시간]으로 계약됩니다.<br> - 촬영준비 및 세팅, 장비 철수
		및 장소 원상복구 시간은 계약시간에 포함 되어있습니다.<br> - 계약된 촬영시간을 초과할 경우 호스트가 추가결제를
		요청할 수 있습니다.<br> <br> [파손주의]<br> 삼각대, 조명, 달리, 레일, 철제박스,
		기타 장비로 인한 나무바닥과 벽지 파손에 꼭 주의 해주세요. (가정집 내부에서 촬영하신다면 달리와 레일 설치는 금지되어
		있습니다.)<br> - 준비물: 간단한 돗자리나 모포, 테니스 공을 준비해서 장비 밑에 꼭 깔아 공간을 보호해
		주세요.<br> - 파손시: 현장에서 함께 확인 &gt; 사진 촬영 &gt; 견적 확인 후, 배상 요청을 진행하게
		됩니다.<br> <br> [스탭인원]<br> 설정한 최대 스탭인원이 지켜지지 않을 경우, 호스트가
		촬영을 취소하거나 추가결제를 요청할 수 있습니다.<br> <br> [취식금지]<br> 공간에서
		취식은 항상 금지 되어있습니다. 부득이한 경우 호스트에게 먼저 양해를 꼭 구해주세요.<br> <br>
		[에티켓]<br> - 주변 주민들을 위해 기본 에티켓을 지켜주세요.<br> - 주변 야외 촬영은
		불가능합니다.<br> - 촬영 도중 발생한 쓰레기는 모두 정리해주셔야 합니다.<br> - 주차는 안내된
		주차대수에 한해 제공됩니다.<br> - 기존의 가구 세팅 및 구조를 필요에 의해 변경하신 경우 마감시간 전에 원상복구
		해주셔야 합니다.
	</p>
	<!--허위 정보 신고-->
	<p onclick="window.location.href='/report/place/29464'"
		style="width: fit-content; margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; color: rgb(27, 29, 31); text-decoration: underline; cursor: pointer;">
		허위정보 신고</p>
	<div
		style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	<!--위치-->
	<p
		style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
		위치</p>
	<!--위치 api 들어가는 곳-->
	<div onclick="toggle_place_map()" class="h_center"
		style="margin-top: 20px; width: 158px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
		<div class="h_row_center">
			<img src="https://s3.hourplace.co.kr/web/images/icon/place.svg"
				style="width: 24px; height: 24px;">
			<p id="map_txt"
				style="margin-left: 6px; font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
				지도 보기</p>
		</div>
	</div>
	<div id="place_map"
		style="position: relative; display: none; margin-top: 20px; width: 100%; height: 300px;">
		<div id="map"
			style="background: white; overflow: hidden; width: 100%; height: 100%;">
			지도</div>
		<div
			style="border-radius: 5px; position: absolute; bottom: 4px; left: 4px; overflow: hidden; width: 90px; height: 30px; margin: 0px; padding: 0px; z-index: 1; background: rgb(255, 255, 255);">
			<button onclick="setCenter()" style="width: 100%; height: 100%;">장소로
				이동</button>
		</div>
	</div>

	<p
		style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
		자세한 주소는 호스트 승인 후, 메시지로 문의 가능합니다.</p>
	<!--지도 끝-->
	<div style="margin-top: 40px; width: 100%; height: 1px;"></div>
	<div
		style="width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	<!--주변 정보-->
	<p
		style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
		주변 정보 샘플입니당</p>
	<!--주변 정보 컨텐츠-->
	<p
		style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
		주변 정보 컨텐츠 샘플입니당</p>
	<div style="margin-top: 40px; width: 100%; height: 1px;"></div>
	<!--리뷰 시작-->

	<div
		style="width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	<div class="h_row_center" style="margin-top: 40px; position: relative;">
		<p
			style="font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
			장소 리뷰</p>
		<p
			style="margin-left: 9px; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 0.7; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
			45</p>
		<img src="https://s3.hourplace.co.kr/web/images/icon/gold_star.svg"
			style="width: 24px; height: 24px; margin-left: 13px;">
		<p
			style="margin-left: 4px; font-style: normal; font-weight: bold; font-size: 15px; line-height: 24px; letter-spacing: -0.1px; color: rgb(38, 40, 43);">
			4.9</p>
		<div class="h_row_center" style="margin: auto;">
			<!--정렬 기준 시작-->
			<p
				style="font-style: normal; font-weight: bold; font-size: 14px; line-height: 20px; cursor: pointer; color: rgb(36, 111, 248);">
				추천순</p>
			<p
				style="font-style: normal; font-weight: bold; font-size: 14px; line-height: 20px; cursor: pointer; margin-left: 10px; color: rgb(174, 179, 184);">
				최신순</p>
			<!--정렬 기준 끝-->
		</div>
	</div>
	<!--리뷰 사진 보기-->
	<div class="flipsnap_container_photo_feedbacks"
		style="margin: 30px 0px 0px; overflow: hidden;">
		<div class="flipsnap_list_photo_feedbacks"
			style="display: flex; width: 100%; min-width: 100%; transition-property: transform; transition-timing-function: cubic-bezier(0, 0, 0.25, 1); transition-duration: 350ms; transform: translate3d(0px, 0px, 0px);">
			<div
				style="width: 104px; height: 104px; border-radius: 4px; overflow: hidden; margin-right: 8px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0; background-color: rgb(255, 255, 255); cursor: pointer;">
				<img src="#" alt=""
					style="width: 100%; height: 100%; object-fit: cover;">
			</div>
		</div>
	</div>
	<div style="margin-top: 5px;">
		<div
			style="margin-top: 30px; width: 100%; padding-bottom: 32px; border-bottom: 1px solid rgb(231, 234, 238);">
			<div class="h_row" style="justify-content: space-between;">
				<p
					style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
					사용자 닉네임 들어가는 곳</p>
				<p
					style="font-style: normal; font-weight: normal; font-size: 14px; line-height: 22px; color: rgb(158, 164, 170);">
					날짜 들어가는 곳</p>
			</div>
			<div style="margin-top: 6px;">
				<!--리뷰 별점 시작-->
				<div class="review_star">
					<span style="width: 100%;">몇점인지 들어가는 곳</span>
				</div>
			</div>
			<div class="h_row" style="justify-content: space-between;">
				<p
					style="margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(114, 120, 127);">
				</p>
				<div
					style="min-width: 56px; width: 56px; height: 56px; margin-left: 20px; border-radius: 4px; overflow: hidden; cursor: pointer;">

				</div>
			</div>

			<div
				style="margin-top: 30px; width: 100%; padding-bottom: 32px; border-bottom: 1px solid rgb(231, 234, 238);">
				<p
					style="width: fit-content; margin-top: 40px; margin-bottom: 40px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31); cursor: pointer; text-decoration: underline;">
					리뷰 더보기</p>
			</div>
		</div>

	</div>



	<!--푸터-->

	<div
		style="flex-direction: row; display: flex; justify-content: center; background-color: #fafbfb;">
		<div class="h_row_center"
			style="width: 1160px; height: 310px; position: relative; margin: 10px; right: 150px;">

			<div
				style="position: relative; min-width: 300px; padding-top: 40px; height: 100%;">
				<p
					style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #454b50; cursor: pointer;"
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'business');window.open('http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018322016230204057&amp;pageUnit=10&amp;searchCnd=wrkr_no&amp;searchKrwd=4948100558&amp;pageIndex=1')">
					사업자정보확인</p>
				<p
					style="margin-top: 12px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #454b50; cursor: pointer;"
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'personal');window.location.href='/policy/personal'">
					개인정보처리방침</p>
				<p
					style="margin-top: 12px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #454b50; cursor: pointer;"
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'service');window.location.href='/policy/service'">
					이용약관</p>
				<p
					style="margin-top: 12px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #454b50; cursor: pointer;"
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'service');window.location.href='/service'">
					고객센터</p>
				<p
					style="margin-top: 12px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #454b50; cursor: pointer;"
					onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'hr');window.open('https://www.notion.so/hourplace/fae9ceaf4a174479bf52a44305283045')">
					인재채용</p>

				<div style="position: absolute; bottom: 50px; margin: auto;">
					<p
						style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.47; letter-spacing: -0.1px; color: #454b50;">
						team@hourplace.co.kr</p>
				</div>
			</div>

			<div
				style="position: relative; width: 860px; padding-top: 40px; height: 100%">

				<p
					style="font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; color: #9ea4aa;">
					(주)먼치팩토리 사업자 정보</p>
				<p
					style="margin-top: 16px; font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.67; letter-spacing: normal; color: #9ea4aa;">
					대표 서영석<br> 주소 서울특별시 강남구 압구정로2길 62 대성빌딩 202호<br> 사업자 등록번호
					494-81-00558<br> 통신판매업신고번호 2018-서울강남-04057<br> (주)먼치팩토리는
					통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은
					각 판매자에게 있습니다.
				</p>

				<p
					style="position: absolute; bottom: 50px; font-size: 11px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.36; letter-spacing: normal; color: #9ea4aa;">
					© munchfactory Inc.</p>

				<div class="h_row_center"
					style="position: absolute; bottom: 50px; right: 0;">
					<div class="h_column_center"
						style="width: 32px; height: 32px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'sns', 'instagram');window.open('http://instagram.com/hourplace/?hl=ko')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img
								src="//s3.hourplace.co.kr/web/images/icon/sns_instagram_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
					<div class="h_column_center"
						style="width: 32px; height: 32px; margin-left: 12px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'sns', 'blog');window.open('https://blog.naver.com/hourplace')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img src="//s3.hourplace.co.kr/web/images/icon/sns_blog_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
					<div class="h_column_center"
						style="width: 32px; height: 32px; margin-left: 12px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'sns', 'brunch');window.open('https://brunch.co.kr/@hourplace#articles')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img
								src="//s3.hourplace.co.kr/web/images/icon/sns_brunch_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
					<div class="h_column_center"
						style="width: 32px; height: 32px; margin-left: 12px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'sns', 'facebook');window.open('http://facebook.com/Hourplace-1170061373140648')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img
								src="//s3.hourplace.co.kr/web/images/icon/sns_facebook_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
					<div class="h_column_center"
						style="width: 32px; height: 32px; margin-left: 12px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'app', 'ios');window.open('https://itunes.apple.com/kr/app/id1481552760?mt=8')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img
								src="//s3.hourplace.co.kr/web/images/icon/sns_apple_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
					<div class="h_column_center"
						style="width: 32px; height: 32px; margin-left: 12px; cursor: pointer;"
						onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'app', 'android');window.open('https://play.google.com/store/apps/details?id=com.munchfactory.hourplace')">
						<div class="h_center"
							style="margin-top: 2px; width: 32px; height: 32px; border-radius: 16px; background-color: #eff3f5;">
							<img
								src="//s3.hourplace.co.kr/web/images/icon/sns_google_dark.svg"
								style="width: 20px; height: 20px">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--푸터 끝-->

</body>
<!--radiobutton 값 넘기기-->
<script>
	$(document).change(function() {
		var checked = $('input:radio[name=room]').is(':checked');
		var value = $('input:radio[name=room]:checked').val();
		console.log(value);
		console.log(checked);
	});
</script>
<!--인원수 값 넘기기-->
<script>
	$(document).change(function() {
		var personNum = $("#person").val();
		console.log(personNum);

	})
</script>
<!---->
<!--테스트-->
<script>
	$(function() {
		$("#date").datepicker(
				{
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],

					onSelect : function(d) {

						var arr = d.split("-"); // /삭제하고
						var year = arr[0]; //연도
						var month = arr[1]; //월
						var day = arr[2]; //일

						$("#year").text(year);
						$("#month").text(month);
						$("#day").text(day);

						//요일 가져오기
						//데이터를 먼저 가져오고 (숫자로 넘어옴)
						var date = new Date($("#date").datepicker({
							dateFormat : "yy-mm-dd"
						}).val());
						//일요일 0, 월요일 1, 화요일 2, 수요일 3, 목요일 4, 금요일 5, 토요일,6

						//숫자로 넘어온 일자 다시 텍스트로 바꾸기
						week = new Array("일", "월", "화", "수", "목", "금", "토");
						$("#mydate").text(week[date.getDay()]);

						//테스트 끝
						var reservYear = date.getFullYear(); //년도

						var reservMonth = date.getMonth() + 1; //월

						var reservDate = date.getDate(); //날짜
						console.log(reservYear);
						console.log(reservMonth);
						console.log(reservDate);

					}
				});

	});
</script>

<!--테스트 끝-->

<!--time picker -->

<script>
	var findstart = $
	{
		findstart
	};
	var findend = $
	{
		findend
	};

	console.log(findstart);
	console.log(findend);

	$(document).ready(function() {
		$(function() {
			$("#startTime").timepicker({
				timeFormat : 'h:mm p',
				interval : 60,
				minDate : moment(),
				maxTime : '23:00pm',
				defaultTime : '09',
				dynamic : false,
				dropdown : true,
				scrollbar : true,

				change : function(startTime) {
					var time = $("#startTime").val();
					console.log(time);

				}
			});

		});
	});

	$(function() {
		$("#endTime").timepicker({
			timeFormat : 'h:mm p',
			interval : 60,
			minTime : '12:00am',
			maxTime : '11:00pm',
			defaultTime : '10',
			startTime : '12:00am',
			dynamic : false,
			dropdown : true,
			scrollbar : true,
			change : function(endTime) {

				var time2 = $("#endTime").val();

			}

		});

	});
</script>
<!--datetimepicker 끝-->

<!--radio button 값에 따라서 다른 룸 보여주기 위한 jquery-->
<script>
	$('input[type=radio][name=room]').on('click', function() {
		var checkValue = $('input[type=radio][name=room]:checked').val();

		if (checkValue == '1') {
			$('#divId').css('display', 'block');
			$('#divId2').css('display', 'none');

		} else if (checkValue == '2') {
			$('#divId').css('display', 'none');
			$('#divId2').css('display', 'block');

		}

	});
</script>
</html>