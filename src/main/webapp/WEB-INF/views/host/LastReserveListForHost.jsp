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
<title>Reserve</title>
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

<script>
    function checkAll(){
        if( $("#allCheck").is(':checked') ){
          $("input[name=allReview]").prop("checked", true);
        }else{
          $("input[name=allReview]").prop("checked", false);
        }
  }
    
    
    </script>





</head>
<body class="sb-nav-fixed">
	<%@include file="hostnav.jsp"%>
	<div id="layoutSidenav_content">

		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">예약 목록</h1>
				<div class="card mb-4">
					<div class="card-body">지난 예약 목록을 볼 수있습니다.</div>

				</div>

				<button type="button" class="btn btn-primary" onclick=" check();"
					name="review" id="review"
					style="font-size: 10px; margin-left: 10px;">리뷰작성</button>
				<div>
					<table id="mainPageTable" name="table"
						class="table table-bordered display" width="100%">
						<thead>
							<tr>
								<th>장소명 </th>
									<th>장소번호 </th>
								<th>예약번호</th>
								
								<th>예약자 ID</th>

								<th>입실</th>
								<th>퇴실</th>
								<th>인원</th>
								<th>금액</th>
								<th>예약 일</th>
								<th><input type="checkbox" name="allCheck" id="allCheck"
									onclick="checkAll();" /></th>

							</tr>

						</thead>
						<tbody>

							<c:forEach items="${list}" var="e" varStatus="status">

								<tr>
									<td>${e.placeName}</td>
									<td>${e.placeNum }</td>
									<td>${e.reserveNum}</td>
									<td>${e.reserveId}</td>
									<td>${e.startTime}</td>
									<td>${e.endTime }</td>
									<td>${e.personNum}</td>
									<td>${e.payPrice}</td>
									<td>${e.reserveDatee}</td>

									<td><input type="checkbox" name="allReview" id="allReview" /></td>

								</tr>
							</c:forEach>




						</tbody>

					</table>

				</div>

				<form id="subb" name="subb" method="Post" hidden="hidden" action="/reviewValue.hdo" >
					<input type="hidden" name="pName" id="pName" value=""> <input
						type="hidden" name="rNum" id="rNum" value="" /> <input
						type="hidden" name="rName" id="rName" value="" /> <input
						type="hidden" name="rId" id="rId" value="" />

				</form>


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
	

	function check(){
		var chk_obj = document.getElementsByName("allReview");
		var chk_leng = chk_obj.length;
		var checked = 0; 

		for(i=0;i<chk_leng;i++){
			if(chk_obj[i].checked==true){
			
				checked +=1;
				
			}

	}

	if(checked==0){
		alert("선택한 ID가 없습니다.");
		
		return;
	}else{	 
				var checkbox = $("input:checkbox[name=allReview]:checked");
				
				checkbox.each(function(i){
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					
					var arr1 = new Array();
					var arr2 = new Array();
					var arr3 = new Array();
					
					
					
					var placeNum = td.eq(1).text();
					var reserveNum = td.eq(2).text();
					var reserveId = td.eq(3).text();
				
				
				
					
					arr1.push(placeNum);
					arr2.push(reserveNum);
					arr3.push(reserveId);
					
					
					console.log(arr3);
					
					  $(document).on("click", "button[name='review']", function () {
						  $.ajax({
						      url: "/reserveValue.hdo",
						      type:'POST',
						      dataType : 'text',
						  
						      data: {placeNum : arr1,
						      		reservNum : arr2,
						      		reserveId : arr3
						 
						      },
						      
						      success: function(data){
						      	  	alert("성공");
						              return false;
						      }
						  })});



					
					
					
					window.name="review";
					var url = "/reviewForGuest.hdo";

				    var width = '490';
				    var height = '560';
				 
				    var left = Math.ceil(( window.screen.width - width )/2);
				    var top = Math.ceil(( window.screen.height - height )/2); 
				    window.open('/reviewForGuest.hdo', 'pop', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
				
				})
				return;	
			

	}};




	  

</script>



</html>
<!-- 


  toggle : toggleReview
 -->
