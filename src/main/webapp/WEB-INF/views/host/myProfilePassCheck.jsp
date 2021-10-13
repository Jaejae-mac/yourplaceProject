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
    <title>Yourplace_비밀번호 확인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<c:if test="${param.result == 0 }">
		<script>
			alert('비밀번호를 다시 확인해주세요.');
		</script>
</c:if>
<%@include file="hostnav.jsp" %>
        
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4"style="margin-left: 30px;">
                    <h1 class="mt-4">비밀 번호 확인 </h1>

                </div>
                <div class="card-body"style="margin-left: 100px;">
                    <div class="h_column_center" id="main_vue"
						style="min-height: 300px; margin-bottom: 266px; margin-top: 100px">
					<div style="width: 1160px;">
						<div style="margin-top: 20px;">
							<p style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
								비밀번호 변경</p>
						</div>
					</div>

				<div style="margin-top: 50px; width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff;">

					<div style="margin: 40px 50px;">
						<form action="" id="Hcheckpass_form" method="get">
						<input type="hidden" id="userId" name="userId" value="${userId}">	
						<div style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
							현재 비밀번호</div>

						<div class="input_container" style="margin-top: 8px;">
							<input type="password" placeholder="비밀번호를 입력하세요" value="" id="checkpassword" name="userPw" required>
							<div class="delete" onclick="deletepass()">
								<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
									style="width: 16px; height: 16px;" />
							</div>
						</div>
						<div class="h_column_center">
							<div type="button" style="width: 96px; height: 52px; margin-top: 30px;" onclick="HcheckPw()" class="btn btn-primary btn-lg">확인</div>
						</div>
						</form>	
					</div>
				</div>
			</div>   
			</div>
			<script>
				function deletepass(){
					document.getElementById('checkpassword').value = "";
		        }
				//비밀번호 변경 페이지로 이동
				function HcheckPw(){
					$("#Hcheckpass_form").attr("action","/gochangPw.hdo").submit();           
		        }
    		</script>
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
  
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
    
</body>


</html>
