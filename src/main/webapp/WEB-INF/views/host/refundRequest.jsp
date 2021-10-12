<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Yourplace_환불 내역</title>
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

<script>



</script>



</head>
<body class="sb-nav-fixed">
<%@include file="hostnav.jsp"%>
	<div id="layoutSidenav_content">

		<main>

			<div class="container-fluid px-4">
				<h1 class="mt-4">환불 내역</h1>
				<div class="card mb-4">
					<div class="card-body">신청하신 환불내역을 확인하실 수있습니다.</div>


				</div>
				<table id="mainPageTable" name="table"
					class="table table-bordered display" width="100%">
					<thead>
						<tr>
							<th>장소명</th>
							<th>장소번호</th>
							<th>예약번호</th>


							<th>예약 날짜</th>
							<th>입실</th>
							<th>퇴실</th>
							<th>인원</th>
							<th>금액</th>

						</tr>

					</thead>
					<tbody>



						<c:forEach items="${list}" var="e">
							<tr>

								<td>${e.placeName}</td>
								<td>${e.placeNum}</td>
								<td>${e.reserveNum }</td>

								<td>${e.reserveYear}년-${e.reserveMonth} 월- ${e.reserveDate }일</td>
								<td>${e.startTime }</td>
								<td>${e.endTime}</td>
								<td>${e.personNum}</td>
								<td>${e.payPrice }</td>

							</tr>
						</c:forEach>



					</tbody>

				</table>

			</div></div>
	</div>
	</div>
	
	
	
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




	</body>

</html>
<!-- 


  toggle : toggleReview
 -->
