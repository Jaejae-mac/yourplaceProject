<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Yourplace_회원가입</title>
 
<link rel="stylesheet"
	href="<c:url value="/resources/css/user-register-style.css?alter" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user-register.css?alter" />">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
	
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script>
        $(document).ready(function () {
            var checkPw = false;
            //비밀번호
            var pwd1;
            //비밀번호확인.
            var pwd2;
            var email; 
            var nickname;
            //패스워드가 정규식에 부합하는지 판단하는 변수. 
            var pwdchk;
            //동의 여부 판단 변수 3개
            //참 : 동의 
            //거짓 : 비동의
            var chkAllFlag = false;
            var chkService = false;
            var chkPersonal = false;
          //아이디 중복 버튼 클릭 여부.
            var idChkBtn = false;
          //아이디 중복 여부판단 변수.
            var overlap = false;
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("#alert-danger-email").hide();
            $("#alert-danger-nick").hide();
            $("#alert-danger-pw").hide();
            
            //전체 동의를 눌렀을때 서비스 동의 및 인적 동의에 동의가 되도록 이미지 색상 변경 및 참거짓값 변경.
            //참 : 동의 상태 / 거짓: 동의 안한 상태.
            $(document).on('click','.agree-all',function(){
                if(!chkAllFlag){
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check_b.png' />");
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                    chkAllFlag=true;
                    chkService=true;
                    chkPersonal=true;
                    $('#agreeAll').val("Y");
                    $('#agreeService').val("Y");
                    $('#agreePersonal').val("Y");
                }else{
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check.png' />");
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                    chkAllFlag=false;
                    chkService=false;
                    chkPersonal=false;
                    $('#agreeAll').val("N");
                    $('#agreeService').val("N");
                    $('#agreePersonal').val("N");
                }
                
            });
            //수정해야함. 아직 미완성.
            $(document).on('click','.agree-service',function(){
                if(!chkAllFlag &&chkPersonal && !chkService){
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check_b.png' />");
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                    chkAllFlag=true;
                    chkService=true;
                    chkPersonal=true;
                    $('#agreeAll').val("Y");
                    $('#agreeService').val("Y");
                    $('#agreePersonal').val("Y");
                    return;
                }
                else if(!chkAllFlag &&!chkPersonal &&!chkService){
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                    chkService=true;
                    $('#agreeService').val("Y");
                    return;
                }else{
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check.png' />");
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                    console.log("back!!");
                    chkAllFlag=false;
                    chkService=false;
                    $('#agreeAll').val("N");
                    $('#agreeService').val("N");
                    return;
                }
            });
            $(document).on('click','.agree-personal',function(){
                if(!chkAllFlag &&!chkPersonal && chkService){
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check_b.png' />");
                	document.getElementById("agree-service").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                    chkAllFlag=true;
                    chkService=true;
                    chkPersonal=true;
                    $('#agreeAll').val("Y");
                    $('#agreeService').val("Y");
                    $('#agreePersonal').val("Y");
                    return;
                }
                else if(!chkAllFlag &&!chkPersonal && !chkService){
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_b.png' />");
                    chkPersonal=true;
                    $('#agreePersonal').val("Y");
                    return;
                }else{
                	document.getElementById("agree-all").setAttribute('src', "<c:url value='/resources/img/icon/register/controls_round_check.png' />");
                	document.getElementById("agree-personal").setAttribute('src', "<c:url value='/resources/img/icon/register/check_g.png' />");
                    console.log("back!!");
                    chkAllFlag=false;
                    chkPersonal=false;
                    $('#agreeAll').val("N");
                    $('#agreePersonal').val("N");
                    return;
                }
            });
            
        });
        $(function () {
            $("input").keyup(function () {
                //비밀번호 입력란에 들어 있는 값을 각각 가져온다.
                pwd1 = $("#password").val();
                pwd2 = $("#confirm_password").val();
                email = $("#email").val();
                nickname = $("#nickname").val();
                
                //아이디 input 태그를 한번이라도 클리한다면, 
                //overlap 변수를 true 로 변경한다.
                overlap = true;
				
                if(email === "" ){
                    $("#alert-danger-email").hide();
                }
                if(nickname === "" ){
                    $("#alert-danger-nick").hide();
                }
                if (pwd1 === "" && pwd2 === "") {
                    $("#alert-success").hide();
                    $("#alert-danger").hide();
                    $("#alert-danger-pw").hide();
                }
                
                //비밀번호 입력란이 비어있지 않다면.
                if (pwd1 != "" || pwd2 != "") {
                    pwdchk=chkPW();
                    if(pwdchk){
                        $("#alert-danger-pw").hide();
                    }else{
                        $("#alert-danger-pw").show();
                    }
                    //비밀번호와 비밀번호 확인란이 일치 한다면
                    if (pwd1 == pwd2) {
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                        checkPw = true;
                    } else {
                        $("#alert-success").hide();
                        $("#alert-danger").show();
                        checkPw = false;
                    }
                }
                if(email != ""){
                	if(!emailchk()){
                		$("#alert-danger-email").show();
                	}else{
                		$("#alert-danger-email").hide();
                	}
                }
            });
            
            //ID 중복 여부를 서버와 통신하여 체그하는 함수.
            //중복 확인 버튼 클릭 시 동
            //만약 응답받은 값이 'no'라면 사용불가.(중복된 아이디 입니다.)
            //만약 응답받은 값이 'ok'면   사용가능.(사용 가능한 아이디 입니다.)
            //사용자가 가입을 완료하기 위해서는 
            //idChkBtn : ture , overlap : false 여야 한다.
            $(document).on('click','#id_chk',function(){
                var userId = $("#id").val();
                //아이디 입력란이 비어있다면 중복확인을 수행하면 안됨.
                if(userId != ""){//begin userId empty check
                	//버튼 클릭했기 때문에 클릭 완료 : true
                    idChkBtn = true;
                    $.ajax({
                    	url:"/idcheck.do",
                    	type:"post",
                    	data:{"id":userId},
                    	success:function(responseData){
                    		if(responseData === '1'){
                    			//버튼 클릭 했으나 중복되었기 때문에 false
                    			idChkBtn = false;
                    			//중복됨 : true
                    			overlap = true;
                    			$('#idcheck').val('N');
                    			Swal.fire({
                      			  icon:'error',
                      			  title:'사용불가능한 아이디 입니다.',
                            });
                    		}else if(responseData === '0'){
                    			overlap = false;
                    			$('#idcheck').val('Y');
                    			Swal.fire({
                        			  icon:'success',
                        			  title:'사용 가능한 아이디 입니다.',
                              });
                    		}
                    	}
                    });
                	}//end userId empty check
                	else{
                		Swal.fire({
                			  icon:'error',
                			  title:'아이디를 입력해주세요.',
                      });
                	}
                 });    
        });
		function regist(){
           	console.log("regist pressed");
           	var name = $('#name').val().trim();
            var nickname = $('#nickname').val().trim();
           	var idcheck = $('#idcheck').val();
           	var telcheck = $('#telcheck').val();
           	var agreeAll = $('#agreeAll').val();
            var agreeService = $('#agreeService').val();
            var agreePersonal = $('#agreePersonal').val();
           	if(idcheck == "N"){
               	Swal.fire({
              		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
               		text: '아이디를 입력해주시거나 중복확인을 해주시기 바랍니다.'
                })
               	return false;
            }else if(!chkPW()){
            	Swal.fire({
               		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
                	text: '비밀번호를 제대로 입력해주세요.'
                })
                return false;
            }else if(telcheck == "N"){
                Swal.fire({
               		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
                	text: '본인인증을 해주시기 바랍니다.'
                })
                return false;
            }else if(name == ""){ 
                Swal.fire({
               		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
               		text: '이름을 입력해주세요.',
               	})
               	return false;
            }else if(nickname == ""){ 
                Swal.fire({
               		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
               		text: '닉네임을 입력해주세요.',
               	})
                return false;
            }else if(!emailchk()){
               	Swal.fire({
              		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
                	text: '이메일을 제대로 입력해주세요.'
               	})
                return false;
            }else if(agreeAll == "N" || agreeService == "N" || agreePersonal == "N"){
                Swal.fire({
               		icon: 'error',
                	title: '회원가입을 하실수 없습니다.',
                	text: '서비스 동의를  체크해주세요.'
               	})
               	return false;
            }else{
                $("#regist_form").attr("action","/regist.do").submit();
            }
       }
     //전화번호 정규식.
     var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

     function chkPW() {
       var pw = $("#password").val();
       var id = $("#id").val();
       var reg = /^(?=.*?[a-z])(?=.*?[0-9])$/;
       if (pw.length < 8 || pw.length > 20) {
        $(".alert-danger-pw").text("비밀번호는 8자 이상이어야 하며, 숫자/소문자를 모두 포함해야 합니다.");
          return false;
        }
       if(reg.test(pw)){
        $(".alert-danger-pw").text("비밀번호는 8자 이상이어야 하며, 숫자/소문자를 모두 포함해야 합니다.");
       }else if (pw.search(id) > -1) {
         $(".alert-danger-pw").text("비밀번호에 아이디가 포함되었습니다.");
         return false;
       }else if (/(\w)\1\1\1/.test(pw)) {
         $(".alert-danger-pw").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
         return false;
       }  else if (pw.search(/\s/) != -1) {
         $(".alert-danger-pw").text("비밀번호는 공백 없이 입력해주세요.");
         return false;
       }else {
        $(".alert-danger-pw").text("올바른 비밀번호 양식입니다.");
         return true;
       }
     }
	function emailchk(){
		 var email = $("#email").val().trim();
         var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
         if(email != ''){
             if(regEmail.test(email)){
                 return true;
             }else{
                 return false;
             }
         }
	}
     
   </script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<form action="" id="regist_form" method="post">
	<input type="hidden" name="userType" id="userType" value="${userType}">
	<div class="h_column_center" style="margin-top: 100px;">
		<p
			style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
			회원가입</p>
	</div>
	<div id="main_vue" class="h_column_center"
		style="width: 100%; margin-top: 20px; margin-bottom: 200px;">
		<div
			style="width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff; padding: 40px 50px;">

			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					아이디</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
				<input type="hidden" id="idcheck" value="N">
			</div>
			<div class="input_container disabled"
				style="margin-top: 8px; cursor: pointer;">
				<!-- 인증기능 페이지로 이동-->
				<input type="text" autocomplete=”off” placeholder="아이디를 입력해주세요." id="id" name="userId"
					required />
				<div class="h_center" id="id_chk"
					style="position: absolute; right: 7px; padding-right: 18px; padding-left: 18px; height: 38px; border-radius: 4px; background-color: black;">
					<label for="id_chk"
						style="margin-bottom: 0; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #ffffff;">
						중복 확인 </label>
				</div>
			</div>
			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					비밀번호</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>

			<div class="input_container" style="margin-top: 8px;">
				<input type="password" maxlength="20"
					placeholder="영문/숫자 조합 8-20자로 입력하세요" value="" id="password"
					name="userPw" required>
				<div class="delete" onclick="delete_password()">
					<img
						src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
						style="width: 16px; height: 16px;" />
				</div>
			</div>
			<div class="alert alert-danger" id="alert-danger-pw"
				style="margin-top: 10px; font-size: 13px;">
				<p class="alert-danger-pw"></p>
			</div>
			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					비밀번호 확인</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>
			<div class="input_container" style="margin-top: 8px;">
				<input type="password" maxlength="20"
					placeholder="영문/숫자 조합 8-20자로 입력하세요" value="" id="confirm_password"
					name="confirm_password" required>
				<div class="delete" show="confirm_password.length > 0"
					onclick="delete_confirm_password()">
					<img
						src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
						style="width: 16px; height: 16px;" />
				</div>
			</div>
			<div class="alert alert-success" id="alert-success"
				style="margin-top: 10px; font-size: 13px;">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger"
				style="margin-top: 10px; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>
			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					본인 인증</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
				<input type="hidden" id="telcheck" value="N">
			</div>
			<div class="input_container disabled"
				style="margin-top: 8px; cursor: pointer;">
				<!-- 인증기능 페이지로 이동-->
				<input type="text" placeholder="본인인증을 진행해 주세요" model="nice_auth"
					id="userPhoneNum" name="userTel" required />
				<div class="h_center"
					style="position: absolute; right: 7px; padding-right: 18px; padding-left: 18px; height: 38px; border-radius: 4px; background-color: black;">
					<label for="tel"
						style="margin-bottom: 0; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #ffffff;">
						휴대폰 인증 </label> <input type="button" id="tel" 
						style="display: none;">
				</div>
			</div>
			<div class="h_row_center"
				style="position: relative; margin-top: 10px; cursor: pointer;"
				onclick="toggle_auth_info()">
				<img
					src="<c:url value="/resources/img/icon/register/more_info.png" />"
					style="width: 14px; height: 14px;" />
				<p
					style="margin-left: 4px; margin-bottom: 0; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; text-align: right; color: #246ff8;">
					본인 인증 안내</p>

				<div class="auth_info"
					style="display: none; position: absolute; top: 18px; left: -10px; z-index: 1;">
					<div class="triangle-with-shadow" style="margin-left: 30px"></div>
					<div
						style="width: 320px; margin-top: -1px; padding: 12px; border-radius: 6px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">
						<div class="h_row">
							<div
								style="margin-top: 6px; max-width: 3px; max-height: 3px; min-width: 3px; min-height: 3px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #72787f; border-radius: 1.5px">

							</div>
							<p
								style="margin-left: 7px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.36; letter-spacing: normal; color: #72787f;">
								입력하신 정보는 본인 확인을 위해 NICE평가정보(주)에 제공됩니다.</p>
						</div>
						<div class="h_row" style="margin-top: 4px">
							<div
								style="margin-top: 6px; max-width: 3px; max-height: 3px; min-width: 3px; min-height: 3px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #72787f; border-radius: 1.5px">

							</div>
							<p
								style="margin-left: 7px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.36; letter-spacing: normal; color: #72787f;">
								투명한 예약 및 결제 과정을 위하여 본인인증을 통해 성명 및 휴대전화번호를 수집합니다.</p>
						</div>
						<div class="h_row" style="margin-top: 4px">
							<div
								style="margin-top: 6px; max-width: 3px; max-height: 3px; min-width: 3px; min-height: 3px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #72787f; border-radius: 1.5px">

							</div>
							<p
								style="margin-left: 7px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.36; letter-spacing: normal; color: #72787f;">
								만 19세 미만의 미성년자는 회원가입 신청이 어렵습니다.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 10px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					이름</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>

			<div class="input_container" style="margin-top: 0px;">
				<input type="text" placeholder="이름을 입력하세요" value="" id="name"
					name="userName" required>
				<div class="delete" onclick="delete_name()">
					<img
						src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
						style="width: 16px; height: 16px;" />
				</div>
			</div>
			<div class="h_row" style="margin-top: 20px;">
				<p
					style="font-size: 12px; margin-bottom: 10px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					성별</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>
			<div  style="margin-top: 0; border-radius: 4px; border: 1px solid #e7eaee;min-height:52px;vertical-align:middle;line-height:52px;text-align:center;">
				<div style=" float: left; width: 49%;">
				<input type="radio" name="userSex" id="r2" value="male" checked/>
				<label for="r2" style="margin-left:10px">남성</label>
                </div>
                <div style=" float: left; width: 49%;">
                <input type="radio" name="userSex" id="r1" value="female"  />
                <label for="r1" style="margin-left:10px">여성</label>
                </div>
            </div>
			<div style="clear:both"></div>


			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					닉네임</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>

			<div class="input_container" style="margin-top: 8px;">
			<c:choose>
				<c:when test="${kakaoName != null} ">
				<input type="text" placeholder="닉네임을 입력하세요" id="nickname"
					name="userNickName" value="nothing" required>
				</c:when>
				<c:otherwise>
				
				<input type="text" placeholder="닉네임을 입력하세요" id="nickname"
					name="userNickName" value="<c:out value="${kakaoName}"/>" required>
					<script>
						$("#kakao_id").val("${kakaoId}");
					</script>
				</c:otherwise>
			</c:choose>
				<div class="delete" show="name.length > 0"
					onclick="delete_nickname()">
					<img
						src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
						style="width: 16px; height: 16px;" />
				</div>
			</div>
			<div class="alert alert-danger" id="alert-danger-nick"
				style="margin-top: 10px; font-size: 13px;">닉네임을 입력해주세요.</div>
			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					이메일</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-left: 4px; width: 6px; height: 6px">
			</div>

			<div class="input_container" style="margin-top: 8px;">
			<c:choose>
				<c:when test="${kakaoEmail != null} ">
				<input type="email" placeholder="이메일을 입력하세요" id="email"
					name="userEmail" required>
				</c:when>
				<c:otherwise>
				
				<input type="email" placeholder="이메일을 입력하세요" id="email" value="${kakaoEmail }"
					name="userEmail" required>
				</c:otherwise>
			</c:choose>
				
				<div class="delete" show="email.length > 0" onclick="delete_email()">
					<img
						src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
						style="width: 16px; height: 16px;" />
				</div>
			</div>
			<div class="alert alert-danger" id="alert-danger-email"
				style="margin-top: 10px; font-size: 13px;">이메일 형식이 올바르지 않습니다.
			</div>

			<div class="h_row" style="margin-top: 20px;">
				<p
					style="margin-bottom: 0; margin-top: 10px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					서비스 동의</p>
				<img
					src="<c:url value="/resources/img/icon/register/invalid.png" />"
					style="margin-top: 10px; margin-left: 4px; width: 6px; height: 6px">
				<input type="hidden" id="agreeAll" value="N">
				<input type="hidden" id="agreeService" value="N">
				<input type="hidden" id="agreePersonal" value="N">
			</div>

			<div class="h_row_center h_round_check"
				style="margin-top: 21px; height: 32px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #ffffff;">
				<img id="agree-all"
					src="<c:url value="/resources/img/icon/register/controls_round_check.png" />"
					style="margin-left: 6px; margin-right: 12px; width: 24px; height: 24px"
					class="agree-all" />
				<p
					style="margin-bottom: 5px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: #9ea4aa;">
					전체 동의하기</p>
			</div>

			<div class="h_row_center h_check"
				style="margin-top: 10px; height: 32px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #ffffff;">
				<img id="agree-service"
					src="<c:url value="/resources/img/icon/register/check_g.png" />"
					style="margin-left: 8px; margin-right: 10px; width: 18px; height: 18px"
					class="agree-service" />
				<p
					style="margin-bottom: 0px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					아워플레이스 서비스 이용약관 동의</p>
				<p
					style="position: absolute; right: 0; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #72787f; cursor: pointer;"
					onclick="window.open('/footertos.do')">보기</p>
			</div>

			<div class="h_row_center h_check"
				style="height: 32px; -webkit-backdrop-filter: blur(20px); backdrop-filter: blur(20px); background-color: #ffffff;">
				<img id="agree-personal"
					src="<c:url value="/resources/img/icon/register/check_g.png" />"
					style="margin-left: 8px; margin-right: 10px; width: 18px; height: 18px;"
					class="agree-personal" />
				<p
					style="margin-bottom: 0px; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;"
					onclick="agree_personal = true">아워플레이스 개인정보 처리방침 동의</p>
				<p
					style="position: absolute; right: 0; font-size: 12px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #72787f; cursor: pointer;"
					onclick="window.open('/footerpv.do')">보기</p>
			</div>
			<div class="" style="margin-top: 30px;height:50px;">
				<label for="request" class="btn btn-primary"
					style="width: 100%; text-align: center; height: 50px;line-height:30px">가입
					완료</label>
					 <input type="button" id="request" name="regist-btn"
					style="display: none;" onclick="regist()">

			</div>
		</div>
	</div>
	<input type="hidden" name="kakaoId" id="kakao_id" value="${kakaoId }">
	</form>
	<%@ include file="../footer.jsp" %>
	<script>
        function toggle_auth_info() {
            if ($('.auth_info').css('display') === 'none') {
                h_show_popup('.auth_info')
                // $('booking_type').hide()
            } else {
                h_hide_popup('.auth_info')
                // $('booking_type').show()
            }
        }
        function h_show_popup(id) {
            $(id).show()
        }

        function h_hide_popup(id) {
            $(id).hide()
        }
        function delete_name() {
            $('#name').val('');
        }
        function delete_nickname() {
            $('#nickname').val('');
        }
        function delete_email() {
            $('#email').val('');
        }
        function delete_password() {
            $('#password').val('');
        }
        function delete_confirm_password() {
            $('#confirm_password').val('');
        }
        
        
        
        $(document).on('click','#tel', function(){
            var userTel = $("#userPhoneNum").val();
            console.log(userTel)
            var authNum;
            if(userTel != ""){//beging userTel emptyCheck
                let timerInterval
            Swal.fire({
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
                clearInterval(timerInterval)
            }
            }).then((result) => {
            /* Read more about handling dismissals below */
            if (result.dismiss === Swal.DismissReason.timer) {
                console.log('I was closed by the timer')
            }
            });
            //서버로 전화번호 전송.
                $.ajax({
                url:"/authentication.do",
                type:"get",
                data:{"userTel":userTel},
                success:function(responseData){
                    authNum = responseData;
                }
                });
            }//end userTel empty Check
            else{
            	swal("","전화번호를 입력해주세요.","warning");
            }
            //인증번호 입력후 확인 버튼 클릭 시.
            $(document).on('click','#auth_num_btn', function(){
            var userAuthNum = $("#auth_num").val();
            swal.close();
            if(authNum === userAuthNum){
                console.log("전달받은 인증번호 : " + authNum);
                console.log("사용자   인증번호 : " + userAuthNum);
                Swal.fire({
          			  icon:'success',
          			  title:'인증번호 일치합니다.',
                });
                $('#telcheck').val("Y")
            }else{
            	Swal.fire({
            			  icon:'error',
            			  title:'인증번호가 일치하지 않습니다.',
            			  text:'다시 인증해주세요.'
            	}).then(function(isConfirm){
            		$('#telcheck').val("N");
            		window.location.reload();		
                	
                });
                console.log("다릅니다.");
                
            }
            });
        });
        function millisToMinutesAndSeconds(millis) {
        	  var minutes = Math.floor(millis / 60000);
        	  var seconds = ((millis % 60000) / 1000).toFixed(0);
        	  return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
        	}
    </script>

</body>
</html>