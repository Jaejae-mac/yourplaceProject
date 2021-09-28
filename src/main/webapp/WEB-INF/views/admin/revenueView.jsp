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
              <div class="card-body" id="flow-chart" >
                <canvas id="myAreaChart" width="800px" height="700px"></canvas>
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
                    Bar Chart Example
                  </div>

                  <!-- 차트2 바디, 바차트-->
                  <div class="card-body" id="chart_div">
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
                <!-- 오른쪽 -->
                <div class="card mb-4">

                  <!-- 차트3 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-pie me-1"></i>
                    Pie Chart Example
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

    
    <script>
//     	google.load('visualization', '1', {'package' : ['corehart']});
//     	google.setOnLoadCallback(drawChart);
    	
    	google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawChart);

    	
    	function drawChart()
    	{
    		var jsonData = $.ajax({
    		
    			type : "POST",
    			url : "/revenueView.mdo",
    			dataType : "json",
    			async : false,
    			success : function()
    			{
    				console.log("success!");
    				alert("success!");
    			},
    			
    			error : function()
    			{
    				console.log("error");
    				alert("error");
    			}
    			
    		})//.responseText;
    		
    		console.log(jsonData); //ajax 로 받은 데이터 찍어보기
    		
    		
    		var data = new google.visualization.DataTable(jsonData);
    	
    		
    		data.addColumn('string', 'Month');
            data.addColumn('number', '2020');
            data.addColumn('number', '2021');
            
            var arr = new Array();

            for(var i=0; i < jsonData.length; i++)
            {
	            arr[i] = [jsonData[i].invAftTax, jsonData[i].pay_month];
            }

            data.addRows(arr);
            
            //data.addRows(['jan', 101010], ['feb', 102930]);
    		
            
    		var options = {
    	               hAxis: {
    	                  title: 'Month',
    	                  textStyle: {
    	                     color: '#01579b',
    	                     fontSize: 20,
    	                     fontName: 'Arial',
    	                     bold: true,
    	                     italic: false
    	                  },
    	                  titleTextStyle: {
    	                     color: '#01579b',
    	                     fontSize: 20,
    	                     fontName: 'Arial',
    	                     bold: true,
    	                     italic: false
    	                  }
    	               },
    	               vAxis: {
    	                  title: 'Revenue',
    	                  textStyle: {
    	                     color: '#1a237e',
    	                     fontSize: 20,
    	                     bold: true,
    	                     italic: false
    	                  },
    	                  titleTextStyle: {
    	                     color: '#1a237e',
    	                     fontSize: 20,
    	                     bold: true,
    	                     italic: false
    	                  }
    	               },
    	               colors: ['#a52714', '#097138']
    	            };

    		
    		var option = {
    			      title: 'Monthly Revenue',
    			      curveType: 'function',
    			      legend: { position: 'bottom' }
    			    };
    		
    		
    		 var chart = new google.visualization.BarChart(document.getElementById('flow-chart'));
             chart.draw(data, option);
    		
    		
    	}
    </script>
    
    
    <!--  <script>
   
      //차트 부를 준비
      google.charts.load('current', {packages: ['corechart', 'line']});
      google.charts.setOnLoadCallback(drawAxisTickColors);

      //callback할 차트의 데이터, 옵션 세팅
      function drawAxisTickColors()
      {
         //데이터
         var data = new google.visualization.DataTable();
         data.addColumn('number', 'X');
         data.addColumn('number', 'A');
         data.addColumn('number', 'B');
         
         data.addRows(jObj);
         
//          data.addRows([
//             [0, 0, 0],    [1, 10, 5],   [2, 23, 15],  [3, 17, 9],   [4, 18, 10],  [5, 9, 5],
//             [6, 11, 3],   [7, 27, 19],  [8, 33, 25],  [9, 40, 32],  [10, 32, 24], [11, 35, 27],
//             [12, 30, 22]
//          ]);
         
         //JSON data
         
         
         
         //옵션들
         var options = {
               hAxis: {
                  title: 'Month',
                  textStyle: {
                     color: '#01579b',
                     fontSize: 20,
                     fontName: 'Arial',
                     bold: true,
                     italic: false
                  },
                  titleTextStyle: {
                     color: '#01579b',
                     fontSize: 20,
                     fontName: 'Arial',
                     bold: true,
                     italic: false
                  }
               },
               vAxis: {
                  title: 'Revenue',
                  textStyle: {
                     color: '#1a237e',
                     fontSize: 20,
                     bold: true,
                     italic: false
                  },
                  titleTextStyle: {
                     color: '#1a237e',
                     fontSize: 20,
                     bold: true,
                     italic: false
                  }
               },
               colors: ['#a52714', '#097138']
            };
            
            //차트 객체 세팅
            var chart = new google.visualization.LineChart(document.getElementById('flow-chart'));
            chart.draw(data, options);
         
      }
   </script>  -->
    
  

  </body>
</html>