<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkpW</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
	<c:if test="${param.result == '0' }">
		<script>
			alert('비밀번호를 다시 확인해주세요.');
		</script>
	</c:if>
	<c:if test="${userId != null}">
		MY Page - ${userId }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<div class="h_column_center" id="main_vue"
		style="min-height: 300px; margin-bottom: 266px; margin-top: 100px">
		<div style="width: 1160px;">
			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					비밀번호 변경</p>
			</div>
		</div>

		<div
			style="margin-top: 50px; width: 580px; border-radius: 10px; border: solid 1px #dfe2e7; background-color: #ffffff;">

			<div style="margin: 40px 50px;">
				<form action="" id="checkpass_form" method="post">
					<input type="hidden" name="userId" value="${userId}">	
					<div
						style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
						현재 비밀번호</div>

					<div class="input_container" style="margin-top: 8px;">
						<input type="password" placeholder="비밀번호를 입력하세요" value="" id="checkpassword" name="userPw" required>
						<div class="delete" onclick="deletepass()">
							<img src="<c:url value="/resources/img/icon/register/round_delete_g.png" />"
								style="width: 16px; height: 16px;" />
						</div>
					</div>
					<div class="h_column_center">
						<div type="button" style="width: 96px; height: 52px; margin-top: 30px;" onclick="checkPw()" class="btn btn-primary btn-lg">확인</div>
					</div>
				</form>	
			</div>
		</div>
	</div>
		<!-- Footer -->
		<%@ include file="../footer.jsp" %>
		<!-- Footer 끝 -->
	<script>
		function deletepass(){
			document.getElementById('checkpassword').value = "";
        }
		function checkPw(){
			$("#checkpass_form").attr("action","/gochangPw.do").submit();           
        }
    </script>
</body>
</html>