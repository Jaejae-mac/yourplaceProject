<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>.


<style>
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
</style>


    <link rel="stylesheet" href="<c:url value="/resources/css/admin/css/styles.css"/>"/>
</head>

<body style="overflow-x: hidden; overflow-y: hidden;">
	<div style="margin-top: 30px; padding: 0px 40px; margin-bottom: 40px;">
		<div id="riview">
			<div
				style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
				, class="riview">
				<p
					style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
					리뷰</p>




				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: var(- -grey-010);">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: var(- -grey-060); text-align: center;">
						사용자에게 받은 리뷰입니다.</p>
				</div>
				
						
						
	
					
					
					<div style="position: relative; left: 100px;">
							<c:forEach var="test" items="${list}">
						<p
							style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
							내용</p>
						<div
							style="margin-top: 8px; height: 192px; padding: 14px; position: relative; right: 60px; border-radius: 4px; border: solid 1px var(- -grey-025);">

							<textarea placeholder="리뷰를 남겨주세요" id="content" name="content"
								style="width: 300px; height: 160px; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"
								readonly="readonly">${test.review}</textarea>
						</div>
						</c:forEach>
						
						<div class="riview" style="margin-top: 30px; text-align: center;">

							<div style="position: relative; right: 110px; bottom: 40px;">
								<input type="button" class="btn btn-primary"
									style="font-size: 10px; margin-left: 10px;" value="확인"
									name="subb" id="subb" onclick="window.close()" />

							</div>

<c:forEach var="test" items="${list}">
<input type="hidden" value="${test.star}" name="star" id="star"/>
</c:forEach>



							<script>
					
							
							$(document).ready(function(){ 
			
								var star = $('#star').val();
								console.log(star);
								$("input:radio[name='rating']:radio[value=star]").prop("checked", true); // 강제선택하기	
								
							});

		
							
							</script>

						</div>

			</div>
		</div>
	</div>
	</div>
</body>









</html>