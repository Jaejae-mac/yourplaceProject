<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>프로필 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
   <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <style>       
        textarea{
	width:500px; 
	height:100px; 
    resize:none;
    position:relative; right:10px;

}
  
</style>


</head>

<body class="sb-nav-fixed">
<%@include file="hostnav.jsp" %>
        
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">프로필 수정</h1>
                </div>
                <div class="card-body">
					<div style="margin-left: 200px; margin-top: 50px; margin-bottom: 120px; width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff;">
						<form action="" id="mypagefix_form" method="post" enctype="multipart/form-data">
						<div class="h_center" style="margin-top: 50px; display: flex; flex-direction: column; align-items: center; justify-content: center">
							<label style="position: relative; width: 120px; height: 120px" data-toggle="tooltip"> 
								<img src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${userImg}"
									style="width: 100%; height: 100%; border-radius: 60px; position: absolute;" id="avatar" />
								
								<input type="file" id="input"  accept="image/*" style="display: none " name="Profile">
							</label>
							<!-- 프로필에서 이미지 변경을 안할시 이미지 유지를 위한 값 설정 -->
							<input type="hidden" name="userProfileImg" id="userProfileImg" value='${userImg}'>
							<!-- 설정 끝 -->
							<div style="position: relative; width: 120px;" >
								<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
									onclick= "deleteImg()"; style="width: 24px; height: 24px; position: absolute; right: 0; bottom: 0;" />
							</div>									
						</div>
						
							<div
								style="margin-top: 60px; margin-left: 50px; margin-right: 50px; margin-bottom: 10px">
								
								<div
									style="width: 448px; padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
									<p
										style="margin-bottom: 0; font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50;">
										이름과 연락처, 이메일 및 비밀번호 등의 개인 정보 수정은 마이페이지 하단의 설정에서 변경 가능합니다.</p>
								</div>
								<input type="hidden" id="userType" name="userType" value="${userType}"/>
								<input type="hidden" id="userId" name="userId" value="${userId}"/>
								<input type="hidden" id="userNum" name="userNum" value="${userNum}"/>  
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
										value="${userNick}" id="userNickName"
										name="userNickName" onchange="check_Nick()" required>
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
										value="${userMail}" id="userEmail" name="userEmail"
										onchange="check_Email()" required>
									<div class="delete" onclick="delete_email()">
										<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
											style="width: 16px; height: 16px;" />
									</div>
								</div>
								<!-- 이메일 입력칸에 값 존재 여부 -->
								<input type="hidden" name="Email" id="Email" value="Y">
								<!-- 존재 여부 끝 -->
								
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
									style="width: 448px; height: 192px; margin-top: 8px; padding: 14px; border-radius: 4px; border: solid 1px #dfe2e7;">
									<textarea class=""
										style="resize: none; width: 100%; height: 100%; border-width: 0; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
										placeholder="소개를 입력하세요" id="userIntro" name="userIntro">${userInfo}</textarea>
								</div>
							</div>
							<div class="h_column_center" style="margin-bottom: 60px;">
								<div style="width: 123px; height: 52px;"class="btn btn-primary btn-lg"onclick="userupdate()">
									<label>수정하기</label>
								</div>
							</div>
							</form>
				</div>

-->
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright &copy; YourPlace</div>
                <div>


                </div>
            </div>
        </div>
    </footer>
    </div>
    </div>
 
<script>
//프로필 미리보기를 위한 function
$(document).ready(function() {
    $('#input').on('change', function() {
        $('#imageupload-label').text($(this).val());
    });
});
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
            const previewImage = document.getElementById("avatar")
            previewImage.src = e.target.result
        }
        reader.readAsDataURL(input.files[0])
    }
    
}
const inputImage = document.getElementById("input")
inputImage.addEventListener("change", e => {
    readImage(e.target)					    
})
// 프로필 미리보기 끝
// 내용 삭제 기능
                    function delete_nickname() {
                        $('#userNickName').val('');
                    }
                    function delete_email() {
                        $('#userEmail').val('');
                        document.getElementById('Email').value = 'N'
                    }
                    function deleteImg(){
                    	document.getElementById('avatar').setAttribute('src', 'https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png') 
                    	document.getElementById('userProfileImg').value="profile/default/defaultprofile.png";
                    	$("#input").val("");
                    }
                    
                    // 이메일 유효성검사 및 오류메세지 출력기능
                    function check_Email() {
                        var email = $("#userEmail").val();
                        var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                        if (document.getElementById('userEmail').value != '') {
                            if (regEmail.test(email)) {
                                document.getElementById('cEmail').innerHTML = '정상적인 이메일 주소입니다.'
                                document.getElementById('cEmail').style.color = 'blue'
                                document.getElementById('Email').value = 'Y'
                            } else {
                                document.getElementById('cEmail').innerHTML = '이메일을 다시 작성해주세요.'
                                document.getElementById('Email').value = 'N'
                            }
                        }else{
                        	document.getElementById('cEmail').innerHTML = '이메일을 작성해주세요.'
                            document.getElementById('Email').value = 'N'
                        }
                    }
                    // 회원 정보 수정
                    function userupdate(){
                        console.log("update pressed");
                        if($(Email).val() == "N"){
                        	Swal.fire({
                        		  icon: 'error',
                       			  title: '이메일을 입력해주세요',
                       			  text: '현재 이메일칸이 비어있거나 잘못작성하셨습니다.'
                        		}) 	
                        }else{
        	            $("#mypagefix_form").attr("action","/updateUser.do").submit();
        	            }
                    }
</script>
  
  
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>

</body>



</html>
