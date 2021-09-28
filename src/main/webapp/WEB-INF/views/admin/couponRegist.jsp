<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>쿠폰 등록</title>

    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="/resources/css/admin/css/style-coupon.css">
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    
<!--Boot Strap Date picker-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="/resources/css/admin/css/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="/resources/css/admin/js/bootstrap-datepicker.js"></script>
<script src="/resources/css/admin/js/bootstrap-datepicker.ko.min.js"></script>

<script>
	$(function() {	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+90d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : [],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. '2019-06-24','2019-06-26'
		    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
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
		    //title: "쿠폰 마감일 선택",	//캘린더 상단에 보여주는 타이틀
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
	    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+90d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    datesDisabled : [],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. '2019-06-24','2019-06-26'
	    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
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
	    //title: "쿠폰 마감일 선택",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해 줘야한다.
	    
	});//datepicker end
});//ready end
</script>

<script>
    $(document).on("click","#couponRegistDone",function()
	{
		alert("쿠폰이 정상적으로 등록되었습니다.");
	});
</script>

<!--Boot Strap Date picker end-->
  </head>
  <body class="sb-nav-fixed">
   
      <%@ include file="adminNavigation.jsp" %>
      
      <div id="layoutSidenav_content">
      <form action="/couponRegist.mdo" method="POST">
        <main>
          <div class="container-fluid px-4">
           
           
           
            <h1 class="mt-4">쿠폰 등록 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">쿠폰 등록</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                blank
                
              </div>
            </div>
            <div class="card-header">
              <b>쿠폰 등록</b>
            </div>
            
            <div>
              <table class="table table-bordered">
                <tbody>
                
                <tr>
                  <th scope="col">쿠폰명</th>
                  <td><input type="text" id="coupName" name="coupName" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">할인율</th>
                  <td><input type="text" id="coupDisRate" name="coupDisRate" size="5"> %</td>
                </tr>
                
                <tr>
                  <th>쿠폰 시작일</th>
                  <td><input type="text" id="datePicker" name="coupStartD" class="form-control">
                  </td>
              	</tr>
                
                <tr>
                  <th>쿠폰 만료일</th>
                  <td><input type="text" id="datePicker2" name="coupEndD" class="form-control">
                  </td>
              	</tr>
              
              </tbody>
              </table>
              
              
              <div class="promotion-coupon-regist">
                <td>
	                <button type="button" class="btn btn-danger" style="font-size: 10px;margin-left: 10px;"
	                onclick="location='couponView.mdo'">
	                	취소
	                </button>
                </td>
                
                
                <td>
	                <input type="submit" class="btn btn-primary" id="couponRegistDone" style="font-size: 10px;margin-left: 10px;">
	                	쿠폰 등록하기
	                </input>
                </td>
              
              </div>
              
              </form>
              
              <div class="clear"></div>
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
    <script src="resources/css/admin/js/scripts.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/datatables-simple-demo.js"></script>


  </body>
</html>

