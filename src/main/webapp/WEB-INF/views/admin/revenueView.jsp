<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>매출차트</title>
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>



  </head>
  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="admin.html">Space Cloud Admin</a>
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
        <div class="input-group">
          <input
            class="form-control"
            type="text"
            placeholder="Search for..."
            aria-label="Search for..."
            aria-describedby="btnNavbarSearch"
          />
          <button class="btn btn-primary" id="btnNavbarSearch" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
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
            <li><a class="dropdown-item" href="#!">Settings</a></li>
            <li><a class="dropdown-item" href="#!">Activity Log</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="#!">Logout</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <!--사이드바 nav태그 시작-->
          <div class="sb-sidenav-menu">
            <div class="nav">
              <div class="sb-sidenav-menu-heading">Core</div>
              <a class="nav-link" href="index.html">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Dashboard
              </a>

              <div class="sb-sidenav-menu-heading">Menu</div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseMember"
                aria-expanded="false"
                aria-controls="collapseMember"
              >
                <div class="sb-nav-link-icon">
                  <i class="fa fa-user-circle"></i>
                </div>
                회원 관리
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
                  <a class="nav-link" href="layout-static.html">호스트 관리</a>
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >클라이언트 관리</a
                  >
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >신고 회원 관리</a
                  >
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >쿠폰 관리</a
                  >
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
                결제/예약/매출 관리
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
                  <a class="nav-link" href="layout-static.html">결제 관리</a>
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >예약 관리</a
                  >
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >매출 현황</a
                  >
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseAnnounce"
                aria-expanded="false"
                aria-controls="collapseAnnounce"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-bullhorn"></i>
                </div>
                공지사항 관리
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseAnnounce"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="layout-static.html">결제 관리</a>
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >예약 관리</a
                  >
                  <a class="nav-link" href="chartsAdmin.html">매출 현황</a>
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseFAQ"
                aria-expanded="false"
                aria-controls="collapseFAQ"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-question-circle"></i>
                </div>
                FAQ
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseFAQ"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="layout-static.html">결제 관리</a>
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >예약 관리</a
                  >
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >매출 현황</a
                  >
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapsePages"
                aria-expanded="false"
                aria-controls="collapsePages"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-book-open"></i>
                </div>
                Pages
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapsePages"
                aria-labelledby="headingTwo"
                data-bs-parent="#sidenavAccordion"
              >
                <nav
                  class="sb-sidenav-menu-nested nav accordion"
                  id="sidenavAccordionPages"
                >
                  <a
                    class="nav-link collapsed"
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#pagesCollapseAuth"
                    aria-expanded="false"
                    aria-controls="pagesCollapseAuth"
                  >
                    Authentication
                    <div class="sb-sidenav-collapse-arrow">
                      <i class="fas fa-angle-down"></i>
                    </div>
                  </a>
                  <div
                    class="collapse"
                    id="pagesCollapseAuth"
                    aria-labelledby="headingOne"
                    data-bs-parent="#sidenavAccordionPages"
                  >
                    <nav class="sb-sidenav-menu-nested nav">
                      <a class="nav-link" href="login.html">Login</a>
                      <a class="nav-link" href="register.html">Register</a>
                      <a class="nav-link" href="password.html"
                        >Forgot Password</a
                      >
                    </nav>
                  </div>
                  <a
                    class="nav-link collapsed"
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#pagesCollapseError"
                    aria-expanded="false"
                    aria-controls="pagesCollapseError"
                  >
                    Error
                    <div class="sb-sidenav-collapse-arrow">
                      <i class="fas fa-angle-down"></i>
                    </div>
                  </a>
                  <div
                    class="collapse"
                    id="pagesCollapseError"
                    aria-labelledby="headingOne"
                    data-bs-parent="#sidenavAccordionPages"
                  >
                    <nav class="sb-sidenav-menu-nested nav">
                      <a class="nav-link" href="401.html">401 Page</a>
                      <a class="nav-link" href="404.html">404 Page</a>
                      <a class="nav-link" href="500.html">500 Page</a>
                    </nav>
                  </div>
                </nav>
              </div>

              <div class="sb-sidenav-menu-heading">Management</div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseSiteManage"
                aria-expanded="false"
                aria-controls="collapseSiteManage"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-laptop-house"></i>
                </div>
                사이트 관리
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseSiteManage"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="layout-static.html"
                    >Static Navigation</a
                  >
                  <a class="nav-link" href="layout-sidenav-light.html"
                    >Light Sidenav</a
                  >
                </nav>
              </div>

              <div class="sb-sidenav-menu-heading">Addons</div>
              <a class="nav-link" href="charts.html">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-chart-area"></i>
                </div>
                Charts
              </a>
              <a class="nav-link" href="tables.html">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Tables
              </a>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Start Bootstrap
          </div>
        </nav>
        <!--사이드바 nav태그 끝-->
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Charts</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">Charts</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                Chart.js is a third party plugin that is used to generate the
                charts in this template. The charts below have been customized -
                for further customization options, please visit the official
                <a target="_blank" href="https://www.chartjs.org/docs/latest/"
                  >Chart.js documentation</a
                >
                .
              </div>
            </div>

            <!-- 차트1 시작 -->
            
            <div class="card mb-4">

              <!-- 차트 감싸는 표의 header -->
              <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                Area Chart Example
              </div>

              <!-- flow chart canvers -->
              <div class="card-body">
                <canvas id="myAreaChart" width="100%" height="30"></canvas>
              </div>

              <!-- 카드 밑에 footer -->
              <div class="card-footer small text-muted">
                Updated yesterday at 11:59 PM
              </div>

            </div>
            <!-- 차트1 끝 -->

            <!-- 가로로 1개 만들어서 -->
            <div class="row">
              <!-- 2개로 쪼갬 -->
              <div class="col-lg-6">

                <!-- 차트2 시작 -->
                <div class="card mb-4">

                  <!-- 차트2 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Bar Chart Example
                  </div>

                  <!-- 차트2 바디, 바차트-->
                  <div class="card-body">
                    <canvas id="myBarChart" width="100%" height="50"></canvas>
                  </div>

                  <!-- 차트2 푸터 -->
                  <div class="card-footer small text-muted">
                    Updated yesterday at 11:59 PM
                  </div>
                </div>
                <!-- 차트2 끝 -->

              </div>
              <!-- 쪼갠거 끝 -->

              <!-- 나머지 쪼갬2 -->
              <div class="col-lg-6">

                <!-- 차트3 시작 -->
                <div class="card mb-4">

                  <!-- 차트3 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-pie me-1"></i>
                    Pie Chart Example
                  </div>

                  <!-- 차트3 바디 -->
                  <div class="card-body">
                    <canvas id="myPieChart" width="100%" height="50"></canvas>
                  </div>

                  <!-- 차트3 푸터 -->
                  <div class="card-footer small text-muted">
                    Updated yesterday at 11:59 PM
                  </div>
                </div>
                <!-- 차트3 끝 -->

              </div>
              <!-- 쪼갬2 끝 -->
            </div>
            <!-- 가로 끝 -->

          </div>
        </main>

        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">Copyright &copy; Your Website 2021</div>
              <div>
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
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
    <script src="/resources/css/admin/js/scripts.js"></script>
    
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
    crossorigin="anonymous">
    </script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="assets/demo/chart-pie-demo.js"></script>

    <script>
      var chartLabels = [];
      var chartData = [];
      

      $.getJSON("http://localhost:8080/revenueView.mdo", function(data)
      {
        $.each(data, function(inx, obj)
        {
          chartLabels.push(obj.pay_num);
          chartData.push(obj.inv_aft_tax);
        });

        createChart();
        consoler.log("create Chart")

      });

      var lineChartData = {

        labels : chartLabels,
        datasets : [
          {
            label : "pay_num",
            fillColor : "rbga(151,187,205,0.2)",
            strokeColor : "rbga(151,187,205,1)",
            pointColor : "rbga(151,187,205,1)",
            pointStrokeColor : "#fff",
            pointHighlightFill : "#fff",
            pointHighlightStroke : "rbga(151,187,205,1)",
            
            data : chartData
          
          }
        ]
      }

      function createChart()
      {
        var ctx = document.getElementById("myAreaChart").getContext("2d");
        LineChartDemo = Chart.LIne(ctx, {

        data : lineChartData,
        option : {
          scales : {
            yAxes : [{
              ticks : {
                beginAtZero: true
              }
            }]
          }
        }

        })
      }

    </script>
  </body>
</html>