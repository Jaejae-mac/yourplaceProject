<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="chrome" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Yourplace_게스트 FAQ</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/Info.css" />" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>

	<!-- Header -->
	<%@ include file="../../header.jsp"%>

	<div class="h_column_center" id="main_vue"
		style="min-height: 1000px; margin-top: 100px;">
		<div style="width: 1160px; min-height: 1000px; padding-bottom: 150px;">
			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
					이용방법</p>
			</div>
			<div style="margin-top: 50px"></div>
			<div class="h_row_center"
				style="padding: 0px 8px; width: 588px; height: 56px; border-radius: 4px; background-color: rgb(245, 247, 248); margin: 0 auto;">
				<div class="h_center" style="margin: 0 auto;">
					<div onclick="guestInfo()" class="h_center h_booking_select_button">
						<a href="/guestInfo.do"
							style="text-decoration: none; color: black;">게스트</a>
					</div>
					<div onclick="hostInfo()"
						class="h_center h_booking_select_button on">
						<a href="/hostInfo.do"
							style="text-decoration: none; color: black;">공간 호스트</a>
					</div>
				</div>
			</div>
			<!-- div 사이 공간 값 -->
			<div style="margin-top: 50px"></div>

			<div class="h_center" style="margin: 0 auto;">
				<div class="h_center h_info_sub_button" style="margin-right: 16px"
					id="guestInfo-0" onclick="guestInfo-0()">
					<a href="/guestInfo.do"
						style="text-decoration: none; color: black;">게스트 가입</a>
				</div>
				<div class="h_center h_info_sub_button" style="margin-right: 16px"
					id="guestInfo-1" onclick="guestInfo-1()">
					<a href="/guestInfo1.do"
						style="text-decoration: none; color: black;">예약</a>
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

			<!-- div 사이 공간 값 -->
			<div style="margin-top: 50px"></div>
			<p class="h_info_container_title">이용 요금 안내</p>
			<div style="margin-top: 50px"></div>
			
			<div class="faq-content">
				<c:forEach var="guestjoin" items="${guestInfoList}" begin="0"
					end="0" step="1" varStatus="status">
					<button class="question" id="que-1">
						<span id="que-1-toggle">+</span><span>Q.
							<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
					</button>
					<div class="answer" id="ans-1">
						<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
				</c:forEach>
			</div>
			<div class="faq-content">
				<c:forEach var="guestjoin" items="${guestInfoList}" begin="1"
					end="1" step="1" varStatus="status">
					<button class="question" id="que-2">
						<span id="que-2-toggle">+</span><span>Q.
							<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
					</button>
					<div class="answer" id="ans-2">
						<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
				</c:forEach>
			</div>

			<div style="margin-top: 50px"></div>
			<p class="h_info_container_title">대금 지급 안내</p>
			<div style="margin-top: 50px"></div>
			<div class="faq-content">
				<c:forEach var="guestjoin" items="${guestInfoList}" begin="2"
					end="2" step="1" varStatus="status">
					<button class="question" id="que-3">
						<span id="que-3-toggle">+</span><span>Q.
							<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
					</button>
					<div class="answer" id="ans-3">
						<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
				</c:forEach>
			</div>
			<div class="faq-content">
				<c:forEach var="guestjoin" items="${guestInfoList}" begin="3"
					end="3" step="1" varStatus="status">
					<button class="question" id="que-4">
						<span id="que-4-toggle">+</span><span>Q.
							<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueTitle}</span>
					</button>
					<div class="answer" id="ans-4">
						<td><input type="hidden" name="${status.index}" /></td>${guestjoin.infoGueContent}</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="../../footer.jsp"%>
	<!-- Footer 끝 -->
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
