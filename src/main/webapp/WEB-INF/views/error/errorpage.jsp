<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="chrome" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Error Page</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/Info.css" />" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

	<!-- Header -->
	<%@ include file="../custom/header.jsp"%>

	<div class="h_column_center" id="main_vue"
		style="min-height: 1000px; margin-top: 100px;">
		<div style="width: 1160px; min-height: 1000px; padding-bottom: 150px;">

			<c:if
				test="${requestScope['javax.servlet.error.status_code'] == 400}">
				<div style="margin-top: 20px; text-align: center;">
					<img src="<c:url value="/resources/error/404.png" />"
						style="width: 50%; height: 50%; object-fit: cover;">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
						400 error 잘못 된 요청입니다.</p>
				</div>
			</c:if>

			<c:if
				test="${requestScope['javax.servlet.error.status_code'] == 404}">

				<div style="margin-top: 20px; text-align: center;">
					<img src="<c:url value="/resources/error/404.png" />"
						style="width: 50%; height: 50%; object-fit: cover;">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
						404 error 요청하신 페이지를 찾을 수 없습니다.<br>입력하신 주소가 정확한지 다시 한 번 확인해주세요.</p>
				</div>

			</c:if>

			<c:if
				test="${requestScope['javax.servlet.error.status_code'] == 405}">
				<div style="margin-top: 20px; text-align: center;">
					<img src="<c:url value="/resources/error/405.png" />"
						style="width: 50%; height: 50%; object-fit: cover;">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
						405 error 허용하지 않는 접근 방식입니다.</p>
				</div>
			</c:if>

			<c:if
				test="${requestScope['javax.servlet.error.status_code'] == 500}">
				<div style="margin-top: 20px; text-align: center;">
					<img src="<c:url value="/resources/error/500.png" />"
						style="width: 50%; height: 50%; object-fit: cover;">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
						500 error 서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
				</div>
			</c:if>

			<c:if
				test="${requestScope['javax.servlet.error.status_code'] == 503}">
				<div style="margin-top: 20px; text-align: center;">
					<img src="<c:url value="/resources/error/405.png" />"
						style="width: 50%; height: 50%; object-fit: cover;">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
						503 error 일시적으로 서비스를 사용할 수 없습니다.<br>서버가 과부하로 인해 다운되었습니다.</p>
				</div>
			</c:if>

			<!-- home.do 로 가는 하이퍼링크 위치 조정 실패로 임시 주석처리
			<a href="/home.do"
				style="text-decoration: none; color: black; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">HOME</a> -->
			<div class="h_center" style="margin-top: 30px;">
				<button type="button" id="" class="btn btn-primary btn-lg">
					<a href="/home.do" style="text-decoration: none; color: white;">yourplace 홈으로</a>
				</button>
			</div>
		</div>
	</div>
	<%@ include file="../custom/footer.jsp"%>
</body>
</html>