<%@page import="com.yourplace.custom.login.vo.UserVO" %>
<%@page import="com.yourplace.custom.login.dao.impl.LoginDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yourplace MyPagefix</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body>
	<!-- 세션에 아이디 값이 존재 한다면 마이페이지를 불러주어라. -->
	<c:if test="${userId != null}">
		MyPageFix - ${userId}
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<div class="h_column_center" id="main_vue" style="min-height: 1000px;">
		<div style="margin-top: 20px;">
			<p
				style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
				프로필 편집</p>
		</div>
		<div style="margin-top: 50px; margin-bottom: 120px; width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff;">
			<div class="h_center" style="margin-top: 50px; display: flex; flex-direction: column; align-items: center; justify-content: center">
				<label style="position: relative; width: 120px; height: 120px" data-toggle="tooltip"> 
					<img src="<c:url value="/resources/img/icon/register/elements_image_empty_guest.png" />"
						style="width: 100%; height: 100%; border-radius: 60px; position: absolute;"id="avatar" /> 
					<img src="<c:url value="/resources/img/icon/register/my_profile_edit.png" />"
						style="width: 24px; height: 24px; position: absolute; right: 0; bottom: 0;" />
					<input type="file" id="input" accept="image/*" style="display: none">
				</label>
			</div>
			<!--  
	       <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="modalLabel">프로필 이미지</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <div class="img-container">
	                            <img id="image" src="https://avatars0.githubusercontent.com/u/3456749"
	                                style="max-width: 400px">
	                        </div>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                        <button type="button" class="btn btn-primary" id="crop">확인</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	        -->
				<form action="" id="mypagefix_form" method="post">
				<div
					style="margin-top: 60px; margin-left: 50px; margin-right: 50px; margin-bottom: 10px">
					
					<div
						style="width: 448px; padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
						<p
							style="margin-bottom: 0; font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50;">
							이름과 연락처, 이메일 및 비밀번호 등의 개인 정보 수정은 마이페이지 하단의 설정에서 변경 가능합니다.</p>
					</div>
					<input type="hidden" name="userId" value="${user.userId}">
					<div
						style="width: 448px; margin-top: 40px; display: flex; flex-direction: row">
						<p
							style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
							닉네임</p>
						<img src="<c:url value="/resources/img/icon/register/invalid.png" />"
							style="margin-left: 4px; width: 6px; height: 6px">
					</div>

					<div class="input_container" style="margin-top: 8px; width: 448px;">
						<input type="text" placeholder="닉네임을 입력하세요"
							value="${user.userNickName}" id="userNickName"
							name="userNickName" required>
						<div class="delete" onclick="delete_nickname()">
							<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
								style="width: 16px; height: 16px;" />
						</div>
					</div>

					<div
						style="width: 448px; margin-top: 40px; display: flex; flex-direction: row">
						<p
							style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
							이메일</p>
						<img src="<c:url value="/resources/img/icon/register/invalid.png" />"
							style="margin-left: 4px; width: 6px; height: 6px">
					</div>

					<div class="input_container" style="margin-top: 8px; width: 448px;">
						<input type="text" placeholder="이메일을 입력하세요"
							value="${user.userEmail}" id="userEmail" name="userEmail"
							onchange="check_Email()" required>
						<div class="delete" onclick="delete_email()">
							<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
								style="width: 16px; height: 16px;" />
						</div>
					</div>
					<!-- 이메일 검증 결과 내역 -->
					<div
						style="height: 36px; display: flex; flex-direction: row; align-items: center;">
						<p id="cEmail"
							style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; margin-top: 5px; margin-bottom: 0; color: #ff4b3e;">
						</p>
					</div>
					<!-- 이메일 검증 문구 끝-->
					<p
						style="width: 448px; height: 13.6px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
						소개</p>
					<div
						style="width: 448px; height: 192px; margin-top: 8px; padding: 14px; border-radius: 4px; border: solid 1px var(- -grey-025);">
						<textarea class=""
							style="resize: none; width: 100%; height: 100%; border-width: 0; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
							placeholder="소개를 입력하세요" id="userIntro" name="userIntro"></textarea>
					</div>

					<div class="h_row_center h_check"
						style="margin-top: 30px; height: 32px; background-color: #ffffff; cursor: pointer;">
						<img src="<c:url value="/resources/img/icon/register/check_g.png" />"
							style="margin-left: 8px; margin-right: 10px; width: 18px; height: 18px"
							class="agree-mail" id="agree-mail" />
						<p id="cMail"
							style="margin-bottom: 0; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
							[선택] 아워플레이스 소식 메일 수신 동의</p>
						<input type="hidden" name="userEmailAgree" id="emailagree" value="N">
					</div>
					<div class="h_row_center h_check"
						style="height: 32px; background-color: #ffffff; cursor: pointer;">
						<img src="<c:url value="/resources/img/icon/register/check_g.png" />"
							style="margin-left: 8px; margin-right: 10px; width: 18px; height: 18px"
							class="agree-sms" id="agree-sms" />
						<p id="cSMS"
							style="margin-bottom: 0; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
							[선택] 아워플레이스 SMS 수신 동의</p>
						<input type="hidden" name="userSmsAgree" id="smsagree" value="N">
					</div>
				</div>
				<div class="h_column_center" style="margin-bottom: 60px;">
					<div style="width: 123px; height: 52px;"class="btn btn-primary btn-lg"onclick="userupdate()">
						<label>수정하기</label>
					</div>
				</div>
				</form>
				<script>
					var userEmailAgree = 'N'
                    var userSmsAgree = 'N'
                    // 내용 삭제 기능
                    function delete_nickname() {
                        $('#userNickName').val('');
                    }
                    function delete_email() {
                        $('#userEmail').val('');
                    }
                    // 이메일 유효성검사 및 오류메세지 출력기능
                    function check_Email() {
                        var email = $("#userEmail").val();
                        var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                        if (document.getElementById('userEmail').value != '') {
                            if (regEmail.test(email)) {
                                document.getElementById('cEmail').innerHTML = ''
                            } else {
                                document.getElementById('cEmail').innerHTML = '이메일을 다시 작성해주세요.'
                            }
                        }
                    }
                    // 회원 정보 수정
                    function userupdate(){
                        console.log("update pressed");
        	            $("#mypagefix_form").attr("action","/updateUser.do").submit();
                    }
                    // 동의 내역
                    $(document).on('click', '.agree-mail', function () {
                        if (userEmailAgree != "Y") {
                            document.getElementById('agree-mail').setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                            document.getElementById('cMail').style.color = 'blue';
                            document.getElementById('emailagree').value = 'Y'
                            userEmailAgree = "Y";
                        } else {
                            document.getElementById('agree-mail').setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                            document.getElementById('cMail').style.color = '#9ea4aa';
                            document.getElementById('emailagree').value = 'N'
                            userEmailAgree = "N";
                        }
                    });
                    $(document).on('click', '.agree-sms', function () {
                        if (userSmsAgree != "Y") {
                            document.getElementById('agree-sms').setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                            document.getElementById('cSMS').style.color = 'blue';
                            document.getElementById('smsagree').value = 'Y'
                            userSmsAgree = "Y";
                        } else {
                            document.getElementById('agree-sms').setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                            document.getElementById('cSMS').style.color = '#9ea4aa';
                            document.getElementById('smsagree').value = 'N'
                            userSmsAgree = "N";
                        }
                    });
                </script>
</body>
</html>