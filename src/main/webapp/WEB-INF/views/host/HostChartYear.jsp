<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	//구글 차트 라이브러리 로딩
	//google객체는 위쪽 google src안에 들어있음
	google.load('visualization', '1', {
		'packages' : [ 'corechart' ]
	});
	//로딩이 완료되면 drawChart 함수를 호출
	google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
	function drawChart() {
		var jsonData = $.ajax({ //비동기적 방식으로 호출한다는 의미이다.
			url : "${path}/resources/host/chartjson/chart.json",
			dataType : "json",
			async : false
		}).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
		console.log(jsonData);
		//데이터테이블 생성
		var data = new google.visualization.DataTable(jsonData);
		 data.addColumn('number', '1월');
		 data.addColumn('number', '2월');
		 data.addColumn('number', '3월');
		 data.addColumn('number', '4월');
		 data.addColumn('number', '5월');
		 data.addColumn('number', '6월');
		 data.addColumn('number', '7월');
		 data.addColumn('number', '8월');
		 data.addColumn('number', '9월');
		 data.addColumn('number', '10월');
		 data.addColumn('number', '11월');
		 data.addColumn('number', '12월');
		 


		//제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
		//차트를 출력할 div
		//LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.

		//var chart = new google.visualization.PieChart(
		//document.getElementByld('chart_div')); //원형 그래프

		var chart = new google.visualization.LineChart(document.getElementById('chart_div')); //선 그래프 

		//var chart
		//  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		//차트 객체.draw(데이터 테이블, 옵션) //막대그래프

		//cuveType : "function" => 곡선처리

		//데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
		chart.draw(data, {
			title : "월 별 통계",
			curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
			width : 1000,
			height : 800
		});
	}
</script>

</head>
<body>
	<div id="chart_div"></div>
	<!-- 차트가 그려지는 영역 -->
	<!-- 차트 새로고침 버튼 -->
	<button id="btn" type="button" onclick="drawChart()">refresh</button>
</body>
</html>