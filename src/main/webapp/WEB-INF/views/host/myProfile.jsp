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
    <title>YourPlace 호스트 프로필</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
   <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
	<!-- SweetAlert Lib -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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
                <div class="container-fluid px-4"style="margin-left: 30px;">
                    <h1 class="mt-4">프로필 </h1>

                </div>
                <div class="card-body"style="margin-left: 200px;">
                <div class="h_row">
					<div style="width: 500px;border-radius: 20px;border: solid 1px #dfe2e7;background-color: #ffffff;">
                    <div class="h_column_center">
                        <div style="position:relative; margin-top: 50px; width: 180px; height: 180px; border-radius: 100px; overflow:hidden;">         
                            <img src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${userImg}"
                                style="width: 100%; height: 100%; position: absolute;"> 
                            
                        </div>
                        <p style="padding: 0 20px; margin-top: 20px; font-size: 16px; font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.38;letter-spacing: -0.1px;text-align: center;color: #1b1d1f;">
                        	${userNick}
                        </p>
                    </div>
                    <div style="margin: 30px 30px 40px;">
                        <div class="h_row_center" style="height: 34px;">
                            <p style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                            	상세 정보
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	이름
                            </p>
                            <p class="h_ellipsis_1" style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	${userName}
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	이메일
                            </p>
                            <p class="h_ellipsis_1" style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	${userMail}
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	전화번호
                            </p>
                            <p class="h_ellipsis_1" style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	${userTel}
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	소개
                            </p>
                        </div>
                        <div class="h_center" style="margin-top: 5px;position: relative; height: auto;">
                            <p class="h_ellipsis_1" style="position: relative; right: 0px; left: 0px; text-align: left; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	<c:if test="${userInfo == null or userInfo == ''}">
			                    	안녕하세요. ${userNick} 입니다.
			                    </c:if>
			                    <c:if test="${userInfo != null }">
			                    	${userInfo}
                    			</c:if>
                            </p>
                        </div>
                    </div>
                    
                	</div>
                	<div class="h_center">
                	<!-- 편집이동 버튼 -->
		                <div onclick="location.href='/updateProfileforHost.hdo'" class="h_center h_hover_button"
		                    style="margin-top: 100px;margin-left: 20px; width: 141px; height: 52px; border-radius: 8px; background-color: #3c82fa;border: 3px solid #72787f; cursor: pointer;">
		                    <p style="padding-top: 12px;font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: #ffffff;">
		                    	프로필 편집
		                    </p>
		                </div>
		                <!-- 비밀번호 변경버튼 -->
		                <div onclick="location.href='/gocheckPw.hdo'" class="h_center h_hover_button"
		                    style="margin-top: 20px;margin-left: 20px; width: 141px; height: 52px; border-radius: 8px; background-color: #3c82fa;border: 3px solid #72787f; cursor: pointer;">
		                    <p style="padding-top: 12px;font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: #ffffff;">
		                    	비밀번호 변경
		                    </p>
		                </div>
		                <div onclick="deleteUser()" class="h_center h_hover_button"
		                    style="margin-top: 20px;margin-left: 20px; width: 141px; height: 52px; border-radius: 8px; background-color: #ff4b3e;border: 3px solid #72787f; cursor: pointer;">
		                    <p style="padding-top: 12px;font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: #ffffff;">
		                    	회원탈퇴
		                    </p>
		                </div>
		             </div>
	            </div>       
			</div>
			<!-- 회원탈퇴를 위한 form -->
	        <form action="" id="delete_form" method="post">
	        	<input type="hidden" name="userNum" value="${userNum}"/>
	        	<input type="hidden" name="userProfileImg" value="${userImg}"/>
	        </form>
    		</main>
		</div>
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright &copy; YourPlace</div>
                <div>


                </div>
            </div>
        </div>
    </footer>
  
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

<script>
function deleteUser(){
	Swal.fire({
		  title: '정말로 탈퇴하시겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '네, 탈퇴하겠습니다!',
		  cancelButtonText: '아니오.'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		      title : '성공적으로 탈퇴되었습니다.',
		      text : '지금까지 YourPlace를 이용해 주셔서 감사합니다.',
		      icon :'success'
		    }).then((result) => {
		    	$("#delete_form").attr("action","/deleteUser.do").submit();
		    })
		  }
		})
			 
}


</script>

</html>
