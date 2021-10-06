<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${placeInfo.placeName}</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/detail-place.css" />" />
	<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>

<script src="<c:url value="/resources/js/datepicker.ko.js" />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1145e3da7175bb2ed15571464168022&libraries=services"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.flipsnap_sub_list .next {
	top: 50%;
	right: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.flipsnap_sub_list .prev {
	top: 50%;
	left: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.clicked {
	color: rgb(36, 111, 248);
}

/* .align_btn {
	backgroung-color: rgb(174, 179, 184);
} */
#help_btn:hover {
	color: rgb(174, 179, 184);
}
</style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
</head>
<body style="min-height: 1000px">

	<%@ include file="header.jsp"%>


	<div id="main_vue" class="h_column_center" style="min-height: 1000px">
		<div style="width: 1160px">
			<div class="h_row_center" style="margin-top: 50px">
				<p
					style="font-size: 18px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
					${placeInfo.placeCate} · ${placeInfo.placeArea }</p>
			</div>
			<p
				style="margin-top: 50px; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: rgb(27, 29, 31);">

				${placeInfo.placeName }</p>
			<div class="h_row_center" style="margin-top: 19px; height: 24px">
				<div onclick="go_feedback()" class="h_row_center"
					style="cursor: pointer">
					<div class="review_star_big" style="margin-left: -2px">

						<c:forEach var="i" begin="1" end="${placeInfo.rateHeader}">
							<img src=" <c:url value="/resources/custom/icon/gold_star.png"/>"
								style="width: 22px; height: 22px;" />
						</c:forEach>

						<span style="width: 100%; margin-bottom: 0px;">${placeInfo.avgRate }</span>
					</div>
					<p
						style="margin-left: 12px; margin-bottom: 1px; font-style: normal; font-weight: 500; font-size: 15px; line-height: 24px; letter-spacing: -0.1px; text-decoration-line: underline; color: rgb(27, 29, 31);">
						${placeInfo.reviewCnt }개 리뷰보기</p>
				</div>
			</div>
			<div class="h_row" style="width: 100%">
				<div style="position: relative; width: 720px">
					<div class="h_row_center"
						style="position: absolute; top: -10px; right: 0px">
						<div id="flipsnap_prev" class="h_center prev"
							style="width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px; margin-right: 10px; cursor: default;">
							<img
								src="<c:url value="/resources/custom/icon/chevron_left_b.svg"/>"
								id="flipsnap_prev_img" style="width: 16px; height: 16px" />
						</div>
						<div id="flipsnap_next" class="h_center next"
							style="width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px; cursor: pointer;">
							<img
								src="<c:url value="/resources/custom/icon/chevron_left_b.svg"/>"
								id="flipsnap_next_img"
								style="width: 16px; height: 16px; transform: rotate(180deg)" />
						</div>
					</div>
					<div class="flipsnap_container"
						style="margin-top: 50px; overflow: hidden; display: flex; width: 100%; height: 480px; border-radius: 6px;"
						id="small_images">
						<!--상단 큰 이미지 리스트 영역.-->
						<!--상단과 하단에 같은 이미지를 같은 순서대로 나열해야 한다.-->
						<div class="flipsnap_list"
							style="display: flex; width: 100%; min-width: 100%; transition-property: transform; transition-timing-function: cubic-bezier(0, 0, 0.25, 1); transition-duration: 350ms; transform: translate3d(0px, 0px, 0px);">
							<c:forEach var="bigImg" items="${imgList}">
								<div class="h_row_center"
									style="width: 100%; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0;">
									<a id="tempATag"
										href="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${bigImg.s3FileName}"
										data-fancybox> <img
										src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${bigImg.s3FileName}"
										style="width: 100%; height: 100%; object-fit: cover" />
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<!--상단 큰 이미지 리스트 영역 끝.-->
					<!--크게보기 버튼-->
					<div class="h_center"
						style="position: absolute; top: 60px; right: 10px; width: 180px; height: 33px; border-radius: 4px; background-color: rgba(255, 255, 255, 0.8); overflow: hidden; cursor: pointer;">
						<div class="h_row_center">
							<img src=" <c:url value="/resources/custom/icon/full.svg"/>"
								style="width: 20px; height: 20px" />
							<p
								style="margin-left: 3px; margin-bottom: 0px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(27, 29, 31);">
								사진 클릭하여 크게보기</p>
						</div>
					</div>
					<!--크게보기 끝-->

					<div class="flipsnap_sub_container"
						style="margin-top: 20px; overflow: hidden; display: flex; width: 100%; height: 80px;">
						<!-- 하단 작은 이미지 영역 시작.-->
						<div class="flipsnap_sub_list"
							style="display: flex; width: 100%; min-width: 100%; transition-property: transform; transition-timing-function: cubic-bezier(0, 0, 0.25, 1); transition-duration: 350ms; transform: translate3d(0px, 0px, 0px);">
							<c:forEach var="smallImg" items="${imgList }">
								<div class="h_row_center flipsnap_sub_item"
									style="width: 120px; height: 80px; margin-right: 10px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; flex-shrink: 0; opacity: 1; cursor: pointer;">
									<!--첫번째 이미지-->
									<img
										src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${smallImg.s3FileName}"
										style="width: 100%; height: 100%; object-fit: cover; border-radius: 6px;" />
								</div>
							</c:forEach>
						</div>
						<!--하단 작은 이미지 영역 끝.-->
					</div>
					<!--프로필 영역 시작.-->
					<div class="h_row_center"
						style="position: relative; margin-top: 30px; height: 60px; width: 100%;">
						<div class="h_row_center"
							style="max-width: 583px; height: 60px; width: fit-content; cursor: pointer;">
							<!--프로필 이미지.-->
							<div style="width: 60px; height: 60px; margin-right: 20px">
								<img
									src="<c:url value="/resources/custom/icon/elements_image_empty_guest.png"/>"
									style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;" />
							</div>
							<!--프로필 이미지 끝.-->
							<div
								style="max-width: 513px; margin-right: 20px; width: fit-content;">
								<div style="width: fit-content">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(114, 120, 127);">
										호스트</p>
									<!--호스트 닉네임 시작.-->
									<p
										style="margin-top: 2px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);"
										id="nickName">${placeInfo.userNickName }</p>
									<!--호스트 닉네임 끝.-->
								</div>
							</div>
						</div>
						<div
							style="position: absolute; top: 0px; right: 0px; width: 107px; height: 60px;">
							<div class="h_center"
								style="margin-top: 8px; border-radius: 14px; border: 1px solid rgb(36, 111, 248); width: 107px; height: 28px;">
								<p
									style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: -0.1px; margin-bottom: 0px; color: rgb(36, 111, 248);">
									장소번호 ${placeInfo.placeNum }</p>
								<input type="hidden" value="5" id="place_num">
							</div>
						</div>
					</div>
					<div
						style="margin-top: 30px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
					<p
						style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						장소 소개</p>
					<div
						style="margin-top: 12px; width: 100%; display: flex; flex-wrap: wrap;">
						<!--태그 단위 시작. -->
						<c:forEach var="tag" items="${placeInfo.hashTags }">
							<div onclick="window.location.href='/tag.do?hashTag=${tag}'"
								class="h_center"
								style="margin-right: 8px; margin-top: 8px; height: 32px; border-radius: 4px; background-color: rgb(245, 247, 248); cursor: pointer;">
								<p
									style="padding: 0px 18px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.1px; margin-bottom: 0px; color: rgb(69, 75, 80);">
									#${tag}</p>
							</div>
							<!--태그 한단위 끝.-->
						</c:forEach>


					</div>
					<!--장소 소개 시작.-->
					<p
						style="margin-top: 16px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
						${placeInfo.placeIntro }</p>
					<!--장소 소개 끝.-->
					<div class="h_row_center"
						style="margin-top: 24px; height: 110px; width: 100%">
						<div class="h_center"
							style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
							<div class="h_column_center"
								style="width: fit-content; height: fit-content">
								<img src="<c:url value="/resources/custom/icon/area.svg"/>"
									style="width: 32px; height: 32px" />
								<p
									style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
									${placeInfo.placeDa }</p>
							</div>
						</div>
						<div class="h_center"
							style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
							<div class="h_column_center"
								style="width: fit-content; height: fit-content">
								<img src=" <c:url value="/resources/custom/icon/floor.svg"/>"
									style="width: 32px; height: 32px" />
								<p
									style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
									${placeInfo.placeFloor }</p>
							</div>
						</div>
						<div class="h_center"
							style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
							<div class="h_column_center"
								style="width: fit-content; height: fit-content">
								<img src=" <c:url value="/resources/custom/icon/person.svg"/>"
									style="width: 32px; height: 32px" />
								<p
									style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
									기본 ${placeInfo.placeCapa }명</p>
							</div>
						</div>
						<div class="h_center"
							style="margin-right: 15px; width: 170px; height: 110px; border-radius: 8px; background-color: rgb(250, 251, 251);">
							<div class="h_column_center"
								style="width: fit-content; height: fit-content">
								<img src=" <c:url value="/resources/custom/icon/parking.svg"/>"
									style="width: 32px; height: 32px" />
								<p
									style="margin-top: 10px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31);">
									주차 ${placeInfo.placeCapaCar }대 가능</p>
							</div>
						</div>
					</div>
					<div
						style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
					<p
						style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						장소 이용 규칙</p>
					<p
						style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
						${placeInfo.placeRule }</p>
					<p onclick="window.location.href='/report/place/29386'"
						style="width: fit-content; margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; color: rgb(27, 29, 31); text-decoration: underline; cursor: pointer;">
						허위정보 신고</p>
					<div
						style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
					<p
						style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						위치</p>
					<!-- 다음 지도 표시 하는 곳 시작. -->
					<div class="h_center" id="openPlace" onclick="toggle_open_map()"
                  style="margin-top: 20px; width: 158px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
                  <div class="h_row_center">
                     <img src=" <c:url value="/resources/custom/icon/place.svg"/>"
                        style="width: 24px; height: 24px" />
                     <p id="map_txt"
                        style="margin-left: 6px; margin-bottom: 0px; font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                        지도 보기</p>
                  </div>
               </div>

               <div id="place_map"
                  style="position: relative; margin-top: 20px; width: 100%; height: 300px; display: block;">
                  <div id="map"
                     style="background: white; overflow: hidden; width: 100%; height: 300px;">
                  </div>
                  <!-- 장소로 이동버튼 아직 미구현이라 none 처리 -->
                  <div
                     style="border-radius: 5px; position: absolute; bottom: 4px; left: 4px; overflow: hidden; width: 90px; height: 30px; margin: 0px; padding: 0px; z-index: 1; background: rgb(255, 255, 255); display: none;">
                     <button onclick="panTo()"
                        style="width: 100%; height: 100%; ">장소로
                        이동</button>
                  </div>
                  <div class="h_row_center"
                     style="margin-top: 10px; margin-bottom: 10px; position: relative">
                     <p
                        style="font-size: 15px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 0.7; letter-spacing: -0.67px; color: rgb(36, 111, 248);">
                        주소 :</p>

                     <p id="place_addr"
                        style="margin-left: 10px; line-height: 0.7; letter-spacing: -0.67px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                        ${placeInfo.placeAddr }</p>
                  </div>
               </div>
					
					
					<div style="margin-top: 40px; width: 100%; height: 1px"></div>
					<div
						style="width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
					<p
						style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						주변 정보</p>
					<p
						style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
						${placeInfo.placeSurinfo }</p>
					<div style="margin-top: 40px; width: 100%; height: 1px"></div>
					<div
						style="width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>

					<div style="margin-top: 40px; width: 100%; height: 1px"></div>
					<!-- 리뷰 시작. -->
					<div id="feedback">
						<div class="h_row_center"
							style="margin-top: 40px; position: relative">
							<p
								style="font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
								장소 리뷰</p>
							<p
								style="margin-left: 9px; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 0.7; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
								9</p>
							<img src=" <c:url value="/resources/custom/icon/gold_star.png"/>"
								style="width: 24px; height: 24px; margin-left: 13px" />
							<p
								style="margin-left: 4px; font-style: normal; font-weight: bold; font-size: 15px; line-height: 24px; letter-spacing: -0.1px; color: rgb(38, 40, 43);">
								5.0</p>
							<div class="h_row_center" style="position: absolute; right: 0px">
								<p class="align_btn"
									style="font-style: normal; font-weight: bold; font-size: 14px; line-height: 20px; cursor: pointer;" id="suggest">
									추천순</p>
								<p class="align_btn"
									style="font-style: normal; font-weight: bold; font-size: 14px; line-height: 20px; cursor: pointer; margin-left: 10px;" id="newest">
									최신순</p>
								<!-- color: rgb(174, 179, 184); -->
							</div>
						</div>
						<c:forEach var="review" items="${reviewList }">

							<!---->
							<div style="margin-top: 5px">
								<div
									style="margin-top: 30px; width: 100%; padding-bottom: 32px; border-bottom: 1px solid rgb(231, 234, 238);">
									<div class="h_row" style="justify-content: space-between">
										<p
											style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
											${review.userNickName }</p>
										<p
											style="font-style: normal; font-weight: normal; font-size: 14px; line-height: 22px; color: rgb(158, 164, 170);">
											${review.reviewGuestRegd}</p>
									</div>
									<div style="margin-top: 6px">
										<div class="review_star">
											<c:forEach var="i" begin="1" end="${review.reviewGuestRate}">
												<img
													src=" <c:url value="/resources/custom/icon/gold_star.png"/>"
													style="width: 18px; height: 18px;" />
											</c:forEach>
										</div>
									</div>
									<div class="h_row" style="justify-content: space-between">
										<p
											style="margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(114, 120, 127);">
											${review.reviewGuestWr }</p>
										<div
											style="min-width: 56px; width: 100px; height: 56px; margin-left: 0px; border-radius: 4px; overflow: hidden; cursor: pointer;">
										</div>
									</div>
									<div class="h_row_center"
										style="margin-top: 16px; padding: 12px; position: static; min-width: 77px; width: fit-content; height: 29px; left: 0px; top: 76px; box-sizing: border-box; border-radius: 4px; cursor: pointer; border: 1px solid rgb(223, 226, 231);">
										<div class="h_row_center"
											style="font-style: normal; font-weight: 500; font-size: 12px; line-height: 14px; color: rgb(114, 120, 127);">
											<p style="margin-bottom: 0px" onclick="helpClick('${review.rsvNum}', '${review.userId }')" id="${review.rsvNum }">도움돼요
												${review.helpCnt }</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 리뷰 끝 -->
						<input type="hidden" value="${rowNum }" id="row_num" />

					</div>
					<div onclick="moreReviews()">
						<p
							style="width: fit-content; margin-top: 40px; margin-bottom: 40px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31); cursor: pointer; text-decoration: underline;">
							리뷰 더보기</p>
					</div>
				</div>
				<div style="width: 400px; margin-left: 40px; position: relative">
					<div style="width: 100%; margin-top: 50px">
						<div
							style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
							<div style="margin: 30px">

								<div class="h_row_center"
									style="margin-top: 8px; flex-wrap: wrap">
									<div class="h_center"
										style="height: 28px; margin-right: 6px; margin-bottom: 6px; border-radius: 4px; background-color: rgba(193, 159, 99, 0.098);">
									</div>
									<div class="h_center"
										style="height: 28px; margin-right: 6px; margin-bottom: 6px; border-radius: 4px; background-color: rgb(245, 248, 253);">
										<p
											style="margin: 0px 10px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; color: rgb(36, 111, 248);">
											최소 ${placeInfo.placeMinTime }시간부터 대여 가능</p>
									</div>
									<div class="h_center"
										style="height: 28px; margin-bottom: 6px; border-radius: 4px; background-color: rgb(245, 248, 253);">
										<p
											style="margin: 0px 10px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; color: rgb(36, 111, 248);">
											기본 ${placeInfo.placeCapa }명 부터 예약가능</p>
									</div>
								</div>
								<div
									style="margin-top: 8px; display: flex; flex-direction: row; align-items: flex-end;">
									<p
										style="font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
										<label for="" style="margin-bottom: 0px;" id="place_price">${placeInfo.placePrice }</label>원
									</p>
									<p
										style="margin-left: 5px; padding-bottom: 2px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(27, 29, 31);">
										/ 시간</p>
								</div>


								<div
									style="margin-top: 16px; height: 1px; background-color: rgb(231, 234, 238);"></div>

								<!--세부 방 항목 선택 라디오버튼.-->
								<p
									style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; margin-top: 10px; color: rgb(158, 164, 170);">
									세부 정보 선택</p>
								<div
									style="margin-top: 12px; min-height: 10px; padding: 10px 10px; border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
									<!--반복될 부분 : 상세 방 이름.-->
									<c:forEach var="detailRoom" items="${detailInfoList }"
										varStatus="status">
										<div>
											<input class="form-check-input" type="radio" value=""
												name="flexRadio" id="detail_title${status.index }" checked>
											<input type="hidden" value="${detailRoom.detailNum }"
												class="detail_num${status.index }"> <input
												type="hidden" value="123"
												class="detail_detail_capa${status.index }"> <label
												class="form-check-label" for="detail_title${status.index }">
												${detailRoom.detailTitle } </label>
										</div>
									</c:forEach>

									<!-- <div>
                      <input class="form-check-input" type="radio" value="" name="flexRadio" id="detail_title1">
                      <input type="hidden" value="24A" class="detail_num1">
                      <input type="hidden" value="" class="detail_detail_capa1">
                      <label class="form-check-label" for="detail_title1">
                        Room A
                      </label>
                    </div> -->
								</div>
								<div class="h_row_center" style="margin-top: 20px">
									<p
										style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
										스케줄</p>
								</div>
								<div style="margin-top: 10px; position: relative">
									<p
										style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: rgb(158, 164, 170);">
										시작 날짜 ~ 종료 날짜</p>
									<div class="h_row_center"
										style="margin-top: 8px; height: 52px; border-radius: 4px; border: 1px solid rgb(223, 226, 231); cursor: pointer;"
										id="bookingCalendar">
										<p
											style="padding: 0px 14px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; color: rgb(158, 164, 170);"
											id="schedule">스케줄을 선택하세요</p>
										<input type="hidden" name="reserveDateTime" id="rsv_date_time">
									</div>
									<!--booking calendar toggle start-->
									<div class="booking_calendar"
										style="display: none; position: absolute; z-index: 2; top: 74px; right: 0px; width: 540px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
										<!--날짜 선택 달력.-->
										<form action="/reserveForm.do?placeNum=${placeInfo.placeNum}"
											id="detail_form" hidden="hidden" method="post">
											<input type="hidden" name="rsvYear" id="rsv_year"> <input
												type="hidden" name="rsvMonth" id="rsv_month"> <input
												type="hidden" name="rsvDate" id="rsv_date"> <input
												type="hidden" name="rsvStartT" id="form_start_time">
											<input type="hidden" name="rsvEndT" id="form_end_time">
											<input type="hidden" name="detailNum" id="detail_num" />
											<!-- 인원수 -->
											<input type="hidden" name="headCount" id="head_count" />
											<!-- 1인당 가격 -->
											<!-- 넘겨주는 이유는 프론트에서 1인당가격을 방에 따라서 재 계산 하기 때문. -->
											<input type="hidden" name="rstPrice" id="rst_price" /> <input
												type="hidden" name="detailTitle" id="form_detail_title" />
											<input type="hidden" name="hostNickName" id="host_nick_name" />
											<input type="hidden" name="userId"
												value="${placeInfo.userId }" /> <input type="hidden"
												name="placeName" value="${placeInfo.placeName}" /> <input
												type="hidden" name="placePrice"
												value="${placeInfo.placePrice}" /> <input type="hidden"
												name="placeMaincate" value="${placeInfo.placeMaincate}" />
											<input type="hidden" name="placeCate"
												value="${placeInfo.placeCate}" />
										</form>
										<div class="date_picker"
											style="margin: 10px 10px; position: relative; display: inline-block;">
										</div>
										<div
											style="margin: 10px 10px; position: relative; display: inline-block; vertical-align: top;">
											<div
												style="margin-bottom: 50px; margin-left: 10px; position: relative; display: inline-block; vertical-align: top;">
												<p style="color: gray">시작 시간</p>
												<input type="text" style="min-height: 30px; width: 200px"
													id="start_time" placeholder="시작 시간을 선택해주세요." readonly>
											</div>
											<br>
											<div
												style="margin-left: 10px; position: relative; display: inline-block; vertical-align: top;">
												<p style="color: gray">종료 시간</p>
												<input type="text" style="min-height: 30px; width: 200px"
													id="end_time" placeholder="종료 시간을 선택해주세요." readonly>
											</div>
										</div>
										<div class="h_row_center"
											style="position: relative; width: 100%; height: 70px; border-top: 1px solid rgb(231, 234, 238); z-index: 0;"
											onclick="resetDateTime()">
											<p class="h_hover_text"
												style="margin-left: 30px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; cursor: pointer;">
												초기화</p>
											<div style="position: absolute; right: 20px"
												class="btn btn-primary" id="time_btn">
												<div class="request on"
													style="margin-top: 0px; width: 60px; height: 30px">
													<p style="margin-bottom: 0px;">완료</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div style="position: relative">
									<div class="h_row_center" style="margin-top: 20px">
										<p
											style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
											총인원</p>
									</div>
									<div style="margin-top: 10px; position: relative"
										id="bookingPeople">
										<div class="h_row_center"
											style="margin-top: 8px; height: 52px; border-radius: 4px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
											<p
												style="padding: 0px 14px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; color: rgb(158, 164, 170);"
												id="people_cnt">총인원 수를 입력하세요</p>
										</div>
									</div>
									<div class="booking_people"
										style="display: none; position: absolute; z-index: 2; top: 84px; right: 0px; width: 340px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
										<div style="width: 100%; height: fit-content">
											<div class="h_row_center"
												style="width: 280px; margin: 30px 30px 20px; height: 44px; position: relative;">
												<p
													style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: var(- -grey-080);">
													총인원 수</p>
												<div class="h_row_center"
													style="height: 44px; width: 168px; position: absolute; right: 0px;">
													<div
														style="width: 40px; height: 44px; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;"
														id="people_minus">
														<img
															src=" <c:url value="/resources/custom/icon/minus.svg"/>"
															style="width: 20px; height: 20px" />
													</div>
													<div
														style="width: 60px; margin: 0px 14px; padding: 0px 2px; height: 44px; border-radius: 4px; border: solid 1px var(- -grey-025); display: flex; flex-direction: row; align-items: center; justify-content: center;">
														<input type="text" pattern="[0-9]*"
															id="select_search_people" placeholder="1"
															style="width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; text-align: center; color: var(- -grey-080);"
															value="1" />
													</div>
													<div
														style="width: 40px; height: 44px; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;"
														id="people_plus">
														<img
															src=" <c:url value="/resources/custom/icon/plus.svg"/>"
															style="width: 20px; height: 20px" />
													</div>
												</div>
											</div>
										</div>
										<div class="h_row_center"
											style="position: relative; width: 100%; height: 70px; border-top: 1px solid rgb(231, 234, 238);">
											<p class="h_hover_text"
												style="margin-left: 30px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; cursor: pointer;"
												onclick="resetPeople()">초기화</p>
											<div style="position: absolute; right: 20px">
												<div class="request on"
													style="margin-top: 0px; width: 80px; height: 40px; cursor: default;"
													onclick="setPeople()">
													<p class="btn btn-primary" style="color: white">완료</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!---->
								<div style="position: relative;">
									<div class="request on">
										<div class="btn btn-primary"
											style="width: 100%; vertical-align: middle;" id="reserve_btn">
											<p
												style="width: 100%; margin-bottom: 0px; min-height: 33px; line-height: 33px">예약
												하기</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="interest_info"
							style="width: 100%; height: 0px; position: relative; display: none;">
							<div class="h_column_center"
								style="position: absolute; z-index: 1; left: 12px; bottom: -16px; width: 193px;">

								<div class="triangle-with-shadow-down blue"
									style="margin-top: -1px"></div>
							</div>
						</div>
						<div class="h_row_center"
							style="margin-top: 16px; width: 100%; height: 52px">
							<div id="bookmark_btn" class="h_center bookmark"
								onclick="yourplaceBookmark()"
								style="width: 193px; margin-right: 15px; height: 100%; border-radius: 8px; background-color: rgb(250, 251, 251); cursor: pointer;">
								<div class="h_row_center">
									<c:choose>
										<c:when test="${bookmark eq false}">
											<img
											src=" <c:url value="/resources/custom/icon/bookmark_g.png"/>"
											style="width: 24px; height: 24px; margin-right: 10px" id="bookmark_img"/>	
										</c:when>
										<c:otherwise>
											<img
												src=" <c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>"
												style="width: 24px; height: 24px; margin-right: 10px" id="bookmark_img"/>
										</c:otherwise>
									</c:choose>
									
									<p
										style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(69, 75, 80); margin-bottom: 0px;">
										관심장소</p>
								</div>
							</div>
							<div
								onclick="hourplace_v2.userLog('W', '/place/29386', 'click', 'place', 'share')"
								data-clipboard-text="https://hourplace.co.kr/place/29386"
								class="h_center btn_share"
								style="width: 193px; height: 100%; border-radius: 8px; background-color: rgb(250, 251, 251); cursor: pointer;">
								<div class="h_row_center" onclick="copyUrl()">
									<img
										src=" <c:url value="/resources/custom/icon/share_454B50.svg"/>"
										style="width: 24px; height: 24px; margin-right: 10px" />
									<p
										style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(69, 75, 80); margin-bottom: 0px;">
										공유하기</p>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<div class="direct_phone h_center"
			style="position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; display: none; z-index: 9999; background-color: var(- -opacity-black-60);">
			<div
				style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<div class="h_center"
					style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;">
					<img src="<c:url value="/resources/custom/icon/close.svg"/>"
						style="width: 24px; height: 24px" />
				</div>
				<div
					style="margin-top: 30px; padding: 0px 40px 40px; margin-bottom: 10px;">
					<div class="h_row">
						<div class="h_center"
							style="width: 80px; height: 80px; border-radius: 50%; background-color: rgb(239, 243, 245);">
							<img src="//s3.hourplace.co.kr/web/images/emoji/23.svg"
								style="width: 45px; height: 45px" />
						</div>
						<div
							style="width: calc(100% - 100px); margin-left: 20px; position: relative;">
							<p class="h_ellipsis_2"
								style="font-style: normal; font-weight: 500; font-size: 15px; line-height: 24px; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
								12평 카페 ☆통대관☆해드립니다(주방포함)</p>
							<p
								style="position: absolute; bottom: 0px; font-style: normal; font-weight: bold; font-size: 18px; line-height: 26px; letter-spacing: -0.1px; color: rgb(27, 29, 31);"></p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="photo_feedback h_center"
			style="position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; display: none; z-index: 9999; background-color: var(- -opacity-black-60);">
			<div
				style="position: relative; width: 750px; height: 576px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<!---->
				<div class="h_center"
					style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;">
					<img src=" <c:url value="/resources/custom/icon/close.svg"/>"
						style="width: 24px; height: 24px" />
				</div>
				<div style="margin-top: 30px; padding: 0px 40px; height: 100%">
					<div class="h_row_center" style="width: 100%">
						<div id="flipsnap_photo_big_prev" class="h_center"
							style="width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px; margin-right: 20px;">
							<img
								src=" <c:url value="/resources/custom/icon/chevron_left_g.svg"/>"
								id="flipsnap_photo_big_prev_img"
								style="width: 16px; height: 16px" />
						</div>
						<!---->
						<div id="flipsnap_photo_big_next" class="h_center"
							style="margin-left: 20px; width: 40px; height: 40px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255); border-radius: 20px;">
							<img
								src="<c:url value="/resources/custom/icon/chevron_left_g.svg"/>"
								id="flipsnap_photo_big_next_img"
								style="width: 16px; height: 16px; transform: rotate(180deg)" />
						</div>
					</div>
					<!---->
				</div>
			</div>
		</div>
		<div class="photo_feedback_v2 h_center"
			style="position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; display: none; z-index: 9999; background-color: var(- -opacity-black-60);">
			<div
				style="position: relative; width: 750px; height: 576px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<!---->
				<div class="h_center"
					style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;">
					<img src="<c:url value="/resources/custom/icon/close.svg"/>"
						style="width: 24px; height: 24px" />
				</div>
				<!---->
			</div>
		</div>
		<div class="h_column_center"
			style="position: fixed; width: 49px; height: 192px; padding-right: 1px; right: -1px; bottom: 60px; background: rgb(255, 255, 255); border: 1px solid rgb(223, 226, 231); border-bottom-left-radius: 8px; border-top-left-radius: 8px; z-index: 1;">
			<div id="bookmark_29386" class="h_center bookmark"
				style="width: 48px; height: 48px; cursor: pointer" onclick="yourplaceBookmark()">
				<img
					src="<c:url value="/resources/custom/icon/bookmark_bl_v4.svg"/>"
					style="width: 24px; height: 24px" id = "bookmark_img2"/>
			</div>
			<div data-clipboard-text="https://hourplace.co.kr/place/29386"
				class="h_center btn_share"
				style="width: 48px; height: 48px; cursor: pointer">
				<img src="<c:url value="/resources/custom/icon/share_v5.svg"/>"
					style="width: 24px; height: 24px" />
			</div>
			<div onclick="$(document).scrollTop(0);" class="h_center"
				style="width: 48px; height: 48px; cursor: pointer">
				<img src="<c:url value="/resources/custom/icon/scroll_top_v2.svg"/>"
					style="width: 24px; height: 24px" />
			</div>
			<div onclick="$(document).scrollTop($(document).height());"
				class="h_center" style="width: 48px; height: 48px; cursor: pointer">
				<img
					src="<c:url value="/resources/custom/icon/scroll_down_v2.svg"/>"
					style="width: 24px; height: 24px" />
			</div>
		</div>
	</div>
	
	<script>
      $(document).ready(function(){
        var glob;
        var availableTime; // 선택가능 시간목록.
        $.noConflict();
        $('.flipsnap_list').slick({
        	infinite:true,
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            /* fade: true, */
            asNavFor: '.flipsnap_sub_list'
          });
         $(".flipsnap_sub_list").slick({
          infinite:true,
          slidesToShow: "${placeInfo.imgCnt}",
          slidesToScroll: 1,
          nextArrow:$('.next'),
          prevArrow:$('.prev'),
          asNavFor: '.flipsnap_list',
          centerMode: true,
          focusOnSelect: true
         });
         //지도 숨김.
         document.getElementById('place_map').style.display = 'none';

      });
      
    </script>
	<script>
      //라디오 버튼 클릭시.
      $(".form-check-input").click(function(){
        hideBooking(".booking_calendar");
        var rdId = $(".form-check-input:checked").next().attr("class");
        var valueRdId = $("."+rdId).val();
        console.log(rdId);
        console.log(valueRdId);
        //선택된 세부 방 정보에 따라서 , 기본 인원, 추가된가격으로인한 기본가격 변경등이 행해져야한다.
        var rdId = $(".form-check-input:checked").next().attr("class");
        var valueRdId = $("."+rdId).val();
        $.ajax({
          type:"POST",
        url:"http://localhost:8080/getDetailInfo.do",
        dataType:"json",
        async:false,
        contentType: "application/json",
        data: JSON.stringify({"placeNum":24, "detailNum":valueRdId}),
        success:function(data){
          //성공적으로 서버로부터 세부방정보에대해 전달 받는다면.
          console.log(data);
          $("#place_price").text(data.totalPrice);
          var tempId = $(".form-check-input:checked").next().next().attr("class");
          $("."+tempId).val(data.defaultCapa);
          
        }
      });
      });

    </script>
	<script>
      //토글에 관하여 처리할 함수.
      function toggleBooking(e){
        $(e).toggle();
      }
      function hideBooking(e){
        $(e).hide();
      }
      $("#bookingPeople").click(function(){
        hideBooking(".booking_calendar");
        toggleBooking(".booking_people");
      });
      $("#bookingCalendar").click(function(){
        const st = document.getElementById('start_time');
        st.disabled = true;
        const et = document.getElementById('end_time');
        et.disabled = true;
        hideBooking(".booking_people");
        toggleBooking(".booking_calendar");
      });

      $("#people_plus").click(function(){
        var t = parseInt($("#select_search_people").val())+1;
        console.log(t);
        $("#select_search_people").val(t);
      });

      $("#people_minus").click(function(){
        var t = parseInt($("#select_search_people").val())-1;
        if(t <= 0){
          t = 1;
        }
        console.log(t);
        $("#select_search_people").val(t);
      });

      function resetPeople(){
        $("#select_search_people").val("1");
        $("#select_search_people").attr("placeholer","1");
      }
      function setPeople(){
        var t = $("#select_search_people").val();
        $("#people_cnt").text(t);
        toggleBooking(".booking_people");
      }
    </script>

	<script type="text/javascript">
    $.noConflict();
      var date = new Date();
      var disabledDays = [0, 6];
      var dp = $('.date_picker').datepicker({
        //년-월-일
      startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
      minDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
      maxDate: new Date(date.getFullYear(), date.getMonth()+1, date.getDate()+10),
      language: 'ko',
    onSelect: function (date) {
      console.log("날짜가 클릭되었어.");
      var startNum = date;
      console.log(date);
      glob = date;
      let dateArr = date.split("-");
      $("#rsv_year").val(dateArr[0]);
      $("#rsv_month").val(dateArr[1]);
      $("#rsv_date").val(dateArr[2]);
      
      const st = document.getElementById('start_time');
      st.disabled = false;
      //날짜를 클릭하면 ajax start 선택가능 시간을 받아와야한다. - ajax시작.
      //var allowTimes=['7:00','8:00','9:00','10:00','11:00','12:00',
        //              '13:00','14:00','15:00','16:00','17:00','18:00','19:00',
          //          '20:00','21:00','22:00'];
      
      var allowTimes=['7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'];
      //최소 예약 가능시간.
      var defaultTime = ${placeInfo.placeMinTime};
     console.log("최소예약시간은 : ${placeInfo.placeMinTime}");
      //예약되어 있는 시작시간
      var reserveStartTime=[];
      // var reserveStartTime=[];
      //예약 불가능한 시작시간.
      var denyStartTime=[];
      //예약되어 있는 종료 시간.
      var reserveEndTime=[];
      // var reserveEndTime=[];
      //예약이 불가능한 종료시간.
      var denyEndTime=[];
      //예약가능 시작시간
      var allowStartTime=[];
      //예약가능 종료시간.
      var allowEndTime=[];
      
      let firstTimeArr = allowTimes[0].split(":");
      let fisrtTime = parseInt(firstTimeArr[0]);
      let placeNum = parseInt($("#place_num").val());

      var rdId = $(".form-check-input:checked").next().attr("class");
      var valueRdId = $("."+rdId).val();
      console.log("value : " + valueRdId);
      //선택된 날짜를 서버로 전송한다.
      $.ajax({
        type:"POST",
        url:"/getReservation.do",
        dataType:"json",
        async:false,
        contentType: "application/json",
        data: JSON.stringify({"rsvYear":dateArr[0],"rsvMonth":dateArr[1],"rsvDate":dateArr[2],"placeNum":"${placeInfo.placeNum}","detailNum":valueRdId}),
        success:function(data){
          //성공적으로 서버로부터 예약되어 있는 시간을 받는다면,
          if(data.length > 0){
            for(var i in data){
            //예약된 시간을 시작, 끝 시간으로 분리하여 각 배열에 저장한다.
            reserveStartTime.push(data[i].rsvStartT);
            reserveEndTime.push(data[i].rsvEndT); 
          }
          }else{
           reserveStartTime=[];
           reserveEndTime=[]; 
          }
          
        }
      });
      console.log("rsvStartTimeArr : "+reserveStartTime);
      console.log("rsvEndTimeArr : "+reserveEndTime);

      //예약 불가능한 시작시간 계산.
      for(i = 0; i < reserveStartTime.length; i++){
        for(j = defaultTime; j > 1; j--){
          let tempTime = parseInt(reserveStartTime[i])-(j-1);
          if(tempTime < fisrtTime) continue;
          denyStartTime.push(tempTime);
        }
        denyStartTime.push(reserveStartTime[i]);
        for(h = parseInt(reserveStartTime[i])+1; h < parseInt(reserveEndTime[i]); h++ ){
          var temp = h;
          denyStartTime.push(h);
        }
      }
      for(i = parseInt(allowTimes[allowTimes.length-1]); i > (parseInt(allowTimes[allowTimes.length-1])-defaultTime); i--){
        denyStartTime.push(i);
      }
      //영업종료 시간 찾기.
      //중복 제거.
      const set = new Set(denyStartTime);
      denyStartTime = [...set];
      denyStartTime = denyStartTime.sort(function(a, b)  {
                  if(a > b) return 1;
                  if(a === b) return 0;
                  if(a < b) return -1;
                    });
      console.log("선택불가 시작시간 : " + denyStartTime);
      //예약 가능한 시작시간 계산.시작
      for(var i in allowTimes){
        var flag = false;
        for(var j in denyStartTime){
          if(parseInt(allowTimes[i]) === denyStartTime[j]){
            flag = true;
          }
        }
        if(!flag){
          allowStartTime.push(allowTimes[i]);
        }
      }
      const localToday = new Date().toLocaleDateString().split(".");
      const todayYear = localToday[0].trim();
      var todayMonth = localToday[1].trim();
      todayMonth = ('0' + todayMonth).slice(-2);
      var todayDate = localToday[2].trim();
      todayDate = ('0' + todayDate).slice(-2);
      const today = todayYear + "-" + todayMonth + "-" + todayDate;
      const hourNow = ('0' + new Date().getHours()).slice(-2);
      var checkTodayTime = [];
      /* if(date === today){
        for(var k = 0 ; k < allowStartTime.length; k++){
          console.log("hourNow : " + hourNow + "  allowStartTime["+ k + "] : " + allowStartTime[i]);
          if(parseInt(hourNow) < allowStartTime[k]){
            console.log("     in -> hourNow : " + hourNow + "  allowStartTime["+ k + "] : " + allowStartTime[k]);
            checkTodayTime.push(allowStartTime[k]);
          }
        }
        allowStartTime = checkTodayTime;
      } */
      
      //예약 가능한 시작시간 계산.끝
      console.log(allowStartTime);
      var minT = '';
      if(date === today){
        minT = new Date().getHours();
        minT = minT + ":00";
      }else{
    	  minT ='07:00';
      }
      $("#start_time").datetimepicker({
        datepicker:false,
        format:'H:00',
        minTime:minT,
        // minTime:new Date(),
        // maxTime:'22:00',
        allowTimes:allowStartTime,
        
        onChangeDateTime:function(dp,$input){
          //시작시간 선택시.
          allowEndTime =[];
          //예약 불가 종료시간 계산.시작
          //만약 예약된 시간이 해당 날짜에 존재한다면.
          
          if(reserveStartTime.length > 0){
            var startPickArr = $("#start_time").val().split(":");
            
            var startPickTime = parseInt(startPickArr[0]);
            var tempEndTime;
            var flag = false;
            for(i = 0; i < reserveStartTime.length; i++){
              if(startPickTime < parseInt(reserveStartTime[i])){
                flag = true;
                tempEndTime = parseInt(reserveStartTime[i]);
                for(i = startPickTime+1; i <= tempEndTime;i++ ){
                allowEndTime.push(i+":00");
                console.log("예약시간보다 작음 : " + allowEndTime);
              }
                break;
              }
            }
            if(!flag){
              for(i = startPickTime+1; i <= parseInt(allowTimes[allowTimes.length-1]);i++ ){
                allowEndTime.push(i+":00");
                console.log("예약시간보다 작은적없음. : " + allowEndTime);
              }
            }
            
          }else{
            //선택된 날짜에 예약된 시간이 없다면,
            var startPickArr = $("#start_time").val().split(":");
            var startPickTime = parseInt(startPickArr[0]);
            console.log(startPickTime);
            for(i = startPickTime+1; i <= parseInt(allowTimes[allowTimes.length-1]);i++ ){
                allowEndTime.push(i+":00");
              }
              console.log("예약시간이 없음. : " + allowEndTime);
          }
          //예약 불가 종료시간 계산.끝
          $("#end_time").val('');
          const et = document.getElementById('end_time');
          et.disabled = false;
          console.log(allowEndTime);
          $("#end_time").datetimepicker({
              datepicker:false,
              format:'H:00',
              minTime:'07:00',
              maxTime:'23:00',
              allowTimes:allowEndTime,
              onChangeDateTime:function(dp,$input){
                //종료시간 선택시.
                console.log('starttime : '+$("#start_time").val()); 
                console.log($input.val());
                
              }
            });
        }
        
      });
      
      //----ajax end
    }
    });
    </script>
	<script>
   
      //날짜  . 시간 . 종료시간 . 선택 후 완료 클릭 시 
      $("#time_btn").click(function(){
        var stArr = $("#start_time").val().split(":");
        var etArr = $("#end_time").val().split(":");
        console.log(parseInt(etArr[0])-parseInt(stArr[0]));
        if(parseInt(etArr[0])-parseInt(stArr[0]) == 1){
          swal("","최소 예약시간 이상 선택해주세요.","warning");
          $("#start_time").focus();
        }else{
        	var rst = glob + "/  " + $("#start_time").val() + "~" + $("#end_time").val();
            
            $("#form_start_time").val(parseInt(stArr[0]));
            $("#form_end_time").val(parseInt(etArr[0]));
            
            $("#schedule").text(rst);
            hideBooking(".booking_calendar");
            console.log(rst);	
        }
        
      });
      function resetDateTime(){
        $("#start_time").val('');
        $("#end_time").val('');
      }
    </script>
	<script>
      $("#reserve_btn").click(function(){
        //예약하기 버튼 클릭시.
        if(parseInt($("#people_cnt").text()) < ${placeInfo.placeCapa}){
        	swal("","기본 ${placeInfo.placeCapa}인 이상 부터 예약 가능합니다.","warning");
        	$("#people_cnt").focus();
        }else{
        	var beginTime = $("#form_start_time").val();
            var endTime = $("#form_end_time").val();
            var detailNum = $("input[name=flexRadio]:checked").next().val();
            var detailTitle = $("input[name=flexRadio]:checked").next().next().next().text().trim();
            console.log(detailTitle);
            $("#detail_num").val(detailNum);
            $("#rst_price").val($("#place_price").val());
            $("#head_count").val(parseInt($("#people_cnt").text()));
            $("#form_detail_title").val(detailTitle);
            $("#host_nick_name").val($("#nickName").text());
            $("#detail_form").submit();
            	
        }
        
      });
    </script>
	<!-- 최신순, 추천순. -->
	<script>
    
    var align_btn = document.getElementsByClassName("align_btn");

    function handleClick(event) {
      console.log(event.target);
      console.log($(this).attr("id"));
      // console.log(this);
      console.log($(this).text().trim());//클릭된 거의 값.
      // 콘솔창을 보면 둘다 동일한 값이 나온다

      console.log(event.target.classList);

      if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
      } else {
        for (var i = 0; i < align_btn.length; i++) {
        	align_btn[i].classList.remove("clicked");
        }
        event.target.classList.add("clicked");
      } 
      
      if(!event.target.classList.item("clicked")){
    	  console.log("추천순이야!!!");
      }
      
    }
    

    function init() {
      for (var i = 0; i < align_btn.length; i++) {
    	  align_btn[i].addEventListener("click", handleClick);
      }
    }

    init();
    </script>
    <!-- 리뷰 스크립트 -->
	<script>
    function moreReviews(){
    	var nickName='test';
    	var regDate='2020.01.01';
    	var content='hello';
    	var helpCnt=0;
     	var rsvNum = 'rsvNum';
    	var userId = 'userId';
    	
    	//서버로 전송되야 하는 정보 :
    	var rowNum = parseInt($("#row_num").val())+5;
    	
    	console.log(rowNum);
    	$.ajax({
            type:"GET",
            url: "/moreReviews.do?rn="+rowNum+"&pn=${placeInfo.placeNum}",
            async:false,
            contentType: "application/json",
            success:function(data){
            	console.log(data.length);
            	if(data.length != 0){
            		$("#row_num").val(rowNum);
            		console.log(data);
            		for(i = 0; i < data.length ; i++){
            			nickName = data[i].userNickName;
            			regDate = data[i].reviewGuestRegd;
            			content = data[i].reviewGuestWr;
            			helpCnt = data[i].helpCnt;
            			rsvNum = data[i].rsvNum;
            			console.log(rsvNum);
            			userId = data[i].userId;
            			var definedId = rsvNum +"/"+userId;
            			console.log(definedId)
            			var partOne =
            	    	    "<div style='margin-top: 5px'><div" +
            	    	    " style='margin-top: 30px; width: 100%; padding-bottom: 32px; border-bottom: 1px solid rgb(231, 234, 238);'>" +
            	    	    "<div class='h_row' style='justify-content: space-between'>" +
            	    	    "<p" +
            	    	    " style='font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);'>" +
            	    	    nickName+"</p>" +
            	    	    "<p" +
            	    	    " style='font-style: normal; font-weight: normal; font-size: 14px; line-height: 22px; color: rgb(158, 164, 170);'>" +
            	    	    regDate+"</p>" +
            	    	    "</div>" +
            	    	    "<div style='margin-top: 6px'>" +
            	    	    "<div class='review_star'>";

            	    	  var star =
            	    	    "<img src=' <c:url value='/resources/custom/icon/gold_star.png'/>' style='width: 18px; height: 18px;' />";

            	    	  var partTwo =
            	    	    "</div>" +
            	    	    "</div>" +
            	    	    "<div class='h_row' style='justify-content: space-between'>" +
            	    	    "<p" +
            	    	    " style='margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(114, 120, 127);'>" +
            	    	   content+"</p>" +
            	    	    "<div" +
            	    	    " style='min-width: 56px; width: 100px; height: 56px; margin-left: 0px; border-radius: 4px; overflow: hidden; cursor: pointer;'>" +
            	    	    "</div>" +
            	    	    "</div>" +
            	    	    "<div class='h_row_center' style='margin-top: 16px; padding: 12px; position: static; min-width: 77px; width: fit-content; height: 29px; left: 0px; top: 76px; box-sizing: border-box; border-radius: 4px; cursor: pointer; border: 1px solid rgb(223, 226, 231);'>" +
            	    	    "<div class='h_row_center'" +
            	    	    " style='font-style: normal; font-weight: 500; font-size: 12px; line-height: 14px; color: rgb(114, 120, 127); '>" +
            	    	    "<p style='margin-bottom:0px'"+
            	    	    "id='"+rsvNum+"'"+
            	    	    " onclick="+"'helpClick(\""+ rsvNum + "\",\""+userId+"\")'"+
            	    	    ">도움돼요 "+
            	    	    helpCnt+
            	    	    "</p>" +
            	    	    "</div>" +
            	    	    "</div>" +
            	    	    "</div>" +
            	    	    "</div>";
            			var starResult = '';
            			for(j = 0; j < data[i].reviewGuestRate; j++){
            				starResult += star;
            			}
            			
            			var rst = partOne + starResult+ partTwo;
            			$("#feedback").append(rst);
            		}
            		
            	}else{
            		swal("","더이상 리뷰가 존재하지 않습니다.","warning");
            	}
            	
            }
          });
    }
    
    function helpClick(rsvNum, userId){
    	//예약번호, 작정자 아이디, 그리고 클릭한 유저 아이디가 필요하다 따라서 세션에 존재하는지확인해야한다.
    	var sessionUser ="${userVO.userId}"; 
    	if(!sessionUser){
    		swal("","로그인 후 클릭 가능합니다.","warning");
    	}else{
    		console.log(rsvNum + " " + userId );
    		$.ajax({
                type:"GET",
                url: "/clickHelp.do?rsvNum="+rsvNum+"&userId="+userId+"&clickedUserId="+sessionUser,
                async:false,
                contentType: "application/json",
                success:function(data){
                	var helpCnt = data.helpCnt;
                	console.log(helpCnt);
                	$("#"+rsvNum).text("도움돼요 "+ helpCnt);
                }
    		});
    	}
	    
    }
    </script>
    <!-- 북마크 처리. -->
    <script>
    function yourplaceBookmark(){
    	console.log("bookmark Clicked");
    	var sessionUser ="${userVO.userId}"; 
    	if(!sessionUser){
    		swal("","로그인 후 관심장소 등록이 가능합니다.","warning");
    	}else{
    		$.ajax({
                type:"GET",
                url: "/bookmark.do?userId="+sessionUser+"&placeNum=${placeInfo.placeNum}",
                async:false,
                contentType: "application/json",
                success:function(data){
                	if(data === 'addBookmark'){
                		console.log("bookmark!!!");
                		
                		$("#bookmark_img").attr("src",'<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>');
                		$("#bookmark_img2").attr("src",'<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>');
                	}else{
                		$("#bookmark_img1").attr("src",'<c:url value="/resources/custom/icon/bookmark_g.png"/>');
                		$("#bookmark_img2").attr("src",'<c:url value="/resources/custom/icon/bookmark_g.png"/>');
                	}
                }
    		});	
    	}
    	
    }
    </script>
    <!-- 지도 스크립트 시작. -->
   	<script>
   			
   	function toggleMap(r){
        $(r).toggle();
      }
      function toggle_open_map(){
        console.log("지도보기클릭");
        const pm = document.getElementById('place_map');
        pm.disabled = true;
        toggleMap("#place_map");
      }
	
      // 지도 api 불러오기 
      var mapContainer = document.getElementById("map");
      var mapOptions = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3,
      };
      
      var map = new kakao.maps.Map(mapContainer, mapOptions);
      
      // 장소로 부드럽게 이동하는 메서드 임시 보류
      function panTo() {
          // 이동할 위도 경도 위치를 생성합니다 
          var moveLatLon = new kakao.maps.LatLng(33.450701, 126.570667);
          
          // 지도 중심을 부드럽게 이동시킵니다
          // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
          map.panTo(moveLatLon);            
      }    
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      var Addr = $('#place_addr').text();
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(Addr, function(result, status, panTo) {

          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {

              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
             // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px; text-align:center; color: rgb(36, 111, 248);">장소 위치</div>'
              });
              infowindow.open(map, marker);
              
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords); 
          } 
      });
      // ---- kakao 지도 api 끝 

   	
   	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>
