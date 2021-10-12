<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YourPlace 매출 차트</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

<style>
th,td{
	text-align:center;
}
</style>


</head>

<body class="sb-nav-fixed">
<%@include file="hostnav.jsp" %>

		<div id="layoutSidenav_content">

		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">매출 차트</h1>
				<div class="card mb-4">
					<div class="card-body">최근 몇개월 간의 매출을 조회할 수 있습니다.</div>

				</div>

				<div style="width: 900px; position: relative; left: 200px;">
					<canvas id="myChart"></canvas>
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
	<script>

var datas=[${map}];

var ctx = document.getElementById("myChart").getContext('2d');

var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일" , "15일", "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일","26일","27일", "28일", "29일", "30일", "31일"],
        datasets: [{
            label: '#한달 간 매출 현황',
            data: datas,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'
             
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
</body>
</html>