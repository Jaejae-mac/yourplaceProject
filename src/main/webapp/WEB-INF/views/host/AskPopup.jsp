<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="review.css">


<script>
function popupClose(form){
	form.target = opener.name;
	
	form.submit();
	
	if(opner !=null){
		opener.insert = null;
		self.close();
	}
}


</script>


</head>

<body style="overflow-x:hidden; overflow-y:hidden;">
	<div id="riview">
		<div
			style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
			, class="riview">
			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
				문의 작성</p>
		
			<form action="/askHost.hdo" method="post" target="AskforHost.hdo"
				style="margin-top: 30px; padding: 0px 40px; margin-bottom: 40px;">
				
				<input type="hidden" name="type" value="direct">
				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50; text-align: center;">
						문의 사항을 남겨주세요 <br> 문의 내역은 고객 문의에서 확인하실 수있습니다.
					</p>
				</div>
			
				<select name="getPlaceNum" id="getPlaceNum">
					<option value="">문의하실 장소를 선택해주세요.</option>
					<c:forEach var="list" items="${get}">
						<option value="${list.placeNum}">[${list.placeNum}]  ${list.placeName }</option>
					</c:forEach>
				</select>





				<p
					style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
					내용</p>
				<div
					style="margin-top: 8px; height: 192px; padding: 14px; border-radius: 4px; border: solid 1px #dfe2e7;">
					<textarea placeholder="문의사항을 남겨주세요" id="content" name="content"
						style="width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"></textarea>
				</div>
				<div class="riview" style="margin-top: 30px; text-align: center;">
					<p>
						<button type="submit" class="btn btn-primary" onClick="window.close()"
							style="font-size: 10px; margin-left: 10px;">문의하기</button>
					</p>

				</div>
			</form>
		</div>
	</div>



</body>

</html>