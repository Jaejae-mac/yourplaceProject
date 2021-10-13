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
    <title>Yourplace_비밀번호 변경</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
   <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
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
                    <h1 class="mt-4">비밀 번호 변경 </h1>

                </div>
                <div class="card-body"style="margin-left: 200px;">
                	<div class="h_column_center" id="main_vue" style="min-height: 300px; margin-bottom: 266px;">
                	<div style="width: 1160px;">
            			<div style="margin-top: 20px;">
                			<p style="font-size: 32px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.31;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
                    			비밀번호 변경
                			</p>
            			</div>
        			</div>
  					<div style="margin-top: 50px;width: 580px;border-radius: 10px;border: solid 1px #dfe2e7;background-color: #ffffff;">
            			<div style="margin: 40px 50px;">
                			<form action="" id="updatepassword" method="POST" >
                				<input type="hidden" name="userType" id="userType" value="1">
                				<input type="hidden" name="userId" id="userId" value="${userId}">
                    		<div style="font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #9ea4aa;">
                        		새 비밀번호
                    		</div>

                    		<div class="input_container" style="margin-top: 8px;">
                        		<input type="password" maxlength="20" placeholder="영문/숫자 조합 8-20자로 입력하세요" value="" id="userPw" name="userPw" onchange="chkPW()" required>
                        		<div class="delete" onclick="deletepass()">
                            		<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />" style="width: 16px;height: 16px;" />
                        		</div>
                    		</div>
							<!-- 비밀번호 유효성 검사 결과 출력란-->
							<div>
								<span id="cPw"
									style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal;"></span>
							</div>
							
		                    <div style="margin-top: 30px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #9ea4aa;">
		                        	새 비밀번호 확인
		                    </div>

		                    <div class="input_container" style="margin-top: 8px;">
		                        <input type="password" maxlength="20" placeholder="영문/숫자 조합 8-20자로 입력하세요" value="" id="checkpass" name="checkpass" onchange="chkCPW()" required>
		                        <div class="delete" onclick="deletecpass()">
		                            <img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />" style="width: 16px;height: 16px;" />
		                        </div>
		                    </div>

		              		<!-- 비밀번호 확인란에 입력시 비밀번호와 비교하여 텍스트 출력란-->
							<div>
								<span id="ccPw"
									style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal;"></span>
							</div>

		                    <div class="h_column_center" style="">
		                        <div style="width: 96px; height: 52px; margin-top: 30px;">
		                            <div type="button" style="width: 96px; height: 52px; margin-top: 30px;" onclick="updatePw()" class="btn btn-primary btn-lg">확인</div>
		                        </div>
		                    </div>
                			</form>
            			</div>
        			</div>
				</div>
				</div>
    		</main>
		</div>
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
<<<<<<< HEAD
                <div class="text-muted">Copyright &copy; YourPlace</div>
=======
 
>>>>>>> c80984dff030de395546c1941133e0e677692cb9
                	
            </div>
        </div>
    </footer>
  
    <script>
    function updatePw(){
    	$("#updatepassword").attr("action","/updatePw.do").submit();
    }
    // 비밀번호 유효성 검사
    function chkPW(){
        var pw = $("#userPw").val();
        var id = $("#userId").val();
        var reg = /^(?=.*?[a-z])(?=.*?[0-9])$/;
        if (pw.length<8 || pw.length>20) {
        	document.getElementById('cPw').innerHTML='8자리 ~ 20자리 이내로 입력해주세요.'
            document.getElementById('cPw').style.color='red'
           return false;
         }
        if(reg.test(pw)){
        	document.getElementById('cPw').innerHTML='비밀번호는 8자 이상이어야 하며, 숫자/소문자를 모두 포함해야 합니다.'
            document.getElementById('cPw').style.color='red'
        }else if (pw.search(id) > -1) {
        	document.getElementById('cPw').innerHTML='비밀번호에 아이디가 포함되었습니다.'
        	document.getElementById('cPw').style.color='red'
          return false;
        }else if (/(\w)\1\1\1/.test(pw)) {
        	document.getElementById('cPw').innerHTML='같은 문자를 4번 이상 사용하실 수 없습니다.'
        	document.getElementById('cPw').style.color='red'
          return false;
        }else if (pw.search(/\s/) != -1) {
        	document.getElementById('cPw').innerHTML='비밀번호는 공백 없이 입력해주세요.'
        	document.getElementById('cPw').style.color='red'
          return false;
        }else {
        	document.getElementById('cPw').innerHTML='올바른 비밀번호 양식입니다.'
        	document.getElementById('cPw').style.color='blue'
          return true;
        }
    }
    // 비밀번호 확인검사
    function chkCPW(){
	    if(document.getElementById('userPw').value != '' && document.getElementById('checkpass').value != ''){
	        if(document.getElementById('userPw').value == document.getElementById('checkpass').value){
	            document.getElementById('ccPw').innerHTML='비밀번호가 일치합니다.'
	            document.getElementById('ccPw').style.color='blue'
	        }else{
	            document.getElementById('ccPw').innerHTML='비밀번호가 일치하지 않습니다.'
	            document.getElementById('ccPw').style.color='red'
	        }
	    }
    }
	function deletepass(){
		document.getElementById('userPw').value = "";
	}
	function deletecpass(){
		document.getElementById('checkpass').value = "";
	}
    </script>
</body>


</html>
