<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Yourplace_예약 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
<script
	src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css" />
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet" />
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>



</head>
<body class="sb-nav-fixed">
	<%@include file="hostnav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">예약 목록</h1>
				<div class="card mb-4">
					<div class="card-body">최근 예약 목록을 볼 수있습니다.
					</div>
				</div>

				<table id="mainPageTable" class="table table-bordered display"
					width="100%">
					<colgroup>
						<col width="120px">
						<col width="20px">
						<col width="50px" style="background: rgb(231, 231, 231, 0.3)">
						<col width="80px">
						<col width="40px" style="background: rgb(231, 231, 231, 0.3)">
						<col width="40px" style="background: rgb(231, 231, 231, 0.3)">
						<col width="40px">
						<col width="40px">
							<col width="40px">
					
					</colgroup>
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
							<th></th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="test" items="${list}">
							<tr>
								<td>${test.placeName}</td>
								<td>${test.reserveNum }</td>
								<td>${test.reserveName }</td>
								<td>${test.reserveYear }년 ${test.reserveMonth }월 ${test.reserveDate }일</td>
								<td>${test.startTime }시</td>
								<td>${test.endTime }시</td>
								<td>${test.personNum}명</td>
								<td>${test.payPrice}₩</td>
								<td><button type="button" class="btn btn-primary" onclick=" a();"
					name="detail" id="detail"
					style="font-size: 10px; margin-left: 10px;">상세보기</button></td>
							
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
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; YourPlace</div>
				<div></div>
			</div>
		</div>
	</footer>
	</div>
	</div>
</body>
<script>
$(document).on("click","#detail",function()
		{

	var c = $(this);

	var tr = c.parent().parent();
	var td = tr.children();

	var active = td.eq(0).text();
	var no = td.eq(1).text();
	
	var arr1 = new Array();
	arr1.push(no);
	
	console.log(arr1);
	
	window.name = "reserveDetail";

	var url = "/reserveDetail.hdo";

	var width = '580';
	var height = '700';

	var left = Math.ceil((window.screen.width - width) / 2);
	var top = Math.ceil((window.screen.height - height) / 2);
	window.open('/reserveDetail.hdo', 'pop', 'width=' + width
			+ ', height=' + height + ', left=' + left
			+ ', top=' + top);
	
	
	$.ajax(

			{
					url : '/reserveNum.hdo',
					dataType : 'text',
					async    : false,
					type : 'POST',
					 async: false,
					 data: {
						 reserveNum: arr1,	      	
				      },
				      
				      success: function(data){
				  
				          	 	  	 	 
				             
				      }
				})
});



</script>



</html>
<!-- 


  toggle : toggleReview
 -->
