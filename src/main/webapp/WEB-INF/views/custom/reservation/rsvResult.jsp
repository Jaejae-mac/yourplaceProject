<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ResultView</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/bodyfont.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/rsv-result.css" />" />
</head>
<body class="pc">
	<%@ include file="../header.jsp" %>
	<div id="__nuxt">
		<!-- Header -->
		<!-- position fixed 또는 absolute 주고 상단헤더값(height: 100px) 만큼  main 에서 빼주기 -->

		<div id="__layout" style="margin-top:150px">
			<div id="content_wraper" role="main" class="">
				<div class="banner_image">
					<div
						style="position: relative; width: 1280px; height: 100%; margin: auto;">
						<div style="margin-left:80px">
							<h3 style="font-size:20px">${reserve.placeName }</h3>
						</div>
						<div style="margin-left:80px;margin-top:10px">
							<h3 style="font-size:20px">예약이 확정되었습니다.</h3>
						</div>
					</div>
				</div>
			</div>

			<div id="main_body" style="position: relative">
				<div
					style="flex-direction: row; display: flex; justify-content: center; height: 50px;">
					<p></p>
				</div>
			</div>

			<div class="result_area">
				<div class="inner_width">
					<div class="detail_forms">
						<!--예약 정보 article-->
						<!--for each 시작점 ex) var="reserve" items="${reserveList}"> -->
						<article class="box_form box_notice">
							<div class="heading">
								<h3>예약 내용</h3>
								<p class="text_rounded">
									예약번호 : <strong>${reserve.rsvNum}</strong>
								</p>
							</div>
							<div class="list_wrap">
								<!---->
								<!---->
								<!---->
								<dl class="flex_box refund">
									<dt class="flex tit">예약일</dt>
									<dd class="flex">
										${reserve.rsvYear}.${reserve.rsvMonte}.${reserve.rsvDate}</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">예약공간</dt>
									<dd class="flex">
										${reserve.placeName}
										<!--reserve 테이블에 없을시 join으로 place 테이블 조회-->

										<a href="" class="move_link">[상세보기로 이동]</a>
										<!--장소 상세보기 페이지로 링크 처리 방식 찾기 .-->
									</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">예약내용</dt>
									<dd class="flex">
										${reserve.rsvYear}.${reserve.rsvMonte}.${reserve.rsvDate}
										${reserve.rsvStartT}시 ~<br /> ${reserve.rsvEndT} 시 까지
									</dd>
									<!---->
									<!---->
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">예약인원</dt>
									<dd class="flex">예약 인원 테이블이 없는것 같아 보류</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">추가옵션</dt>
									<dd class="flex"></dd>
									<dd class="flex">추가 옵션 테이블이 없는것 같아 보류</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">요청사항</dt>
									<dd class="flex">${reserve.rsvRequest}</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용목적</dt>
									<dd class="flex">${reserve.purpose}</dd>
								</dl>
							</div>
						</article>
						<article class="box_form box_notice">
							<div class="heading">
								<h3>예약자 정보</h3>
							</div>
							<div class="list_wrap">
								<dl class="flex_box refund">
									<dt class="flex tit">예약자명</dt>
									<dd class="flex">${reserve.rsvName}</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">연락처</dt>
									<dd class="flex">${reserve.userTel}</dd>
									<!--reserve 테이블에 없을시 join으로 member 테이블 조회-->
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">이메일</dt>
									<dd class="flex">${reserve.userEmail}</dd>
									<!--reserve 테이블에 없을시 join으로 member 테이블 조회-->
								</dl>
							</div>
						</article>
						<!--</foreach> -->

						<!--환불 규정 article-->
						<article class="box_form box_notice">
							<div class="heading">
								<h3>환불규정 안내</h3>
							</div>
							<div class="list_wrap refund_rule">
								<p class="txt_notice refund">
									<em class="warn" style="color: rgb(255, 58, 72)">이용당일(첫 날)
										이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</em> <br />호스트 귀책 사유 취소 시 100%
									환불이 가능합니다.
								</p>

								<dl class="flex_box refund">
									<p>게스트 환불 요청 시</p>
									<!---->
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용일 4일 전</dt>
									<dd class="flex">총 금액의 100% 환불</dd>
									<!---->
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용일 3일 전</dt>
									<!---->
									<dd class="flex">환불 불가</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용일 2일 전</dt>
									<!---->
									<dd class="flex">환불 불가</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용일 전날</dt>
									<!---->
									<dd class="flex">환불 불가</dd>
								</dl>
								<dl class="flex_box refund">
									<dt class="flex tit">사용일 당일</dt>
									<!---->
									<dd class="flex">환불 불가</dd>
								</dl>
							</div>
							<!---->
						</article>

						<!--결제 article-->
						<!--for each 시작점 ex) var="reserve" items="${reserveList}"> -->
						<article class="box_form right_fixed reserve_price"
							style="transition: transform 0.5s cubic-bezier(0.39, 0.575, 0.565, 1) 0s; border-bottom: 0px;">
							<div class="ly_right_wrap">
								<div class="ly_right_fixed">
									<div class="heading">
										<!---->
										<h3>결제금액</h3>
										<!---->
										<div class="reserve_price_btns">
											<a class="btn btn_print">거래명세서 인쇄</a>
											<!--보류-->
											<a class="btn btn_print">카드영수증 조회</a>
											<!--보류-->
											<!---->
										</div>
									</div>
									<div class="scroll_box">
										<div class="reserve_price_wrap">
											<div class="basic_box">
												<dl class="info_date">
													<dt>예약날짜</dt>
													<dd>
														<span class="line"> 2021. 09. 24<!--${reserve.rsvYear}.${reserve.rsvMonte}.${reserve.rsvDate} -->
														</span>
													</dd>
												</dl>
												<dl class="info_date">
													<dt>예약시간</dt>
													<dd>
														<span class="line"> 15시 ~ 17시 까지<!--${reserve.rsvStartT}시 ~ ${reserve.rsvEndT} 시 까지-->
														</span>
													</dd>
												</dl>
												<!---->
												<dl class="info_person">
													<dt>예약인원</dt>
													<dd>보 류</dd>
												</dl>
												<!---->
												<!---->
												<dl>
													<dt>결제정보</dt>
													<dd>
														${reserve.rsvPayMthd}
														<!-- 결제 수단 -->
														<br />
													</dd>
													<!---->
												</dl>												
											</div>
											<!---->
											<!---->
											<div class="total_box">
												<dl class="pull_box">
													<dt class="pull_left">
														<em class="blind"></em><strong class="txt_price">합계 \</strong>
													</dt>
													<dd class="pull_right align_right">
														<strong class="txt_price" style="color:0ba6ff;">30,000</strong>
													</dd>
												</dl>
												<!---->
											</div>
										</div>
										<!---->
										<!---->
									</div>
									<div class="btn_order_area">
										<div class="btn_responsive">
											<a class="btn btn_option1">예약취소</a>
											<!---->
											<a class="btn btn_option2"><span>메인으로 </span></a>
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
	<%@ include file="../footer.jsp" %>
</body>
</html>
