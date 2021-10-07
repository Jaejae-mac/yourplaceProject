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
   .photoFrame{
      width: 500px;
      height: 500px;
    }
    .photoFrame:hover{
      cursor: pointer;
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


                    <div
                        style="margin-top: 50px;position: relative; left: 100px; margin-bottom: 120px; width: 580px; border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
                        <div class="h_center"
                            style="margin-top: 50px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
						<div id="image_container"  >

	
							<img
								src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png"
								id="default"
								style="width: 100%; height: 100%; border-radius: 60px; position: relative; left: 100px; width: 120px; height: 120px;">

							<input type="file"
								name="uploadImg" id="uploadImg"
			
								style="position: relative; left: 10px; top: 70px;">
								  <div id="pictures"></div>

						</div>

					</div>
                        <div id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"
                            class="modal fade">
                            <div role="document" class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 id="modalLabel" class="modal-title">프로필 이미지</h5> <button type="button"
                                            data-dismiss="modal" aria-label="Close" class="close"><span
                                                aria-hidden="true">×</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="img-container">
                                        <img id="image" src="https://avatars0.githubusercontent.com/u/3456749"
                                                style="max-width: 400px;"></div>
                                    </div>
                                    <div class="modal-footer"><button type="button" data-dismiss="modal"
                                            class="btn btn-default">취소</button> <button type="button" id="crop"
                                            class="btn btn-primary">확인</button></div>
                                </div>
                            </div>
                        </div>
                
                        <div style="margin: 60px 50px 10px;">
                            <div style="padding: 12px 14px; border-radius: 8px; background-color: var(--grey-010);">
                                <p
                                    style="font-size: 14px; text-align: center; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;  color: var(--grey-060);">
                                 
                                </p>
                            </div>
                            <div style="margin-top: 30px; display: flex; flex-direction: row; ">
                                <p
                                    style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; position: relative; left: 150px; line-height: 1.17; text-align: center;   letter-spacing: normal; color: var(--grey-040);">
                                    닉네임
                                </p> <img src="https://s3.hourplace.co.kr/web/images/icon/invalid.svg"
                                    style="margin-left: 4px; width: 6px; height: 6px; position: relative; left: 150px;">
                            </div>
<div style="position:relative; left:150px;">
					
					<input type="text" value="${userNick}" name="nickName" id="nickName"/>
     </div>
     <div style="margin-top: 30px; display: flex; flex-direction: row; ">
                                <p
                                    style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; position: relative; left: 150px; line-height: 1.17; text-align: center;   letter-spacing: normal; color: var(--grey-040);">
                                    이메밀
                                </p> <img src="https://s3.hourplace.co.kr/web/images/icon/invalid.svg"
                                    style="margin-left: 4px; width: 6px; height: 6px; position: relative; left: 150px;">
                            </div>
<div style="position:relative; left:150px;">
							<input type="text" value="${userMail}" id="email" name="email"/>
</div>
     <div style="margin-top: 30px; display: flex; flex-direction: row; ">
                                <p
                                    style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; position: relative; left: 150px; line-height: 1.17; text-align: center;   letter-spacing: normal; color: var(--grey-040);">
                                   
                                   전화번호
                                </p> <img src="https://s3.hourplace.co.kr/web/images/icon/invalid.svg"
                                    style="margin-left: 4px; width: 6px; height: 6px; position: relative; left: 150px;">
                            </div>

							<p style="text-align:center;">${userTel}</p>




						
                            </div>
                            <div style="height: 36px; display: none; flex-direction: row; align-items: center;">
                                <p
                                    style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; color: var(--red);">

                                </p>
                            </div>
                   
                            <p
                                style="margin-top: 40px; font-size: 12px; font-weight: bold; position: relative; left: 70px; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(--grey-040);">
                                소개
                            </p>
     
        <div style="position:relative; left:50px;">
      <textarea name="userInfo" id="userInfo">${userInfo}</textArea>
                             </div>
                             
                              <div style="position:relative; left:70px;">
                            <input type="submit" class="btn btn-primary" name="sub" id="sub" onclick="a()"
                                style="font-size: 10px;margin-left: 10px; position:relative; left: 190px; top: 80px;" value="확인"/>
						

					</div>
                    </div>
                </div>



        </div>
    </div>


    </div>
    </div>
    </div>
      
    </main>


	<form id="subb" name="subb" method="Post" hidden="hidden" action="/myProfile.hdo">
					<input type="hidden" name="nickv" id="nickv" value=""> <input
						type="hidden" name="emailv" id="emailv" value="" /> <input
						type="hidden" name="introv" id="introv" value="" /> 

				</form>

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

function a()
{
	
	var nickN = $("#nickName").val();
	var maill = $("#email").val();
	var infoo = $("#userInfo").val();

	var arr1 = new Array();
	var arr2 = new Array();
	var arr3 = new Array();

	arr1.push(nickN);
	arr2.push(maill);
	arr3.push(infoo);
	
	
	console.log(arr1);
	console.log(arr2);
	console.log(arr3);
	

	var userProfileImg = $('input[name="uploadImg"]').get(0).files[0];
	var formData = new FormData();
	formData.append('userProfileImg', userProfileImg);
	
	
	$.ajax(

	{
	
	url : '/myProfile.hdo',
			data :formData,
			processData : false,
			contentType : false,
			async : false,
			type : 'POST',
			success : function(xh) {
			}
		});
	
	
	$.ajax(

			{
			
			url : '/getInfoValue.hdo',
					data : {userNickName : arr1, userEmail : arr2, userIntro : arr3},
					datatype : "text",
					type : 'POST',
					success : function(xh) {
					 	alert("전송완료");
					}
				});
	
	}
	
	
	
	
	
</script>
 
  
  
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>

</body>



</html>