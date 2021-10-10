<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>YourPlace Admin Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    
  </head>
  
  
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">YourPlace Admin Page</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Admin Page from Team Connect</li>
            </ol>
            
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	승인대기 중인 장소
              </div>
              <div class="card-body">
                <table id="datatablesSimple">
                
                  <thead>
                    <tr>
                      <th>장소번호</th>
                      <th>호스트 아이디</th>
                      <th>장소지역</th>
                      <th>메인 카테고리</th>
                      <th>장소 등록일자</th>
                    </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="a" items="${AllowList}">
                    <tr>
                      <td>${a.placeNum }</td>
                      <td>${a.userId }</td>
                      <td>${a.placeArea }</td>
                      <td>${a.placeMaincate }</td>
                      <td>
	                      <fmt:formatDate value="${a.placeRegDate }" pattern="yyyy-MM-dd" />
	                      
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                  
                </table>
              </div>
            </div>
            
            
            <!-- 화면에서 두번째 칸에 들어갈 차트 2개 -->
            <div class="row">
              <div class="col-xl-6">
                <div class="card mb-4">
                
                  <div class="card-header">
                    <i class="fas fa-chart-area me-1"></i>
                    	인기 카테고리
                  </div>
                  
                  <div class="card-body">
                    <canvas id="myPieChart" width="100%" height="40"></canvas>
                  </div>
                  
                  <div class="card-footer small text-muted">
	                Updated yesterday at 11:59 PM
	              </div>
	              
                </div>
              </div>
              <div class="col-xl-6">
                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    	성별별 인기 장소
                  </div>
                  <div class="card-body">
                    <canvas id="myBarChart2" width="100%" height="40"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 첫화면 가장 큰 table/chart 자리 -->
            <div class="row">
            	<div class="card mb-4">
	            	<div class="card-header">
	                <i class="fas fa-chart-area me-1"></i>
	                	월 매출 조회
	              	</div>
	              	
	              	<div class="card-body" id="flow-chart" >
	                	<canvas id="myBarChart" width="800px" height="300"></canvas>
	              	</div>
            	</div>
            </div>
            
            <!-- 첫화면 가장 큰 table/chart 자리 -->
            <div class="row">
            	<div class="card mb-4">
	            	<div class="card-header">
	                <i class="fas fa-chart-area me-1"></i>
	                	월대비 매출 조회
	              	</div>
	              	
	              	<div class="card-body" id="flow-chart" >
	                	<canvas id="myLineChart" width="800px" height="300"></canvas>
	              	</div>
            	</div>
            </div>
            
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
      crossorigin="anonymous"
    ></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="/resources/css/admin/js/datatables-simple-demo.js"></script>
    
    <!-- chart -->
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
        
        <!-- chart -->
        <script type="text/javascript">

	        var Year = [2020, 2021];
	        var labelName = new Array();
	        var firstData = new Array();
	        
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
	            <c:forEach items="${FirstList}" var="first">
	            	firstData.push('${first.revenue}');
	            	labelName.push('${first.payMonth}')
	            </c:forEach> 	
	        
	        console.log(firstData);
            
                
            var context = document
                .getElementById('myBarChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labelName,
                    
                    datasets: [
                        
                        {
                            label: "월별 데이터",
                            fill: false,
                            data: firstData,
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
