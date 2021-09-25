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

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	

  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
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

    
    <!-- Chart.js -->
    <!--  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
    crossorigin="anonymous">
    </script>
    
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="assets/demo/chart-pie-demo.js"></script>  -->
	<!-- Chart.js 끝 -->

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