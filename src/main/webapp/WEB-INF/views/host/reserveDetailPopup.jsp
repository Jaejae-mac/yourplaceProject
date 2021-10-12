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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href="<c:url value="/resources/css/admin/css/styles.css"/>"/>
</head>

<body>
<div style="margin-top: 30px; padding: 0px 40px; margin-bottom: 40px;">
	<div id="riview">
		<div style="position: relative; width: 500px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
			 class="riview">
			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
				예약 상세 보기</p>


				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: var(- -grey-010);">

				</div>

				<div style="position: relative; left: 100px;">




					<p
						style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
						예약자 전화번호</p>
					<c:forEach var="mana" items="${get}">
						<input type="text" style="width: 300px;" value="${mana.reserveTel}" readonly="readonly"/>
						</c:forEach>
						<p
							style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
							세부 방</p>
					<c:forEach var="mana" items="${get}">
						<input type="text" style="width: 300px;"
							value="${mana.placeDetailNum}" readonly="readonly"/>

					</c:forEach>






					<p
								style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
								사용 목적</p>
							<div
								style="margin-top: 8px; height: 192px; padding: 14px; position: relative; right: 10px; border-radius: 4px; border: solid 1px var(- -grey-025);">
				<c:forEach var="mana" items="${get}">
								<textarea id="purpose" name="purpose"
									style="width: 300px; height: 110px; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"
									readonly="readonly">${mana.reservePurpose}</textarea>
							</c:forEach>
							</div>

							<p
								style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
								요청사항</p>
							<div
								style="margin-top: 8px; height: 192px; padding: 14px; position: relative; right: 10px; border-radius: 4px; border: solid 1px var(- -grey-025);">
							<c:forEach var="mana" items="${get}">
								<textarea id="request" name="request"
									style="width: 300px; height: 110px; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"
									readonly="readonly">${mana.reserveRequest}</textarea>
									</c:forEach>
							</div>



							<div class="riview" style="margin-top: 30px; text-align: center;">

								<div style="position: relative; right: 110px; bottom: 40px;">
									<input type="button" class="btn btn-primary"
										style="font-size: 10px; margin-left: 10px;" value="확인"
										onclick="window.close();" />

								</div>

							</div>
							</form>

						</div>
					</div>
				</div>


			</div>
			
</body>
 

	
	




</html>