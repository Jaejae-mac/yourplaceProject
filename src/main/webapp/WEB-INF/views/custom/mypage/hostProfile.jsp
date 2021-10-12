<%@page import="com.yourplace.custom.login.vo.UserVO"%>
<%@page import="com.yourplace.custom.login.dao.impl.LoginDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user-register.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/card.css" />">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<title>YourPlace 호스트 프로필</title>
</head>
<body>


	<c:if test="${userId != null}">
		Host ProFile - ${hostId }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp"%>
	<!-- Header End -->
	<div id="main_vue" class="h_column_center"
		style="min-height: 1000px; margin-top: 100px">
		<div style="width: 1160px;">
			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					호스트 프로필</p>
			</div>
		</div>
		<div
			style="margin-top: 50px; width: 100%; height: 1px; background-color: #e7eaee;"></div>
		<div class="h_row" style="margin-top: 60px; margin-bottom: 200px;">
			<div class="h_column_center" style="width: 360px;">
				<div
					style="width: 360px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff;">
					<div class="h_column_center">
						<div
							style="position: relative; margin-top: 50px; width: 120px; height: 120px; border-radius: 60px; overflow: hidden;">
							<img src="${hostInfo.userProfileImg}"
								style="width: 100%; height: 100%; position: absolute;">
						</div>
						<p
							style="padding: 0 20px; margin-top: 20px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #1b1d1f;">
							${hostInfo.userNickName}</p>
						<p
							style="padding: 0 20px; margin-bottom: 40px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #246ff8;">
							장소 대여 : 00</p>
					</div>

				</div>

			</div>
			<div style="margin-left: 60px; width: 580px;">
				<p
					style="font-size: 24px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: #1b1d1f;">
					소개</p>
				<p id="Intro"
					style="margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
					<c:if
						test="${hostInfo.userIntro == null or hostInfo.userIntro == ''}">
                    	안녕하세요. ${hostInfo.userNickName} 입니다.
                    </c:if>
					<c:if test="${hostInfo.userIntro != null }">
                    	${hostInfo.userIntro}
                    </c:if>

				</p>
				<div
					style="margin-top: 40px; height: 1px; background-color: rgb(231, 234, 238);"></div>
				<div style="margin-top: 40px;"></div>

				<div class="h_row_center"
					style="margin-top: 20px; width: 1180px; margin-bottom: 30px; flex-wrap: wrap;">
					<p
						style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center;">
						호스트가 등록한 장소 목록:</p>
					<label
						style="margin-left: 10px; margin-bottom: 0; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
						${fn:length(hostPlaceInfo)} </label>
				</div>
				<!--card layout 시작-->
				<div class="h_row_center">
					<div class="total_card_layout">
						<c:forEach var="hpi" items="${hostPlaceInfo }" varStatus="status">
							<div class="card_layout_two" style="margin-right: 15px;">
								<div class="card">
									<div class="card_header"
										onclick="gotoDetail('#place_num${status.index }')">
										<img src="${hpi.placeThumb }" alt="이미지 넣는 곳" />
										<!-- 데이터 베이스의 해당 image 가져오기-->
									</div>
									<div class="card_body"
										onclick="gotoDetail('#place_num${status.index }')">
										<div class="card_body_header">
											<p>
												${hpi.placeCate } · ${hpi.placeArea }
												<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
											</p>
											<div class="card_body_header_right">
												<div>
													<img
														src="<c:url value="/resources/custom/icon/person.png" />">
													<p>
														${hpi.placeCapa }
														<!-- {{ place.people }} -->
													</p>
												</div>
												<div>
													<img
														src="<c:url value="/resources/custom/icon/parking.png" />">
													<p>
														${hpi.placeCapaCar }
														<!-- {{ place.parking }} -->
													</p>
												</div>
											</div>
										</div>
										<div class="card_body_title">
											${hpi.placeName }
											<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
										</div>
									</div>
									<div id="line"></div>
									<div class="card_body_footer">
										<img
											src="<c:url value="/resources/custom/icon/gold_star.png" />">
										<p class="card_body_footer_star">
											${hpi.avgRate }
											<!-- {{ place.feedback_rating }} -->
										</p>
										<p class="card_body_footer_review">
											리뷰 ${hpi.reviewCnt }
											<!-- 리뷰 {{ place.feedback_count }} -->
										</p>
										<p class="card_body_footer_price">
											${hpi.placePrice }원
											<!-- {{ place.price_guest }}원 -->
										</p>
									</div>
								</div>
							</div>
							<input type="hidden" id="place_num${status.index }"
								value="${hpi.placeNum} " />
						</c:forEach>
					</div>
					<!--card layout 종료-->
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- Footer 끝 -->
	<script>
		function gotoDetail(e) {
			location.href = "/detailPlaceForm.do?placeNum=" + $(e).val();
		}
	</script>
</body>
</html>