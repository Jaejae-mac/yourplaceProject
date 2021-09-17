<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YourPlace</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/Question.css" />">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>

<body>
	<div
		style="position: absolute; height: 100px; top: 0; left: 0; right: 0; background-color: #fafbfb; z-index: -1;">

	</div>

	<div>
		<div class="h_column_center" style="background-color: #fafbfb">
			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					고객센터</p>
			</div>

			<!-- 공지사항 -->
			<!-- 게스트용 공지사항 -->
			<div class="h_row_center"
				style="margin-top: 78px; height: 240px; margin-bottom: 120px;">
				<div class="h_column_center"
					style="width: 400px; height: 240px; border-radius: 16px; box-shadow: 3px 3px 10px 0 rgba(0, 0, 0, 0.06); background-color: #ffffff;">
					<img
						src="https://s3.hourplace.co.kr/web/images/emoji/service_guest.png"
						style="margin-top: 50px; width: 44px; height: 44px;" />
					<div class="h_center"
						style="margin-top: 13px; height: 24px; width: 86px; border-radius: 12px; background-color: #1b1d1f;">
						<p
							style="font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: normal; text-align: center; color: #ffffff;">
							게스트</p>
					</div>
					<div class="h_center"
						style="margin-top: 30px; width: 280px; height: 56px; border-radius: 8px; background-color: #fafbfb; cursor: pointer;">
						<div class="h_row_center">
							<label for="guest_using" class="guest_using"
								style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #1b1d1f;">
								게스트 이용방법 </label> <input type="button" id="guest_using"
								onclick="window.location.href='login.html'"
								style="display: none; cursor: pointer;"> <img
								src="https://s3.hourplace.co.kr/web/images/icon/before.svg"
								style="margin-left: 8px; width: 20px; height: 20px; -webkit-transform: rotate(180deg)">
						</div>
					</div>
				</div>
				<!-- 게스트용 공지사항 끝 -->

				<!-- 호스트용 공지사항 -->
				<div class="h_column_center"
					style="margin-left: 40px; width: 400px; height: 240px; border-radius: 16px; box-shadow: 3px 3px 10px 0 rgba(0, 0, 0, 0.06); background-color: #ffffff;">
					<img
						src="https://s3.hourplace.co.kr/web/images/emoji/service_host.png"
						style="margin-top: 50px; width: 44px; height: 44px;" />
					<div class="h_center"
						style="margin-top: 13px; height: 24px; width: 86px; border-radius: 12px; background-color: #1b1d1f;">
						<p
							style="font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: normal; text-align: center; color: #ffffff;">
							공간 호스트</p>
					</div>
					<div class="h_center"
						style="margin-top: 30px; width: 280px; height: 56px; border-radius: 8px; background-color: #fafbfb; cursor: pointer;"
						onclick="window.location.href='/info/host'">
						<div class="h_row_center">
							<label for="host_using" class="host_using"
								style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: #1b1d1f;">
								호스트 이용방법 </label> <input type="button" id="host_using"
								onclick="window.location.href='login.html'"
								style="display: none; cursor: pointer;"> <img
								src="https://s3.hourplace.co.kr/web/images/icon/before.svg"
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
					<img src="//s3.hourplace.co.kr/web/images/emoji/14.svg"
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
					style="margin-top: 1px; font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: #1b1d1f; text-align: center;">
					평일 오전 9시~ 오후 3시 (주말 및 공휴일 제외) <br />*점심시간 오후 11시~오후 12시 30분
				</p>

				<!-- 문의하기 팝업 -->
				<div class="h_row_center" style="margin-top: 40px;">
					<div
						style="width: 132px; height: 40px; border-radius: 4px; border: solid 1px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;">
						<label class="info" id="info" onclick="show_direct()"
							style="width: 100%; height: 40px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; line-height: 40px; color: #26282b; cursor: pointer;">
							1:1 고객 문의 </label>
						<!-- onclick="show_direct()" width: 100%; height: 40px; line-height: 40px; -->

					</div>
					<div
						style="margin-left: 14px; width: 132px; height: 40px; border-radius: 4px; border: solid 1px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;">
						<label class="reportuser" id="reportuser"
							onclick="show_direct_two()"
							style="width: 100%; height: 40px; font-size: 15px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: center; line-height: 40px; color: #26282b; cursor: pointer;">
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
					<img src="https://s3.hourplace.co.kr/web/images/icon/close.svg"
						style="width: 24px; height: 24px;" />
				</div>

				<form id="form_question" method="post"
					style="margin-top: 30px; padding: 0 40px; margin-bottom: 40px"
					action="">
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
							required placeholder="문의 내용을 입력해주세요" id="reprt_content" name="reprtContent"
							 > </textarea>
							
					</div>

					<div class="request direct_request" id="direct_request"
						v-bind:class="{'on': content.length > 10}"
						style="margin-top: 30px;">

						<input type="button" id="insertQues" value="direct" 
							style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: #1b1d1f; width: 100%; text-align: center; cursor: pointer;">

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
					<img src="https://s3.hourplace.co.kr/web/images/icon/close.svg"
						style="width: 24px; height: 24px;" />
				</div>

				<form id="form_direct_two"
					style="margin-top: 30px; padding: 0 40px; margin-bottom: 40px"
					action="">
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
					<input type="text" placeholder="예약번호" value="" id="rsvNum"
						name="rsvNum" v-model="rsvNum"
						style="width: 50%; margin: 2px; border: solid 1px slategray; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
						required>

					<p
						style="margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
						내용</p>

					<div
						style="margin-top: 8px; height: 192px; border-radius: 4px; border: solid 1px #dfe2e7; margin: 3px;">
						<textarea class="noresize"
							style="width: 100%; height: 100%; border: solid 1px slategray; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
							placeholder="문의 내용을 입력해주세요" id="reportCon" name="reportCon"
							v-model="reportCon"> </textarea>
					</div>

					<div class="request direct_request" id="direct_request"
						v-bind:class="{'on': content.length > 10}"
						style="margin-top: 30px;">
						<!-- <p style="margin-top: 30px;font-size: 18px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.44;letter-spacing: -0.1px;color: #1b1d1f; width: 100%; text-align: center">
                        문의하기
                    </p> -->
							style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: #1b1d1f; width: 100%; text-align: center; cursor: pointer;">
					</div>
				</form>
			</div>
		</div>
		<!-- 신고하기 팝업 내용 끝 -->

		<!-- script -->

		<script>
			function show_direct() {
				$('body').addClass('modal-open')
				$('.direct').show()
			}

			function close_direct() {
				$('body').removeClass('modal-open')
				$('.direct').hide()
			}

			function show_direct_two() {
				$('body').addClass('modal-open')
				$('.direct_two').show()
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
			$(document).on('click','#insertQues',function(){
				console.log("1:1문의 등록버튼 클릭");
				$("#form_question").attr("action","/guestques.do");
				$("#form_question").submit();
			});

			
		</script>




		<!-- script 끝 -->
</body>
</html>