<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>yourplace host page</title>


<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js?ver=12"></script>

  <script>
      $(document).ready(function () {
        var lang_kor = {
          decimal: "",
          emptyTable: "데이터가 없습니다.",
          info: "_START_ - _END_ (총 _TOTAL_ 개)",
          infoEmpty: "0명",
          infoFiltered: "(전체 _MAX_ 명 중 검색결과)",
          infoPostFix: "",
          thousands: ",",
          lengthMenu: "_MENU_ 개씩 보기",
          loadingRecords: "로딩중...",
          processing: "처리중...",
          search: "검색 : ",
          zeroRecords: "검색된 데이터가 없습니다.",
          paginate: {
            first: "첫 페이지",
            last: "마지막 페이지",
            next: "다음",
            previous: "이전",
          },
          aria: {
              sortAscending: " :  오름차순 정렬",
              sortDescending: " :  내림차순 정렬",
            },
          };
          var col_kor = [
            { title: "장소명" },
            { title: "예약번호" },
            { title: "예약자" },
            { title: "예약년도" },
            { title: "예약 월" },
            { title: "예약 일" },
            { title: "입실" },
            { title: "퇴실" },
            { title: "인원" },
            { title: "금액" },
          ];

    </script>

</head>
<body class="sb-nav-fixed">
<%@include file="hostnav.jsp" %>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">YourPlace</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">YourPlace</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">예약 현황 바로가기</div>
								<div
									class="
                      card-footer
                      d-flex
                      align-items-center
                      justify-content-between
                    ">
									<a class="small text-white stretched-link" href="/placeReserveListForHost.hdo">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">이달의 매출 바로가기</div>
								<div
									class="
                      card-footer
                      d-flex
                      align-items-center
                      justify-content-between
                    ">
									<a class="small text-white stretched-link" href="/getInvoiceForHost.hdo">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">리뷰 바로가기</div>
								<div
									class="
                      card-footer
                      d-flex
                      align-items-center
                      justify-content-between
                    ">
									<a class="small text-white stretched-link" href="/hostReviews.hdo">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">환불신청</div>
								<div
									class="
                      card-footer
                      d-flex
                      align-items-center
                      justify-content-between
                    ">
									<a class="small text-white stretched-link" href="/refund.hdo">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					</div>
					
					
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>
