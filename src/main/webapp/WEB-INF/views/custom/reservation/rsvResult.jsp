<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/detail-place.css" />" />
<title>YourPlace 결제 완료 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!--jquery 밑에.-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
</style>
<style type="text/css">
#d1 {
	width: 770px;
	margin: 0 auto;
}
</style>
</head>
<body style="min-height: 1000px">
	<%@ include file="../header.jsp"%>
	<div id="main_vue" class="h_column_center" style="min-height: 1000px;">
		<div style="width: 1160px;">
			<p class="h_center"
				style="margin-top: 50px; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
				결제완료</p>
			<div
				style="margin-top: 30px; width: 100%; height: 1px; background-color: rgb(40, 121, 227);"></div>
			<div class="h_row_center" style="margin-top: 19px; height: 24px">
				<div class="h_row_center" style="cursor: pointer">

				</div>
			</div>
			<div class="h_row" style="width: 100%">
				<div style="position: relative; width: 720px">
					<div class="h_row_center"
						style="position: absolute; top: -10px; right: 0px;">

					</div>


					<div class="flipsnap_container"
						style="margin-top: 20px; overflow: hidden; width: 100%; height: 220px; border-radius: 6px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
						<!--상단 큰 이미지 리스트 영역.-->
						<!--상단과 하단에 같은 이미지를 같은 순서대로 나열해야 한다.-->

						<h4
							style="margin-left: 30px; margin-top: 20px; margin-bottom: 20px; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">예약
							공간</h4>
						<div
							style="margin-top: 10px; margin-left: 20px; margin-right: 20px; width: 94%; height: 1px; background-color: rgb(149, 183, 227);">
						</div>

						<div class="list_wrap"
							style="margin-left: 40px; margin-top: 20px;">
							<dl class="flex_box refund" style="margin: 10px 0; padding: 0px;">
								<dt class="flex tit" style="font-size: 20px;">장소명</dt>
								<dd class="flex" style="font-size: 20px;">
									${placeInfo.placeName} <a href="/detailPlaceForm.do?placeNum=${placeInfo.placeNum }" class="move_link">[상세보기로
										이동]</a><br>
								<dt class="flex tit" style="font-size: 28px;">예약이 확정되었습니다.</dt>
								</dd>
							</dl>

							<!--reserve 테이블에 없을시 join으로 place 테이블 조회-->


							<!--장소 상세보기 페이지로 링크 처리 방식 찾기 .-->
							</dd>
							</dl>

						</div>
						<div class="h_row_center"
							style="position: absolute; margin-top: 30px; height: 60px; width: 100%;">

						</div>



					</div>
					<!--여기 하단부터 반복 복사-->
					<!--1. 예약내용 div-->
					<div style="width: 100%; margin-top: 50px">
						<div
							style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
							<div style="margin: 30px">

								<div class="h_row_center"
									style="margin-top: 8px; flex-wrap: wrap">


								</div>
								<div
									style="margin-top: 8px; display: flex; flex-direction: row; align-items: flex-end;">
									<p
										style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
										예약 내용</p>


								</div>
								<div
									style="margin-top: 10px; width: 100%; height: 1px; background-color: rgb(149, 183, 227);"></div>

								<!--예약 내용 부분-->
								<article class="box_form box_notice"
									style="position: relative; padding-left: 0px; font-size: 18px">

									<div class="list_wrap">
										<!---->
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">예약일</dt>
											<dd class="flex">${placeInfo.reservationDate}&nbsp;&nbsp;${placeInfo.reservationTime}</dd>
											<!--${reserve.rsvYear}.${reserve.rsvMonte}.${reserve.rsvDate}일 -->
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">예약공간</dt>
											<dd class="flex">
												${placeInfo.placeName }
												<!--${reserve.placeNum} .-->
											</dd>
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">예약인원</dt>
											<dd class="flex">${placeInfo.headCount }명</dd>
											<!--${reserve.personNum}명-->
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">요청사항</dt>
											<dd class="flex">${placeInfo.rsvRequest }</dd>
											<!--${reserve.rsvRequest}명-->
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">사용목적</dt>
											<dd class="flex">${placeInfo.rsvPurpose }</dd>
											<!--${reserve.purPose}명-->
										</dl>
									</div>
								</article>



							</div>
						</div>
					</div>
					<!--예약내용 끝-->

					<!--2. 예약자 정보-->
					<div style="width: 100%; margin-top: 50px">
						<div
							style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
							<div style="margin: 30px">

								<div class="h_row_center"
									style="margin-top: 8px; flex-wrap: wrap">


								</div>
								<div
									style="margin-top: 8px; display: flex; flex-direction: row; align-items: flex-end;">
									<p
										style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
										예약자 정보</p>


								</div>
								<div
									style="margin-top: 10px; width: 100%; height: 1px; background-color: rgb(149, 183, 227);"></div>


								<article class="box_form box_notice"
									style="position: relative; padding-left: 0px; font-size: 18px">

									<div class="list_wrap">
										
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">예약자명</dt>
											<dd class="flex">${placeInfo.rsvName}</dd>
											<!--${reserve.userName}-->
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">연락처</dt>
											<dd class="flex">
												${placeInfo.rsvTel}
											<!--${reserve.userPw}-->	
											</dd>
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">이메일</dt>
											<dd class="flex">${placeInfo.rsvEmail}</dd>
											<!--${reserve.userEmail}-->	
										</dl>

									</div>
								</article>



							</div>
						</div>
					</div>
					<!--예약자 정보 처리 끝-->

					<!-- 3. 환불규정 안내-->
					<div style="width: 100%; margin-top: 50px">
						<div
							style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
							<div style="margin: 30px">

								<div class="h_row_center"
									style="margin-top: 8px; flex-wrap: wrap"></div>
								<div
									style="margin-top: 8px; display: flex; flex-direction: row; align-items: flex-end;">
									<p
										style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
										환불규정 안내</p>


								</div>
								<div
									style="margin-top: 10px; width: 100%; height: 1px; background-color: rgb(149, 183, 227);"></div>

								<!--예약 내용 부분-->
								<article class="box_form box_notice"
									style="position: relative; padding-left: 0px; font-size: 18px">

									<div class="list_wrap refund_rule">
										<p class="txt_notice refund" style="margin: 0px 10px;">
											<em class="warn"
												style="color: rgb(255, 58, 72); margin: 10px 0; padding: 0px;">이용당일
												이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다. </em> <br />호스트 귀책 사유 취소 시
											100% 환불이 가능합니다.
										</p>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit">
												<p
													style="border-bottom: 1px solid #ebebeb; font-size: 30px;">
													게스트 환불 요청 시</p>
												<p style="color: rgb(36, 111, 248);">사용일 4일 전</p>
											</dt>
											<dd class="flex">총 금액의 100% 환불</dd>
										
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">사용일
												3일 전</dt>
										
											<dd class="flex">환불 불가</dd>
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">사용일
												2일 전</dt>
											
											<dd class="flex">환불 불가</dd>
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">사용일
												전날</dt>
										
											<dd class="flex">환불 불가</dd>
										</dl>
										<dl class="flex_box refund"
											style="margin: 10px 0; padding: 0px;">
											<dt class="flex tit" style="color: rgb(36, 111, 248);">사용일
												당일</dt>
											
											<dd class="flex">환불 불가</dd>
										</dl>
									</div>


								</article>



							</div>
						</div>
					</div>
					<!--환불규정 안내 끝-->

					<!--4. 결제 정보 처리 부분 이벤트단-->
					<div
						style="margin-top: 100px; width: 100%; display: flex; flex-wrap: wrap;"></div>


				</div>
				<div style="width: 400px; margin-left: 40px; position: relative">
					<div class="heading" style="position: relative; margin: 0px;">

						<div class="h_row_center"
							style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">

							<p
								style="margin-left: 10px; margin-bottom: 0; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; font-size: 24px;">
								결제금액</p>

							
						</div>
					</div>
					<div style="width: 100%; margin-top: 20px">
						<div
							style="border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
							<div style="margin: 20px">

								<article class="right_fixed reserve_price"
									style="transition: transform 0.5s cubic-bezier(0.39, 0.575, 0.565, 1) 0s; border-bottom: 0px;">
									<div class="ly_right_wrap">
										<div class="ly_right_fixed">

											<div class="scroll_box">
												<div class="reserve_price_wrap">
													<div class="basic_box">

														<div class="h_row_center"
															style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">
															<p
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center;">
																예약날짜:</p>
															<label
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
																${placeInfo.reservationDate } </label>
														<!--${reserve.rsvYear}.${reserve.rsvMonte}.${reserve.rsvDate}일 -->
														</div>
														<div class="h_row_center"
															style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">
															<p
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center;">
																예약시간:</p>
															<label
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
																${placeInfo.reservationTime }</label>
														<!--${reserve.rsvStartT}시 ~ ${reserve.rsvEndT} 시 까지-->
														</div>
														<div class="h_row_center"
															style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">
															<p
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center;">
																예약인원:</p>
															<label
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
																${placeInfo.headCount}명</label>
														<!--${reserve.personNum}명-->		
														</div>
														<div class="h_row_center"
															style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">
															<p
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center;">
																쿠폰정보:</p>
															<label
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
																${placeInfo.coupName }
																</label>
														<!--${reserve.rsvPayMthd}-->			
														</div>

														<dl class="flex_box refund"
															style="border-bottom: 4px solid rgb(36, 111, 248); width: auto; width: 360px;">
															<p>&nbsp;</p>
														</dl>
														<div class="h_row_center"
															style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">

															<p
																style="margin-left: 10px; margin-bottom: 0; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; font-size: 24px;">
																합계 &#8361;(원):</p>
															<label
																style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248); font-size: 24px;">
																${placeInfo.placePrice }</label>

														</div>
														
													</div>
												</div>
											</div>
										</div>
										
									</div>
									<div class="h_center">
										<div class="h_row_center">
										<!-- 예약 취소 버튼 예약 진행중 페이지로-->
										<a href="/goreserve.do?userId=${userVO.userId}" style="text-decoration: none; color: black;">
											<button class="btn_cancle"
												style="width: 180px; height: 50px; font-size: 20px;">예약취소</button>
												</a>
											<!--메인으로 가는 버튼-->
											<a href="/home.do" style="text-decoration: none; color: black;">
											<button class="btn_goto_main" 
												style="width: 180px; height: 50px; font-size: 20px;">메인으로
											</button>
											</a>
											<!---->
										</div>
									</div>
							</div>
						</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>

<script>

</script>
<!-- 결제 모듈. -->

</html>