<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Yourplace_아이디 찾기</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.12.6/sweetalert2.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user-register.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user-register-style.css" />">
</head>
<body class="bg-primary">
<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
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
						아이디 찾기</p>
				</div>

				<div id="main_vue" class="h_column_center"
					style="width: 100%; margin-top: 30px; margin-bottom: 200px">
					<div
						style="width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff; padding: 40px 50px;">
						<div class="h_column_center">
							<!-- password 재설정 -->
							<div
								style="border-radius: 15px; background-color: rgb(0, 0, 0, 0.1); margin-bottom: 10px;">
								<p
									style="font-style: normal; font-weight: bold; font-size: 13px; line-height: 26px; text-align: left; letter-spacing: -0.1px; color: #1b1d1f; margin: 8px 40px;">
									가입시 등록하신 전화번호를 통해 인증 후 아이디 찾기가 가능합니다.</p>
							</div>
							<form id="form_findpassword" method="POST"
								action="/reset/password" style="width: 100%">
								<div class="h_row" style="margin-top: 20px">
									<p
										style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
										본인 인증</p>
								</div>
								<div class="input_container disabled"
									style="margin-top: 8px; cursor: pointer; width: 100%"
									size="500">
									<!-- 인증기능 페이지로 이동-->
									<input type="text" placeholder="본인인증을 진행해 주세요"
										id="userPhoneNum" required />
									<div class="h_center"
										style="position: absolute; right: 7px; padding-right: 18px; padding-left: 18px; height: 38px; border-radius: 4px; background-color: black">
										<label for="tel"
											style="margin-bottom: 0; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #ffffff;">
											휴대폰 인증 </label> 
											<input type="button" id="tel" name="userTel"
											style="display: none" />
									</div>
								</div>

								<div style="height: 50px;"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form method="post" action="/find/account/result.do" hidden="hidden" id="sendTel">
		<input type="hidden" name="userTel" id="userTel">
	</form>
	<script>
      $(document).on("click", "#tel", function () {
        var userTel = $("#userPhoneNum").val();
        console.log(userTel);
        var authNum;
        if (userTel != "") {
          //beging userTel emptyCheck
          let timerInterval;
          Swal.fire({
            title: "인증번호 입력",
            title: '전송된 인증번호 입력',
            html: '<b></b> 후에 종료됩니다.'+
            '<br/><br/><input type="text" placeholder="전송된 인증 번호를 입력해주세요." id="auth_num" class="form-control">'+
            '<br/><input type="button" class="btn btn-primary" id="auth_num_btn" style="widht:100%;" value="인증 확인">',
            timer: 1000*60*3,
            timerProgressBar: true,
            didOpen: () => {
                Swal.showLoading()
                const b = Swal.getHtmlContainer().querySelector('b')
                timerInterval = setInterval(() => {
                b.textContent = millisToMinutesAndSeconds(Swal.getTimerLeft())
                }, 100)
            },
            willClose: () => {
              clearInterval(timerInterval);
            },
          }).then((result) => {
            /* Read more about handling dismissals below */
            if (result.dismiss === Swal.DismissReason.timer) {
              console.log("I was closed by the timer");
            }
          });
          //서버로 전화번호 전송.
           $.ajax({
             url: "/authentication.do",
             type: "get",
             data: { userTel: userTel },
             success: function (responseData) {
             authNum = responseData;
             },
           });
        } //end userTel empty Check

        //인증번호 입력후 확인 버튼 클릭 시.
        $(document).on("click", "#auth_num_btn", function () {
          var userAuthNum = $("#auth_num").val();
          swal.close();
          if (authNum === userAuthNum) {
            console.log("전달받은 인증번호 : " + authNum);
            console.log("사용자   인증번호 : " + userAuthNum);
            Swal.fire({
              icon: "success",
              title: "인증번호 일치합니다.",
            }).then(function(){
            	 $("#userTel").val(userTel);
                 $("#sendTel").submit();
            });
          } else {
            Swal.fire({
              icon: "error",
              title: "인증번호가 일치하지 않습니다.",
              text: "다시 인증해주세요.",
              closeOnClickOutside: false,
             
            }).then(function(isConfirm){
            		window.location.reload();		
            	
            });
          }
        });
      });
      function millisToMinutesAndSeconds(millis) {
    	  var minutes = Math.floor(millis / 60000);
    	  var seconds = ((millis % 60000) / 1000).toFixed(0);
    	  return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
    	}
    </script>
    <%@ include file="../footer.jsp" %>
</body>
</html>