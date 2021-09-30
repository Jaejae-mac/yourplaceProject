<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Reserve</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
<script
	src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css" />
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet" />
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>

<script type="text/javascript">
	function uploadImgPreview() {

		// @breif 업로드 파일 읽기
		let fileInfo = document.getElementById("upImgFile").files[0];
		let reader = new FileReader();

		// @details readAsDataURL( )을 통해 파일을 읽어 들일때 onload가 실행
		reader.onload = function() {
			// @details 파일의 URL을 Base64 형태로 가져온다.
			document.getElementById("thumbnailImg").src = reader.result;
			document.getElementById("thumbnailUrl").innerText = reader.result;

		};
		if (fileInfo) {
			// @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
			reader.readAsDataURL(fileInfo);

		}

	}
	
</script>

<style>
.thum {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.thumbnailImg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}


</style>

</head>
<body class="sb-nav-fixed">
	<%@include file="hostnav.jsp"%>
	<div id="layoutSidenav_content">

		<main>
	<input type="file" id="upImgFile" onChange="uploadImgPreview();" accept="image/*" >

 <div class="thum">
    <img id="thumbnailImg" src="">
</div>
    <br/>
    <div id="thumbnailUrl"></div>
	</main>


	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; YourPlace</div>
				<div></div>
			</div>
		</div>
	</footer>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
	
</body>




</html>
<!-- 


  toggle : toggleReview
 -->
