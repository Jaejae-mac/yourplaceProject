<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div>
		<form id="form_interest" method="get" name="form_interest">
			<a href="/interest.do?${placeNum }"
				style="text-decoration: none; color: black;"> <input
				type="hidden" id="insertInterest" name="placeNum"/>인보이스 테스트
			</a>
		</form>
	</div>
</body>

<script>
	$(document).on('click', '#insertInterest', function() {
		console.log("북마크 등록 클릭 ");
		//문의내용 입력 공백확인 
		var insertInterest = "";
		var form = document.form_interest;
		placeNum = $("#insertInterest").val();
		console.log("placenum" + placeNum)
		//var flag = true;;
		console.log("문의 내용 " + placeNum);
		if (placeNum == null || placeNum === "") {
			alert("관심 장소를 입력해주세요.")
			return false;
		} else {
			alert("관심 장소가 등록되었습니다.")
			$("#form_interest").attr("action", "/interest.do");
			$("#form_interest").submit();
		}
	});
</script>
</html>