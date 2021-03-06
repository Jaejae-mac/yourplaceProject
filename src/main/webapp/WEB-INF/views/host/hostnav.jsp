<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${userVO == null}">
	<script>
		location.href="/home.do";
	</script>
</c:if>
<style>
th,td{
	text-align:center;
}
</style>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/indexYourPlace.hdo">Yourplace
			Host</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="
          d-none d-md-inline-block
          form-inline
          ms-auto
          me-0 me-md-3
          my-2 my-md-0
        ">
			<div class="input-group"></div>
		</form>
		<a href="/home.do">Home</a>
		<!-- Navbar-->
	
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				
					
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					
					<li><a class="dropdown-item" href="/logout.do">로그아웃</a></li>
					<li><a class="dropdown-item" href="/myProfile.hdo">계정 관리</a></li><!-- 프로필 보기로 -->
				
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<!--사이드바 nav태그(사이드메뉴) 시작-->
				
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Menu</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseHost" aria-expanded="false"
							aria-controls="collapseHost">
							<div class="sb-nav-link-icon">
								<i class="fa fa-user-circle"></i>
							</div> 호스트 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
							<div class="collapse" id="collapseHost"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/AskforHost.hdo">고객문의</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePlace" aria-expanded="false"
							aria-controls="collapsePlace">
							<div class="sb-nav-link-icon">
								<i class="fa fa-cloud"></i>
							</div> 장소 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePlace"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/managementHostPlace.hdo">내 장소 관리</a>
								<a class="nav-link" href="/regist/place/form.hdo">내 장소 등록</a>
								<a class="nav-link" href="/hostReviews.hdo">리뷰 관리</a>
								
							</nav>
						</div>
						
					
						
						
					
							
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseReservation" aria-expanded="false"
							aria-controls="collapseReservation">
							<div class="sb-nav-link-icon">
								<i class="fa fa-calendar-check"></i>
							</div> 예약 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseReservation"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/placeReserveListForHost.hdo">예약현황</a>

						<a class="nav-link" href="/LastPlaceReserveListForHost.hdo">지난 예약 현황</a>
							</nav>
							
							</div>


				
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseRefund" aria-expanded="false"
							aria-controls="collapseRefund">
							<div class="sb-nav-link-icon">
									<i class="fas fa-money-bill-alt"></i>
							</div> 환불
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseRefund"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/refund.hdo">환불 신청</a> <a
									class="nav-link" href="/refundRequest.hdo">환불 진행중</a>
							
							</nav>
						</div>




						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapsePayManagement" aria-expanded="false"
								aria-controls="collapsePayManagement">
								<div class="sb-nav-link-icon">
									<i class="fas fa-money-bill-alt"></i>
								</div> 결제/매출 관리
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapsePayManagement"
								aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="/hostSales.hdo">결제 정보</a> 
										<a class="nav-link" href="/getYearChartForHost.hdo">연간 차트</a>
										<a class="nav-link" href="/getInvoiceForHost.hdo">매출 차트</a>
								</nav>
							</div>
						</div>
						
						
						
						
					</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					${userVO.userId }
				</div>
				<input type="hidden" value="${userVO.userId }" name="userId" value="userId" />
			</nav>
			<!--사이드바 nav태그((사이드메뉴)) 끝-->
		</div>
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="/resources/host/assets/demo/chart-area-demo.js" />"></script>
	<script
		src="<c:url value="/resources/host/assets/demo/chart-bar-demo.js" />"></script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
</html>