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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/custom/css/bodyfont.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/custom/css/rsv-result.css" />" />
</head>
<body class="pc">
	<div id="__nuxt">
		<!-- Header -->
		<!-- position fixed 또는 absolute 주고 상단헤더값(height: 100px) 만큼  main 에서 빼주기 -->

		<div id="__layout">
			<div id="content_wraper" role="main" class="">
				<div class="banner_image">
					<div
						style="position: relative; width: 1280px; height: 100%; margin: auto;">
						<img src="image/resultbanner.png" />
						<div class="reco_r_title">
							<p>호스트가 등록한 장소 제목</p>
						</div>
						<div class="reco_r_stitle">
							<p>예약이 확정되었습니다.</p>
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
									<em class="warn" style="color: rgb(255, 58, 72)">이용당일(첫
										날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</em> <br />호스트 귀책 사유 취소 시
									100% 환불이 가능합니다.
								</p>

								<dl class="flex_box refund">
									<p>게스트 취소 시</p>
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
												<dl class="info_price">
													<dt class="blind">합계</dt>
													<dd>
														<strong class="txt_price">\17,000</strong>
														<!--${reserve.rsvPay}-->
													</dd>
												</dl>
											</div>
											<!---->
											<!---->
											<div class="total_box">
												<dl class="pull_box">
													<dt class="pull_left">
														<em class="blind">합계</em> <strong class="txt_price">\</strong>
													</dt>
													<dd class="pull_right align_right">
														<strong class="txt_price">${reserve.rsvPay}</strong>
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
											<a class="btn btn_option2"><span
												class="txt_call"><i
													class="sp_icon ico_call_light"></i>전화 </span></a>
											<!---->
										</div>
									</div>
								</div>
							</div>
						</article>
						<!--</foreach> -->

						<!--공간 위치 정보 article-->
						<!--for each 시작점 ex) var="reserve" items="${reserveList}"> -->
						<div class="detail_box map_box type_simple">
							<h4 class="h_intro blind">공간 위치 정보</h4>
							<div class="host_profile">
								<div class="inner">
									<div class="sp_location">
										<p class="sp_name">
											${reserve.placeName}
											<!--reserve 테이블에 없을시 join으로 place 테이블 조회-->
										</p>
										<p class="sp_address">
											${reserve.placeAddr}
											<!--reserve 테이블에 없을시 join으로 place 테이블 조회-->
										</p>
										<!---->
										<p class="sp_call">보류</p>
										<!-- 해당 장소에 대한 번호 정보가 없어 보류-->
									</div>
									<div class="row">
										<div class="col col6">
											<a class="btn btn_rounded btn_call"><span
												class="btn_inner"><i
													class="ico_call sp_icon"></i>전화걸기(보류) </span></a>
										</div>
										<div class="col col6">
											<a
												href="http://map.naver.com/index.nhn?slng=&amp;slat=&amp;stext=&amp;elng=126.91274279&amp;elat=37.54854572&amp;etext=합정역 음악연습실 운 스튜디오&amp;menu=route&amp;pathType=1"
												target="_blank" class="btn btn_rounded btn_way"><span
												class="btn_inner way"><i
													class="ico_way sp_icon"></i>길찾기(보류) </span></a>
										</div>
									</div>
								</div>
							</div>
							<div class="map">
								<!--다음 카카오 api script로  처리하면 됨-->
								<div id="map"
									style="width: 100%; height: 640px; position: relative; overflow: hidden; background: url('https://ssl.pstatic.net/static/maps/mantle/1x/pattern_1.png') 0px 0px repeat transparent;"
									tabindex="0">
									<!-- 지도 api 세부 설정 나중에 api script 설정시 변경할 부분 -->
									<div
										style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0; cursor: url('https://ssl.pstatic.net/static/maps/mantle/1x/openhand.cur'), default;">
										<div
											style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0;">
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1;">
												<div
													style="overflow: visible; width: 100%; height: 0px; position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 0; user-select: none;"></div>
												<div
													style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; user-select: none;">
													<div
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;">
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 298px; left: 169px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55871/25383.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 42px; left: 169px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55871/25382.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 554px; left: 169px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55871/25384.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: -214px; left: 169px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55871/25381.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: -214px; left: 425px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55872/25381.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 554px; left: -87px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55870/25384.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 42px; left: 425px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55872/25382.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 298px; left: -87px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55870/25383.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 298px; left: 425px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55872/25383.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 42px; left: -87px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55870/25382.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 554px; left: 425px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55872/25384.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: -214px; left: -87px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55870/25381.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: -214px; left: 681px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55873/25381.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 554px; left: -343px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55869/25384.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 42px; left: 681px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55873/25382.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 298px; left: -343px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55869/25383.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 298px; left: 681px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55873/25383.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 42px; left: -343px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55869/25382.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: 554px; left: 681px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55873/25384.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
														<div draggable="false" unselectable="on"
															style="position: absolute; top: -214px; left: -343px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
															<img draggable="false" unselectable="on" alt=""
																crossorigin="anonymous" width="256" height="256"
																src="https://nrbe.pstatic.net/styles/basic/1630584268/16/55869/25381.png?mt=bg.ol.sw.ar.lko"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;" />
														</div>
													</div>
												</div>
												<div
													style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 100;">
													<div
														style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 101;"></div>
													<div
														style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 103;">
														<div title="선택 지점"
															style="position: absolute; overflow: hidden; box-sizing: content-box !important; cursor: inherit; left: 345px; top: 273px; width: 36px; height: 47px;">
															<img draggable="false" unselectable="on"
																src="/_nuxt/img/cace91f.png" alt=""
																crossorigin="anonymous"
																style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; position: absolute; cursor: pointer; width: 36px; height: 47px; left: 0px; top: 0px;" />
														</div>
													</div>
													<div
														style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 106;"></div>
												</div>
											</div>
											<div
												style="position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(255, 255, 255); z-index: 10000; opacity: 0.5;"></div>
										</div>
									</div>

									<div
										style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; left: 0px;">
										<div
											style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: left; height: 21px;">
											<div
												style="position: relative; width: 53px; height: 14px; margin: 0px 12px 7px 2px; overflow: hidden; pointer-events: auto;">
												<span
													style="display: block; margin: 0; padding: 0 4px; text-align: center; font-size: 10px; line-height: 11px; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, '나눔고딕', Dotum, '돋움', sans-serif; font-weight: bold; color: #000; text-shadow: -1px 0 rgba(255, 255, 255, 0.3), 0 1px rgba(255, 255, 255, 0.3), 1px 0 rgba(255, 255, 255, 0.3), 0 -1px rgba(255, 255, 255, 0.3);">100m</span><img
													src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-b.png"
													width="45" height="4" alt=""
													style="position: absolute; left: 4px; bottom: 0px; z-index: 2; display: block; width: 45px; height: 4px; overflow: hidden; margin: 0px; padding: 0px; border: 0px none; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;" /><img
													src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-l.png"
													width="4" height="10" alt=""
													style="position: absolute; left: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;" /><img
													src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-r.png"
													width="4" height="10" alt=""
													style="position: absolute; right: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;" />
											</div>
										</div>
										<div
											style="border: 0px none; margin: -1px 0px 0px; padding: 0px; pointer-events: none; float: left; height: 22px;">
											<a
												href="https://ssl.pstatic.net/static/maps/mantle/notice/legal.html"
												target="_blank"
												style="display: block; width: 48px; height: 17px; overflow: hidden; margin: 0px 5px 5px 12px; pointer-events: auto;"><img
												src="https://ssl.pstatic.net/static/maps/mantle/1x/naver-normal-new.png"
												width="48" height="17" alt="NAVER"
												style="display: block; width: 48px; height: 17px; overflow: hidden; border: 0 none; margin: 0; padding: 0; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;" /></a>
										</div>
									</div>

									<!-- 지도 api 추가 설정 종료 부분 -->
								</div>
							</div>
						</div>
						<!-- </foreach> -->
					</div>
					<div class="btn_order_area">
						<div class="btn_responsive">
							<a class="btn btn_option1">예약취소</a>
							<!---->
							<a class="btn btn_option2"><span
								class="txt_call"><i
									class="sp_icon ico_call_light"></i>전화 </span></a>
						</div>
					</div>
					<!---->
				</div>
				<!-- footer-->
				>
				<!---->
			</div>
		</div>
	</div>
</body>
</html>
