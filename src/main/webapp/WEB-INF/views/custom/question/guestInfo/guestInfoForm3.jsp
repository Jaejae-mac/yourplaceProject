<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="chrome" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>YourPlace</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/Info.css" />" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body style="width: 1160px; height: 100%">

	<!--header-->
	<div style="width: 1160px;">
		<div style="margin-top: 20px;">

			<div style="padding: 0px 0px 5px 0px;">

				<!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->
			</div>
			<p
				style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
				이용방법</p>
		</div>
	</div>
	<div class="h_row_center"
		style="padding: 0px 8px; margin-top: 50px; width: 588px; height: 56px; border-radius: 4px; background-color: rgb(245, 247, 248); position: relative; left: 270px;">
		<div onclick="guestInfo()" class="h_center h_booking_select_button">
			<p>게스트</p>
		</div>
		<div onclick="" class="h_center h_booking_select_button on">
			<p>공간 호스트</p>
		</div>
	</div>

	<div style="padding: 0px 0px 15px 0px">
		<!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->
	</div>

	<div style="position: relative; left: 200px">
		<div class="h_row_center">
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-0" onclick="guestInfo-0()">
				<a href="/guestInfo.do" style="text-decoration: none; color: black;">게스트
					가입</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-1" onclick="guestInfo-1()">
				<a href="/guestInfo1.do"
					style="text-decoration: none; color: black;">예약</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-2" onclick="guestInfo-2()">
				<a href="/guestInfo2.do"
					style="text-decoration: none; color: black;">예약 확정</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-3" onclick="guestInfo-3()">
				<a href="/guestInfo3.do"
					style="text-decoration: none; color: black;">예약 취소</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-4" onclick="guestInfo-4()">
				<a href="/guestInfo4.do"
					style="text-decoration: none; color: black;">예약 진행</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-5" onclick="guestInfo-5()">
				<a href="/guestInfo5.do"
					style="text-decoration: none; color: black;">추가 결제</a>
			</div>
			<div class="h_center h_info_sub_button" style="margin-right: 16px"
				id="guestInfo-6" onclick="guestInfo-6()">
				<a href="/guestInfo6.do"
					style="text-decoration: none; color: black;">이용 요금</a>
			</div>
		</div>
		<div style="padding: 0px 0px 10px 0px">
			<!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->
		</div>
	</div>
	<p class="h_info_container_title">예약 취소하기</p>
	<div class="faq-content">
		<c:forEach var="guestjoin" items="${guestInfoList}" begin="0" end="0"
			step="1" varStatus="status">
			<button class="question" id="que-1">
				<span id="que-1-toggle">+</span><span>Q.
					<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
			</button>
			<div class="answer" id="ans-1">
				<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
		</c:forEach>
	</div>
	<div class="faq-content">
		<c:forEach var="guestjoin" items="${guestInfoList}" begin="1" end="1"
			step="1" varStatus="status">
			<button class="question" id="que-2">
				<span id="que-2-toggle">+</span><span>Q.
					<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
			</button>
			<div class="answer" id="ans-2">
				<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
		</c:forEach>
	</div>

	<div style="padding: 0px 0px 400px 0px">
		<!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->
	</div>
	<!--내용 열기 script-->

	<script type="text/javascript">
      const items = document.querySelectorAll(".question");

      function openCloseAnswer() {
        const answerId = this.id.replace("que", "ans");

        if (document.getElementById(answerId).style.display === "block") {
          document.getElementById(answerId).style.display = "none";
          document.getElementById(this.id + "-toggle").textContent = "+";
        } else {
          document.getElementById(answerId).style.display = "block";
          document.getElementById(this.id + "-toggle").textContent = "-";
        }
      }

      items.forEach((item) => item.addEventListener("click", openCloseAnswer));      
    </script>

	<!--footer-->


</body>
</html>
