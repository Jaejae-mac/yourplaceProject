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

	<script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	

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
                	월간 매출 조회
              </div>

              <!-- flow chart canvers -->
              <div class="card-body" id="flow-chart" >
                <canvas id="myBarChart" width="800px" height="300"></canvas>
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
                <!-- 왼쪽 -->
                <div class="card mb-4">

                  <!-- 차트2 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    	월대비 성장률 조회 MoM
                  </div>

                  <!-- 차트2 바디, 바차트-->
                  <div class="card-body" id="chart_div">
                    <canvas id="myLineChart" width="100%" height="50"></canvas>
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
                <!-- 오른쪽 -->
                <div class="card mb-4">

                  <!-- 차트3 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-pie me-1"></i>
                    	인기 카테고리
                  </div>

                  <!-- 차트3 바디 -->
                  <div class="card-body" id="piechart">
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

       
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/resources/css/admin/js/scripts.js"></script>


	<!-- Bar Chart -->
    <script type="text/javascript">

    		var Year = [2020, 2021];
            var labelName = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            var firstData = new Array();
			var secondData = new Array();
            
            //foreach 문으로 값 세팅
                <c:forEach items="${FirstList}" var="first">
                	firstData.push('${first.revenue}');
                </c:forEach>

                <c:forEach items="${SecondList}" var="second">
               		secondData.push('${second.revenue}');
            	</c:forEach>  	
            
            console.log(firstData);
            console.log(secondData);
            
                
            var context = document
                .getElementById('myBarChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labelName,
                    
                    datasets: [
                        { //데이터
                            label: 2020,
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
                            //y축
                            data: firstData,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        } ,
                        {
                            label: 2021,
                            fill: false,
                            data: secondData,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>

    	
    	<!-- Line Chart -->
  		<script type="text/javascript">

    		var Year = [2020, 2021];
            var labelName = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            var momData = new Array();
            
            //foreach 문으로 값 세팅
                <c:forEach items="${MoMList}" var="mom">
                	momData.push('${mom}');
                </c:forEach>
            
            console.log(momData);
            
                
            var context = document
                .getElementById('myLineChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labelName,
                    
                    datasets: [
                        
                        {
                            label: 2021,
                            fill: false,
                            data: momData,
                            backgroundColor: 'rgba(255, 206, 86, 0.2)',
                            borderColor: 'rgba(255, 206, 86, 1)',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
        
        
        <!-- Pie Chart -->
        <script type="text/javascript">

    		//var Year = [2020, 2021];
            var labelName = new Array();
            var Data = new Array();
            
            var backgroundcolor =
            	['rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(120, 110, 220, 0.2)',
                'rgba(110, 90, 90, 0.2)'];
            
            var borderColor =
            	['rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(120, 110, 220, 1)',
                'rgba(110, 90, 90, 1)'];
            
            //foreach 문으로 값 세팅
                <c:forEach items="${MainCateRank}" var="mainrank">
                	labelName.push("${mainrank.placeMaincate}");
                	Data.push('${mainrank.cnt}');
                </c:forEach>
            
            console.log(labelName);
            console.log(Data);
            
                
            var context = document
                .getElementById('myPieChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'doughnut', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labelName,
                    
                    datasets: [
                        
                        {
                            fill: false,
                            data: Data,
                            backgroundColor: backgroundcolor,
                            borderColor: borderColor,
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>

  </body>
</html>