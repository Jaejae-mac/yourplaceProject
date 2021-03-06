<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Yourplace_비밀번호 변경</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	></script>
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/find-pass-sample.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/find-pass-style.css" />" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<style>
main, #layoutAuthentication_content {
	background-color: rgb(255, 255, 255);
}

.id_input:focus, .email_input:focus {
	outline: none;
}
</style>
<!-- <script>
	$(document).ready(function() {
		$(".delete").click(function(e) {
			if (e.target.id === "chk_id") {
				$(".id_input").val("");
			}
			if (e.target.id === "chk_email") {
				$(".email_input").val("");
			}
		});
	});
</script> -->
<body class="bg-primary">
<c:if test="${sendEmail == 0 }">
	<script>
	swal('', '아이디또는 이메일이 올바르지않습니다.\n아이디를 다시 확인해주세요.', "error");
	</script>
</c:if>
<%@ include file="../header.jsp" %>
	<!--body-->
	<!-- Main Body -->
	<div
		style="flex-direction: row; display: flex; justify-content: center; background-color: white; margin-top: 100px;">
		<!-- header 가 100px 이라 margin-top = header height-->
		<div class="h_center" id="test_body"
			style="width: 1160px; height: 100%">
			<div style="position: absolute; width: 100%; height: 100%"></div>
			<div id="main" class="h_column_center"
				style="width: 100%; margin-top: 50px; margin-bottom: 200px">
				<div class="h_column_center" style="margin-top: 20px">
					<p
						style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
						비밀번호 찾기</p>
				</div>

				<div id="main_vue" class="h_column_center"
					style="width: 100%; margin-top: 50px; margin-bottom: 200px">
					<div
						style="width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff; padding: 40px 50px;">
						<div class="h_column_center" >
							<div
								style="border-radius: 15px; background-color: rgb(0, 0, 0, 0.1); margin-bottom: 10px;">
								<p
									style="font-style: normal; font-weight: bold; font-size: 11px; line-height: 26px; text-align: left; letter-spacing: -0.1px; color: #1b1d1f; margin: 8px 20px;">
									가입때 사용하신 아이디와 받으실 메일 주소를 입력하시면 비밀번호 재설정 링크를 전송해 드립니다.</p>
							</div>
							<!-- password 재설정 -->
							<form id="form_findpassword" method="POST"
								action="/reset/password.do">
								<div>
									<p
										style="font-style: normal; font-weight: bold; font-size: 16px; line-height: 26px; text-align: left; letter-spacing: -0.1px; color: #1b1d1f; margin-left: 50px;">
										사용자 아이디</p>
									<!-- 사용자 아이디 입력. -->
									<div class="input_container2 bottom form-control"
										style="width: 480px; margin-left: 50px; margin-top: 15px"
										>
										<input type="text" placeholder="ID" value="" name="id"
											class="id_input" required />
										<!-- <div class="delete">
											<img
												src="https://s3.hourplace.co.kr/web/images/icon/round_delete_g.svg"
												style="width: 16px; height: 16px; margin-right: 10px"
												id="chk_id" />
										</div> -->
									</div>
								</div>
								<div>
									<p
										style="font-style: normal; font-weight: bold; font-size: 16px; line-height: 26px; text-align: left; letter-spacing: -0.1px; color: #1b1d1f; margin-left: 50px; margin-top: 10px;">
										사용자 이메일</p>
									<!-- 새로운 비밀번호 입력 -->
									<div class="input_container2 bottom form-control"
										style="width: 480px; margin-left: 50px; margin-top: 15px">
										<input type="email" placeholder="sample@sample.com" value="" name="email"
											class="email_input" required />
										<!-- <div class="delete">
											<img
												src="https://s3.hourplace.co.kr/web/images/icon/round_delete_g.svg"
												style="width: 16px; height: 16px; margin-right: 10px"
												id="chk_email" />
										</div> -->
									</div>
								</div>
								<div class="h_center" style="margin-top: 10px">
									<div class="btn btn-light"
										style="margin-top: 30px; width: 124px; border: solid 1px #dfe2e7; cursor: pointer;"
										onclick="submitForm()">
										<!-- reset/password.do 로 보내주고, resetpassword.html -->
										<p
											style="font-size: 13px; color: darkslategray; margin-bottom: 5px;">
											확인</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
	<script>
	function submitForm(){
		$("#form_findpassword").submit();
	}
	</script>
</body>
</html>