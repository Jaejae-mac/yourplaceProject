<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="review.css">

</head>

<body>
	<div id="riview">
		<div
			style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
			, class="riview">
			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
				문의 작성</p>
		
			<form action="/insertReview.hdo" method="post"
				style="margin-top: 30px; padding: 0px 40px; margin-bottom: 40px;">
				<input type="hidden" name="type" value="direct">
				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: var(- -grey-010);">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: var(- -grey-060); text-align: center;">
						리뷰를 남겨주세요. <br> 남기신 리뷰는 장소를 사용한 이용자가 볼 수있습니다.
					</p>
				</div>

				<p
					style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
					내용</p>
				<div
					style="margin-top: 8px; height: 192px; padding: 14px; border-radius: 4px; border: solid 1px var(- -grey-025);">
					<textarea placeholder="리뷰를 남겨주세요" id="content" name="content"
						style="width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"></textarea>
				</div>
				<div class="riview" style="margin-top: 30px; text-align: center;">
					<p>
						<button type="submit" class="btn btn-primary"
							style="font-size: 10px; margin-left: 10px;">등록</button>
					</p>

				</div>
			</form>
		</div>
	</div>



</body>

</html>