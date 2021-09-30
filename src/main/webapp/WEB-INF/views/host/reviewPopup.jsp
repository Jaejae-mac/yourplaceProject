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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>



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
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>


    <link rel="stylesheet" href="<c:url value="/resources/css/admin/css/styles.css"/>"/>
</head>

<body style="overflow-x:hidden; overflow-y:hidden;">
<div style="margin-top: 30px; padding: 0px 40px; margin-bottom: 40px;">
	<div id="riview">
		<div style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
			, class="riview">
			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
				리뷰 작성</p>

		
		


				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: var(- -grey-010);">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: var(- -grey-060); text-align: center;">
						사용자에게 리뷰를 남겨주세요. <br> 남기신 리뷰는 장소를 사용한 이용자가 볼 수있습니다.
					</p>
				</div>
				<div class="star-rating" style="position:relative; left:100px;">
					<input type="radio" id="5-stars" name="rating" value="5" /> <label
						for="5-stars" class="star">&#9733;</label> <input type="radio"
						id="4-stars" name="rating" value="4" /> <label for="4-stars"
						class="star">&#9733;</label> <input type="radio" id="3-stars"
						name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="rating" value="2" /> <label
						for="2-stars" class="star">&#9733;</label> <input type="radio"
						id="1-star" name="rating" value="1" checked="checked" /> <label for="1-star"
						class="star">&#9733;</label>
				</div>
				<div style="position:relative; left:100px;">

				<p
					style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
					내용</p>
				<div
					style="margin-top: 8px; height: 192px; padding: 14px; position:relative; right:60px; border-radius: 4px; border: solid 1px var(- -grey-025);">
					
					<textarea placeholder="리뷰를 남겨주세요" id="content" name="content"
						style="width: 300px; height: 160px; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"></textarea>
				</div>
				<div class="riview" style="margin-top: 30px; text-align: center;">
					
					<div style="position:relative; right:110px; bottom:40px;">
						<button type="submit" class="btn btn-primary" onclick="test()"
							style="font-size: 10px; margin-left: 10px;">등록</button>
					</div>

				</div>
			</form>
			</div>
		</div>
	</div>
	<form id="sub" name="sub" method="POST" action="/reviewValue.hdo" hidden="hidden" >
				<input type="hidden" name="star" id="star" value="" > 
				<input type="hidden" name="contents" id="contents" value="">

					</form>
</div>
</body>
<script>

function test() {
    var obj_value = $("input:radio[name='rating']:checked").val();
	var contentV = $('#content').val();
   console.log(obj_value);
   console.log(contentV);
   
    $("#star").val(obj_value);
  	$("#contents").val(contentV);
    $("#sub").submit();
}

</script>
</html>