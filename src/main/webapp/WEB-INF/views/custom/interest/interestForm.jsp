<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YourPlace</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/Question.css" />">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body>
	<c:choose>
		<c:when test="${placeNum != null}">MY Interest - ${placeNum }</c:when>
		<c:when test="${userId != null }">My Interest = ${userId }</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	<!-- Header -->
	<%@ include file="../header.jsp"%>
	<!-- Header End -->
	<div
		style="position: absolute; height: 100px; top: 0; left: 0; right: 0; background-color: #fafbfb; z-index: -1;"></div>

	<div id="main_vue" class="h_column_center"
		style="background-color: #fafbfb; margin-top: 100px; min-height: 1000px">
		<div style="width: 1160px">
			<div style="margin-top: 20px">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					관심장소</p>
				<p
					style="margin-top: 16px; font-size: 20px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; text-align: center; color: rgb(114, 120, 127);">
					마음에 드는 장소를 북마크하고, 폴더로 구분해서 저장하세요!</p>
			</div>
		</div>
		<!-- 값이 잘 오는지 확인하기위한 란 <p>값-->
		<p
			style="margin-left: 6px; font-style: normal; font-weight: bold; font-size: 15px; line-height: 14px; letter-spacing: -0.5px; color: #246FF8;">
			${fn:length(interestList)}</p>
			
		<!-- 메인 -->
		<c:forEach var="interest" items="${interestList}">
			<div class="h_row_center"
				style="margin-top: 100px; width: 1180px; margin-bottom: 230px; flex-wrap: wrap;">
				<div
					style="width: 373px; height: 352px; border-radius: 10px; border: 1px solid rgb(223, 226, 231); margin-right: 10px; margin-left: 10px; margin-bottom: 20px; overflow: hidden; cursor: pointer;">
					<img
						src="//img.hourplace.co.kr/temp/images/2019/11/07/3e2cb44c-5cba-39c3-b2c6-da56ae36a4f1.jpg?s=550x364&amp;t=cover&amp;q=80"
						style="height: 248px; object-fit: cover" />
					<div style="width: 100%; padding: 20px 30px">
						<p class="h_ellipsis_1"
							style="font-size: 26px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
							${interest.placeName}</p>
						<p
							style="margin-top: 4px; font-size: 18px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(114, 120, 127);">
							${interest.placeNum}</p>
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:if test="${fn:length(interestList) == 0 }">
			<div class="h_center" style="width: 1160px; height: 1000px;">
				<div class="h_column_center">
					<div class="h_center"
						style="width: 80px; height: 80px; background-color: #eff3f5; border-radius: 50%;">
						<img src="<c:url value="/resources/custom/icon/emoji25.png" />"
							style="width: 80px; height: 80px; padding: 0 0 16px 14px" />
					</div>
					<p
						style="margin-top: 40px; font-size: 26px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: black;">
						관심장소가 없어요</p>
					<div class="h_row_center" style="margin-top: 30px">

						<div class="h_center" style="margin-top: 10px;">
							<button type="button" id="" class="btn btn-primary btn-lg">
								<a href="/home.do" style="text-decoration: none; color: white;">모든
									장소 보기</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>


	</div>

	<!-- 신고하기 팝업 내용 끝 -->
	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- Footer 끝 -->
	<!-- script -->

	<script>
		
	</script>




	<!-- script 끝 -->
</body>
</html>