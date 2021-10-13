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
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

	<script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
      
	<link rel="stylesheet" href="/resources/css/admin/css/bootstrap-datepicker.css">

	<!-- Sheet JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
	<!--FileSaver savaAs 이용 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.2.0/exceljs.min.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"></script> -->
	
	<style>
   		#btn_chart_excel_download {
        border: 0; background-color: #007f1b; color: white; font-weight: bold; padding: 5px; border-radius: 10px;
    	}
	</style>


    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="/resources/css/admin/js/bootstrap-datepicker.js"></script>
	<script src="/resources/css/admin/js/bootstrap-datepicker.ko.min.js"></script>
	
	
	<script>
	$(function() {	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-730d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : [],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. '2019-06-24','2019-06-26'
		    //daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    //daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "시작일 선택",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해 줘야한다.
		    
		});//datepicker end
	});//ready end
	
</script>

	<script>
	$(function() {	
		$('#datePicker2').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-730d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : [],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. '2019-06-24','2019-06-26'
		    //daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    //daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "종료일 선택",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해 줘야한다.
		    
		});//datepicker end
	});//ready end
	
</script>
	


  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">기간조회 차트</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Sales Check</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                차트를 조회하고 엑셀 파일로 다운로드 받을 수 있는 페이지입니다.
              </div>
            </div>

            <!-- 차트1 시작 -->
            
            <!-- 조회 modal -->
              
              <div class="card col-xxl-3">
              
              <div class="modal-body">
              <form action="/specificRevenue.mdo" method="POST">
              
              <label for="datePicker"><span class="ue"></span>시작일 조회</label>
                <input type="text" id="datePicker" name="start_date" style="flex-direction: column;" class="form-control">                
                	
               <label for="datePicker2"><span class="ue"></span>종료일 조회</label>
                <input type="text" id="datePicker2" name="end_date" style="flex-direction: column;" class="form-control">
                <br>
                
                <input type="text" id="year" name="thisyear" hidden="hidden">
                <input type="text" id="payStartMonth" name="StartMonth" hidden="hidden">
                <input type="text" id="payEndMonth" name="EndMonth" hidden="hidden">
                <input type="text" id="payStartDate" name="StartDate" hidden="hidden">
                <input type="text" id="payEndDate" name="EndDate" hidden="hidden">
                
                <div class="modal-footer" style="margin-bottom: 0;">
	                <input type="submit" id="checkSubmit" name="checkSubmit" value="조회" class="btn btn-primary">
	                &nbsp;
	                <input type="button" id="excelDownload" value="Excel" class="btn btn-primary"
	              	style="background-color: #007f1b; color: white; border-color: #007f1b">
				</div>
              </form>
              </div>
              </div>

			<div style="margin-top: 10px"></br></div>

              <!-- 조회 기능 -->
            
            <div class="card mb-4">

              <!-- 차트 감싸는 표의 header -->
              <div class="card-header">
                <i class="fas fa-chart-area me-1" ></i>
                	선택한 기간의 데이터 조회
              
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
            
              <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	조회한 데이터 전체내용 보기
              </div>
              
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr style="background: rgba(231,231,231,0.4)">
                        <th style="text-align:center">예약번호</th>
                        <th style="text-align:center">결제번호</th>
                        <th style="text-align:center">상위 카테고리</th>
                        <th style="text-align:center">하위 카테고리</th>
                        <th style="text-align:center">결제년도</th>
                        <th style="text-align:center">결제월</th>
                        <th style="text-align:center">결제일</th>
                        <th style="text-align:center">정가</th>
                        <th style="text-align:center">할인율</th>
                        <th style="text-align:center">결제금액</th>
                        <th style="text-align:center">부과세</th>
                        <th style="text-align:center">세후금액</th>
                        <th style="text-align:center">게스트번호</th>
                    </tr>
                  </thead>

                  <tbody>
                  
                  <c:forEach items="${requestList}" var="req">
                    <tr>
                      <td>${req.rsvNum}</td>
                      <td>${req.payNum}</td>
                      <td>${req.placeMaincate}</td>
                      <td>${req.placeCate}</td>
                      <td>${req.payYear}</td>
                      <td>${req.payMonth}</td>
                      <td>${req.payDate}</td>
                      <td>${req.invCost}</td>
                      <td>${req.coupDisRate}</td>
                      <td>${req.invBfTax}</td>
                      <td>${req.invTax}</td>
                      <td>${req.invAftTax}</td>
                      <td>${req.userNum}</td>
                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
              </div>
             
            </div>
          </div>
          </div>
          </main>
            <!-- 가로 끝 -->


    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous">
    </script>
    
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    
    <script src="/resources/css/admin/js/datatables-simple-demo.js"></script>
    <script src="/resources/css/admin/js/scripts.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

	<script>
		$(document).on("click", "#checkSubmit", function(){

			if($.trim($("#datePicker").val())==''){
			      alert("조회할 시작일을 입력해 주세요.");
			      return false;
			    }
	    	  
	    	  if($.trim($("#datePicker2").val())==''){
			      alert("조회할 종료일을 입력해 주세요.");
			      return false;
			    }
			
			var date = new Date($("#datePicker").datepicker({dateFormat:"yyyy-mm-dd"}).val());
			var date2 = new Date($("#datePicker2").datepicker({dateFormat:"yyyy-mm-dd"}).val());
			
			var year = date.getFullYear();
			var dateMonth = (date.getMonth()+1);
			var dateDate = date.getDate();
			
			var date2Month = (date2.getMonth()+1);
			var date2Date = date2.getDate();
			
			console.log("시작일: " + date);
			console.log("종료일: " + date2);
			
			$("#year").val(year);
			$("#payStartMonth").val(dateMonth);
			$("#payStartDate").val(dateDate);
			
			$("#payEndMonth").val(date2Month);
			$("#payEndDate").val(date2Date);

		});
	</script>


	<!-- Bar Chart -->
    <script type="text/javascript">

    		var labelName = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    		var firstData = new Array();
    		var monthLabel = new Array();
            var dateLabel = new Array();
    		
            //foreach 문으로 값 세팅
                <c:forEach items="${requestList}" var="req">
                	firstData.push('${req.invAftTax}');
                	monthLabel.push('${req.payMonth}');
                	dateLabel.push('${req.payDate}');
                </c:forEach>
            
            console.log(firstData);
            console.log(monthLabel);
            console.log(dateLabel);
            
 			var lab = new Array();
 			lab = monthLabel.concat(dateLabel);
 			
 			console.log(lab);
            
            var context = document
                .getElementById('myBarChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: dateLabel,
                    
                    datasets: [
                        { //데이터
                            label: "일매출",
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
                            //y축
                            data: firstData,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
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


	<script>
      $(document).on("click", "#excelDownload", function(){
    	  
    	  if($.trim($("#datePicker").val())==''){
		      alert("조회할 시작일을 입력해 주세요.");
		      return false;
		    }
    	  
    	  if($.trim($("#datePicker2").val())==''){
		      alert("조회할 종료일을 입력해 주세요.");
		      return false;
		    }
 
         var wb = XLSX.utils.table_to_book(document.getElementById('datatablesSimple'), {sheet:"매출조회",raw:true});
         XLSX.writeFile(wb, ('매출조회.xlsx'));
         
      });
    </script>


  </body>
</html>