<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YourPlace</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/sample.css" />" />

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

</head>

<body>
	<div style="max-width: 100%; overflow: hidden;">
		<main id="main" class="">

			<div class="h_column_center" style="width: 100%;">
				<div style="width: 100%; max-width: 500px; padding: 20px;">
					<div
						style="width: 100%; border-radius: 10px; overflow: hidden; border: solid 1px #dfe2e7;">
						<div style="width: 88.3%; padding: 0 30px;">
							<div class="h_row_center"
								style="position: relative; margin-top: 25px; padding-top: 25px;">
								<div style="position: absolute; left: 0;">
									<img src="<c:url value="/resources/img/logo/logo.png" />"
										style="width: 130px; height: 32px;" />
								</div>
							</div>
							
							<fmt:parseNumber value="${payment.invCost/100*payment.coupDisRate}" integerOnly="true" var="DisRate"/>
							<div class="h_column_center"
								style="margin-top: 54px; margin-bottom: 30px;">
								<p
									style="font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.08; letter-spacing: -0.13px; text-align: center; color: #1b1d1f;">
									영수증</p>
							</div>
							
							
							
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										예약 번호</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.rsvNum}</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										결제일</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.payYear}년 ${payment.payMonth}월 ${payment.payDate}일 </p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										게스트 정보</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.rsvName}</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										결제 상태</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										<c:if test="${payment.rsvRefundYn == 0}">
											결재 완료
										</c:if>
										<c:if test="${payment.rsvRefundYn == 1}">
											환불 진행중
										</c:if>
										<c:if test="${payment.rsvRefundYn == 2}">
											환불 완료
										</c:if>
										<c:if test="${payment.rsvRefundYn == 3}">
											호스트에 의한 환불
										</c:if>
									</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										장소 번호</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.placeNum}</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										예약 장소</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.placeName}</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										스케줄</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.rsvYear}년 ${payment.rsvMonth}월 ${payment.rsvDate}일</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										총 시간</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.rsvEndT - payment.rsvStartT } 시간</p>
								</div>
							</div>
							<div
								style="margin: 10px 0; height: 1px; width: 100%; border-bottom: solid 1px #e7eaee;">

							</div>
							
							<!-- 환불상태시 환불금액만 나오게 변경 -->
							<c:if test="${payment.rsvRefundYn == 0}">										
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										원가</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.invCost }원</p>
								</div>
							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										쿠폰 사용</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										(-) ${DisRate } 원
									</p>
								</div>
							</div>
							<div
								style="margin: 10px 0; height: 1px; width: 100%; border-bottom: solid 1px #e7eaee;">

							</div>
							<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.63; letter-spacing: -0.09px; color: #1b1d1f;">
										총 결제 금액</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.63; letter-spacing: -0.09px; text-align: right; color: #1b1d1f;">
										${payment.invCost}원(부가세${payment.invTax}원 포함)</p>
								</div>
							</div>
							</c:if>
							<c:if test="${payment.rsvRefundYn == 1}">
								<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										환불 예정금액</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.invCost }원</p>
								</div>
							</div>
							</c:if>
							<c:if test="${payment.rsvRefundYn == 2 || payment.rsvRefundYn == 3}">
								<div class="h_row">
								<div style="width: 100px; padding: 10px 0;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
										환불금액</p>
								</div>
								<div
									style="width: calc(100% - 100px); padding: 10px 0; justify-content: flex-end;">
									<p
										style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: right; color: #1b1d1f;">
										${payment.refundCost }원</p>
								</div>
							</div>
							</c:if>
						</div>
						
						
						
						
						<div class="h_column_center"
							style="width: 100%; background-color: #fafbfb; margin-top: 40px;">
							<div style="width: 88.3%; max-width: 500px; padding: 16px 30px;">
								<p
									style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.67; letter-spacing: normal; color: #9ea4aa;">
									KG ITBANK | 서울특별시 강남구 압구정로2길 62 대성빌딩 202호<br> 사업자 등록번호
									494-81-00558 | team@yourplace.co.kr<br> © Kgitbank Inc.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="h_column_center" style="width: 100%;">
				<div class="h_column_center" id="buttons"
					style="width: 100%; max-width: 500px; margin-top: 40px; margin-bottom: 40px;">
					<div class="h_row_center">
						<div class="request on" onclick="print()"
							style="margin-top: 0px; padding: 0 34px; background-color: #FFF; border: solid 1px #dfe2e7; pointer-events: auto;">
							<label for="print" class="print" style="cursor:pointer;"> 프린트 </label>
						</div>
						<div class="request" onclick="window.close()"
							style="margin-top: 0px; margin-left: 12px; padding: 0 34px; background-color: #FFF; border: solid 1px #dfe2e7; pointer-events: auto;">
							<label for="confirm" class="confirm" style="cursor:pointer; color: #1b1d1f;">
								확인 </label>
						</div>
					</div>
				</div>
			</div>

		</main>
	</div>
</body>
</html>