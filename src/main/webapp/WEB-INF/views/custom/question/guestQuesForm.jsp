<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yourplace_고객센터</title>
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
	<c:if test="${userId != null}">
		MY Page - ${userId }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp"%>
	<!-- Header End -->
	<div
		style="position: absolute; height: 100px; top: 0; left: 0; right: 0; background-color: #fafbfb; z-index: -1;">

	</div>

	<div id="main_vue" class="h_column_center"
		style="background-color: #fafbfb; margin-top: 100px">
		<div style="width: 1160px;">

			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					고객센터</p>
			</div>
		</div>
		<!-- 공지사항 -->
		<!-- 게스트용 공지사항 -->
		<div class="h_row_center"
			style="margin-top: 78px; height: 240px; margin-bottom: 120px;">
			<div class="h_column_center"
				style="width: 400px; height: 240px; border-radius: 16px; box-shadow: 3px 3px 10px 0 rgba(0, 0, 0, 0.06); background-color: #ffffff;">
				<img
					src="<c:url value="/resources/img/icon/register/service_guest.png" />"
					style="margin-top: 50px; width: 44px; height: 44px;" />
				<div class="h_center"
					style="margin-top: 13px; height: 24px; width: 86px; border-radius: 12px; background-color: #1b1d1f;">
					<p
						style="font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: normal; text-align: center; color: #ffffff; margin-bottom: 0px;">
						게스트</p>
				</div>
				<div class="h_center"
					style="margin-top: 30px; width: 280px; height: 56px; border-radius: 8px; background-color: #fafbfb; cursor: pointer;">
					<div class="h_row_center">
						<label for="guest_using" class="guest_using"
							style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #1b1d1f;">
							<a href="/guestInfo.do"
							style="text-decoration: none; color: black;">게스트 이용방법</a>
						</label> <input type="button" id="guest_using"
							onclick="window.location.href='login.html'"
							style="display: none; cursor: pointer;"> <img
							src="<c:url value="/resources/img/icon/register/before.png"/>"
							style="margin-left: 8px; width: 20px; height: 20px; -webkit-transform: rotate(180deg)">
					</div>
				</div>
			</div>
			<!-- 게스트용 공지사항 끝 -->

			<!-- 호스트용 공지사항 -->
			<div class="h_column_center"
				style="margin-left: 40px; width: 400px; height: 240px; border-radius: 16px; box-shadow: 3px 3px 10px 0 rgba(0, 0, 0, 0.06); background-color: #ffffff;">
				<img
					src="<c:url value="/resources/img/icon/register/service_host.png"/>"
					style="margin-top: 50px; width: 44px; height: 44px;" />
				<div class="h_center"
					style="margin-top: 13px; height: 24px; width: 86px; border-radius: 12px; background-color: #1b1d1f;">
					<p
						style="font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: normal; text-align: center; color: #ffffff; margin-bottom: 0px;">
						공간 호스트</p>
				</div>
				<div class="h_center"
					style="margin-top: 30px; width: 280px; height: 56px; border-radius: 8px; background-color: #fafbfb; cursor: pointer;">
					<div class="h_row_center">
						<label for="host_using" class="host_using"
							style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #1b1d1f;">
							<a href="/hostInfo.do"
							style="text-decoration: none; color: black;">호스트 이용방법</a>
						</label> <input type="button" id="host_using"
							onclick="window.location.href='login.html'"
							style="display: none; cursor: pointer;"> <img
							src="<c:url value="/resources/img/icon/register/before.png"/>"
							style="margin-left: 8px; width: 20px; height: 20px; -webkit-transform: rotate(180deg)">
					</div>
				</div>
			</div>
			<!-- 호스트용 공지사항 끝 -->
		</div>

	</div>
	<div class="h_center" style="padding: 120px 0;">
		<div class="h_column_center">
			<div class="h_center"
				style="width: 80px; height: 80px; background-color: #eff3f5; border-radius: 50%;">
				<img src="<c:url value="/resources/img/icon/register/14.png"/>"
					style="width: 80px; height: 80px; padding: 0 0 16px 14px;">
			</div>
			<p
				style="margin-top: 40px; font-size: 26px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: #246ff8;">
				서비스 이용에 어려움이 있으신가요?</p>
			<div class="h_row_center" style="margin-top: 30px;">
				<p
					style="font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.22; letter-spacing: -0.12px; color: #1b1d1f;">
					projectkg2@kakao.com</p>
			</div>

			<p
				style="margin-bottom: 0px; margin-top: 1px; font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: #1b1d1f; text-align: center;">
				평일 오전 9시~ 오후 3시 (주말 및 공휴일 제외) <br />*점심시간 오후 11시~오후 12시 30분
			</p>

			<!-- 문의하기 팝업 -->
			<div class="h_row_center" style="margin-top: 40px;">

				<div
					style="width: 132px; height: 40px; border-radius: 4px; border: solid 1px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;">
					<label class="info" id="info" onclick="show_direct()"
						style="margin-bottom: 0px; width: 100%; height: 40px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; line-height: 40px; color: #26282b; cursor: pointer;">
						1:1 고객 문의 </label>
					<!-- onclick="show_direct()" width: 100%; height: 40px; line-height: 40px; -->

				</div>

				<div
					style="margin-left: 14px; width: 132px; height: 40px; border-radius: 4px; border: solid 1px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;">
					<label class="reportuser" id="reportuser"
						onclick="show_direct_two()"
						style="margin-bottom: 0px; width: 100%; height: 40px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; line-height: 40px; color: #26282b; cursor: pointer;">
						이용자 신고하기 </label>
				</div>

			</div>
			<!-- 문의하기 팝업 끝 -->

		</div>
	</div>

	<!-- 1:1 고객문의 팝업 내용 -->
	<div class="direct h_center" id="direct_vue"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; display: none; z-index: 9999; background-color: rgba(0, 0, 0, 0.6);">

		<div
			style="position: relative; width: 420px; border-radius: 12px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">

			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: #1b1d1f; width: 100%; text-align: center">
				1:1 고객문의</p>
			<div class="h_center"
				style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;"
				onclick="close_direct()">
				<img src="<c:url value="/resources/img/icon/register/close.png"/>"
					style="width: 24px; height: 24px;" />
			</div>

			<form id="form_question" method="post" name="form_question"
				style="margin-top: 30px; padding: 0 40px; margin-bottom: 40px"
				action="">
				<input type="hidden" id="userOne" name="userId" value="${userId }">
				<!-- Action -->
				<!--<input type="hidden" name="type" value="direct"> -->
				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50; text-align: center;">
						아워플레이스 서비스 이용 중 <br /> 불편하신 점이나 궁금하신 점이 있으셨나요? <br /> 최대한 빠른 시일
						내에 답변 드릴게요.
					</p>
				</div>

				<p
					style="margin-left: 18px; margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					내용</p>

				<div
					style="margin-top: 8px; height: 192px; padding: 14px; border-radius: 4px; border: solid 1px #eff3f5;">
					<textarea class="noresize"
						style="width: 100%; height: 100%; border: solid 1px slategray; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
						placeholder="문의 내용을 입력해주세요" id="reprt_Content1"
						name="reprtContent"></textarea>

				</div>

				<div class="h_center" style="margin-top: 30px;">
					<button type="button" id="insertQues"
						class="btn btn-primary btn-lg">문의 하기</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 1:1 고객문의 팝업 내용 끝 -->


	<!-- 신고하기 팝업 내용 -->
	<div class="direct_two h_center" id="direct_vue"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; display: none; z-index: 9999; background-color: rgba(0, 0, 0, 0.6);">

		<div
			style="position: relative; width: 420px; border-radius: 12px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">

			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: #1b1d1f; width: 100%; text-align: center">
				신고하기</p>
			<div class="h_center"
				style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;"
				onclick="close_direct_two()">
				<img src="<c:url value="/resources/img/icon/register/close.png"/>"
					style="width: 24px; height: 24px;" />
			</div>

			<form id="form_question2" method="post" name="form_question2"
				style="margin-top: 30px; padding: 0 40px; margin-bottom: 40px"
				action="">
				<input type="hidden" id="userTwo" name="userId" value="${userId }">
				<!--Action-->
				<!--<input type="hidden" name="type" value="direct_two">-->
				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50; text-align: center;">
						아워플레이스 서비스 이용 중 <br /> 불편하신 경험 또는 게스트/호스트가 있으셨나요? <br /> 최대한 빠른
						시일 내에 답변 드릴게요.
					</p>
				</div>

				<p
					style="margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					예약번호</p>
				<input type="text" placeholder="예약번호" value="" id="rsv_num"
					name="rsvNum"
					style="width: 50%; margin: 2px; border: solid 1px slategray; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
					required>

				<p
					style="margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					내용</p>

				<div
					style="margin-top: 8px; height: 192px; border-radius: 4px; border: solid 1px #dfe2e7; margin: 3px;">
					<textarea class="noresize"
						style="width: 100%; height: 100%; border: solid 1px slategray; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
						placeholder="문의 내용을 입력해주세요" id="reprt_Content2"
						name="reprtContent"></textarea>
				</div>


				<div class="h_center" style="margin-top: 30px;">
					<button type="button" id="insertReport"
						class="btn btn-primary btn-lg">신고 하기</button>
				</div>

			</form>
		</div>
	</div>
	<!-- 신고하기 팝업 내용 끝 -->
	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- Footer 끝 -->
	<!-- script -->

	<script>
			function show_direct() {
				Id = $("#userOne").val();
				console.log("아이디값은 "+ Id);
				if(Id == ""){
					Swal.fire({
						title: '로그인이 필요합니다.',
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
			    		cancelButtonColor: '#d33',
			    		confirmButtonText: '로그인',
			    		cancelButtonText: '아니오',
					}).then((result) => {
						if(result.isConfirmed) {
						location.href='/loginForm.do'
						}else{
							location.href='/quesForm.do'
						}
					})
				}else{
					$('body').addClass('modal-open')
					$('.direct').show()	
				}

			}

			function close_direct() {
				$('body').removeClass('modal-open')
				$('.direct').hide()
			}

			function show_direct_two() {
				Id = $("#userTwo").val();
				console.log("아이디값은 "+ Id);
				if(Id == ""){
					Swal.fire({
						title: '로그인이 필요합니다.',
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
			    		cancelButtonColor: '#d33',
			    		confirmButtonText: '로그인',
			    		cancelButtonText: '아니오',
					}).then((result) => {
						if(result.isConfirmed) {
						location.href='/loginForm.do'
						}else{
							location.href='/quesForm.do'
						}
					})
				}else{
					$('body').addClass('modal-open')
					$('.direct_two').show()	
				}
			}

			function close_direct_two() {
				$('body').removeClass('modal-open')
				$('.direct_two').hide()
			}

			/*function insertQues(){
				
				console.log($('#reprt_content').text());
				$('#rst').val($('#reprt_content').text());
				$("#form_question").attr("action","/guestques.do");
				$("#form_question").submit();
			}*/
			$(document).on('click', '#insertQues', function() {
				console.log("1:1문의 등록버튼 클릭");
				//문의내용 입력 공백확인 
				var reprtContent = "";
				var form = document.form_question;
				reprtContent = $("#reprt_Content1").val();
				console.log("content" + reprtContent)
				//var flag = true;;
				console.log("문의 내용 "+ reprtContent);
				if (reprtContent == null || reprtContent === "") {
					alert("문의 사항을 입력해주세요.")
					return false;
				}else {
					alert("문의 사항이 등록되었습니다.")
					$("#form_question").attr("action", "/guestques.do");
					$("#form_question").submit();
				}
			});
		


			$(document).on('click', '#insertReport', function() {
				console.log("신고하기버튼 클릭");
				//문의내용 입력 공백확인 
				var reprtContent = "";
				var rsvNum = "";
				var form = document.form_question;
				reprtContent = $("#reprt_Content2").val();
				rsvNum = $("#rsv_num").val();
				console.log("num"+ rsvNum + "content" + reprtContent)
				//var flag = true;
				if (rsvNum == null || rsvNum === "") {
					alert("예약번호를 입력해주세요.")
					//flag = false;
					return false;
				}else if(reprtContent == null || reprtContent === ""){
					alert("신고내용을 입력해주세요.")
					return false;
				}else {

					alert("신고내용이 등록되었습니다.")
					$("#form_question2").attr("action", "/guestreport.do");
					$("#form_question2").submit();
				}

			});
		</script>
	<!-- script 끝 -->

</body>
</html>