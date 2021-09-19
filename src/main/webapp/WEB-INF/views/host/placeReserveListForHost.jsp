<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Reviews</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
    <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css"
    />
    <link
      href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
      rel="stylesheet"
    />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>
    <script>
      $(document).on("click", ".trigger", function () {
        Swal.fire("리뷰보기 입니다.");
      });
      $(function () {
        $("#toggle-one").bootstrapToggle({
          on: "게스트리뷰",
          off: "호스트리뷰",
          offstyle: "success",
        });
      });
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
      

      
    </script>
  </head>
  <body class="sb-nav-fixed">
    <div class="page-wrapper">
      <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/indexOurPlace.hdo">Yourplace Host</a>
        <!-- Sidebar Toggle-->
        <button
          class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
          id="sidebarToggle"
          href="#!"
        >
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
          "
        >
          <div class="input-group"></div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              id="navbarDropdown"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              ><i class="fas fa-user fa-fw"></i
            ></a>
            <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdown"
            >
              <li><a class="dropdown-item" href="#!">로그아웃</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
          <nav
            class="sb-sidenav accordion sb-sidenav-dark"
            id="sidenavAccordion"
          >
            <!--사이드바 nav태그(사이드메뉴) 시작-->
            <div class="sb-sidenav-menu">
              <div class="nav">
                <div class="sb-sidenav-menu-heading">Menu</div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseHost"
                  aria-expanded="false"
                  aria-controls="collapseHost"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fa fa-user-circle"></i>
                  </div>
                  호스트 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseHost"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/updateProfileforHost.hdo"
                      >내 프로필 관리</a
                    >
                  </nav>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsePlace"
                  aria-expanded="false"
                  aria-controls="collapsePlace"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fa fa-cloud"></i>
                  </div>
                  장소 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapsePlace"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/managementHostPlace.hdo">내 장소 관리</a>
                    <a class="nav-link" href="/insertPlaceforHost.hdo">내 장소 등록</a>
                    <a class="nav-link" href="/hostReviews.hdo">리뷰 관리</a>
                  </nav>
                </div>

                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseMember"
                  aria-expanded="false"
                  aria-controls="collapseMember"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fa fa-calendar-check"></i>
                  </div>
                  예약 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseMember"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/placeReserveListForHost.hdo">예약 현황</a>
                  </nav>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsePayManagement"
                  aria-expanded="false"
                  aria-controls="collapsePayManagement"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-money-bill-alt"></i>
                  </div>
                  결제/매출 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapsePayManagement"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="layout-static.html">결제 정보</a>
                    <a class="nav-link" href="chartsAdmin.html">매출 현황</a>
                  </nav>
                </div>
              </div>
            </div>
            <div class="sb-sidenav-footer">
              <div class="small">Logged in as:</div>
             ${userId }
            </div>
          </nav>
          <!--사이드바 nav태그((사이드메뉴)) 끝-->
        </div>
        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">예약 목록</h1>
              <div class="card mb-4">
                <div class="card-body">
                최근 예약 목록을 볼 수있습니다.
                </div>
              </div>
              <table
              id="mainPageTable"
              class="table table-bordered display"
              width="100%"
            >
             <thead>
									<tr>
										<th>장소명</th>
										<th>예약번호</th>
										<th>예약자</th>
										<th>예약일</th>
									
										<th>입실</th>
										<th>퇴실</th>
										<th>인원</th>
										<th>금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="test" items="${list}">
										<tr>
											<td>${test.placeName}</td>
											<td>${test.reserveNum }</td>
											<td>${test.reserveName }</td>
											<td>${test.reserveYear }년-${test.reserveMonth }-월${test.reserveDate }일</td>
											
											
										
											<td>${test.startTime }</td>
											<td>${test.endTime }</td>
											<td>${test.personNum }</td>
											<td>${test.payPrice }</td>


										</tr>


									</c:forEach>



								</tbody>

            </table>
          </div>
        </div>
      </div>
    </main>
    <footer class="py-4 bg-light mt-auto">
      <div class="container-fluid px-4">
        <div
          class="d-flex align-items-center justify-content-between small"
        >
          <div class="text-muted">Copyright &copy; YourPlace</div>
          <div>
          
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
  crossorigin="anonymous"
></script>
	<script
		src="<c:url value="/resources/host/js/scripts.js" />"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
  crossorigin="anonymous"
></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script
  src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
  crossorigin="anonymous"
></script>
	<script
		src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
  </body>
</html>
<!-- 


  toggle : toggleReview
 -->
    