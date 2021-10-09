<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YourPlace-사업자정보확인</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/footerlist.css" />">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body>

	<!-- Header -->
	<%@ include file="../header.jsp"%>
	<!-- Header End -->
	<div
		style="position: absolute; height: 100px; top: 0; left: 0; right: 0; background-color: #fafbfb; z-index: -1;">

	</div>

	<div class="h_column_center"
		style="margin-top: 120px; margin-bottom: 120px">
		<div style="width: 766px">
			<p
				style="font-size: 26px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: #1b1d1f;">
				사업자 정보 확인</p>

			<p
				style="margin-top: 10px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: #72787f;">
				최신 업데이트 : 2021년 05월 06일</p>

			<div
				style="margin-top: 30px; width: 100%; height: 1px; background-color: #e7eaee;"></div>


			<p class="h_policy_title">통신 판매 번호</p>
			<p class="h_policy_desc">1111-1234-1234</p>

			<p class="h_policy_title">사업자 등록번호</p>
			<p class="h_policy_desc">132-234-123456</p>

			<p class="h_policy_title">신고현황</p>
			<p class="h_policy_desc">통신판매업 신고</p>

			<p class="h_policy_title">법인여부</p>
			<p class="h_policy_desc">법인</p>

			<p class="h_policy_title">상호</p>
			<p class="h_policy_desc">주식회사 Connect</p>

			<p class="h_policy_title">대표자명</p>
			<p class="h_policy_desc">BYLA</p>

			<p class="h_policy_title">대표 전화번호</p>
			<p class="h_policy_desc">010-****-****</p>

			<p class="h_policy_title">판매방식</p>
			<p class="h_policy_desc">인터넷</p>

			<p class="h_policy_title">취급품목</p>
			<p class="h_policy_desc">종합몰, 기타</p>

			<p class="h_policy_title">전자우편</p>
			<p class="h_policy_desc">kgteambyla@gmail.com</p>

			<p class="h_policy_title">신고일자</p>
			<p class="h_policy_desc">2021년 **월 **일</p>

			<p class="h_policy_title">사업장 소재지</p>
			<p class="h_policy_desc">서울특별시 강남구 ***로*길 ** **빌딩 ***호</p>
			<p class="h_policy_title">사업장 소재지(도로명)</p>
			<p class="h_policy_desc">서울특별시 강남구 ***로*길 ** **빌딩 ***호
			</p>

			<p class="h_policy_title">인터넷 도메인</p>
			<p class="h_policy_desc">ec2-3-38-115-143.ap-northeast-2.compute.amazonaws.com/home.do</p>
			<p class="h_policy_title">호스트 서버 소재지</p>
			<p class="h_policy_desc">AMAZON AWS</p>
			<p class="h_policy_title">통신판매업 신고기관명</p>
			<p class="h_policy_desc">서울특별시 강남구청</p>
		</div>
	</div>
	<!-- 신고하기 팝업 내용 끝 -->
	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- Footer 끝 -->
	<!-- script -->



</body>
</html>