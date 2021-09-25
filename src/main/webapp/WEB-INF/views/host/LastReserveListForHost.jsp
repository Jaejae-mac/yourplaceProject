<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Reserve</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
    <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css"
    />
    <link
      href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
      rel="stylesheet"
    />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>
    <script>
      $(document).on("click", ".trigger", function () {
        Swal.fire("리뷰보기 입니다.");
      });
      $(function () {
        $("#toggle-one").bootstrapToggle({
          on: "게스트리뷰",
          off: "호스트리뷰",
          offstyle: "success",
        });
      });
      $(document).ready(function () {
        var lang_kor = {
          decimal: "",
          emptyTable: "데이터가 없습니다.",
          info: "_START_ - _END_ (총 _TOTAL_ 개)",
          infoEmpty: "0명",
          infoFiltered: "(전체 _MAX_ 명 중 검색결과)",
          infoPostFix: "",
          thousands: ",",
          lengthMenu: "_MENU_ 개씩 보기",
          loadingRecords: "로딩중...",
          processing: "처리중...",
          search: "검색 : ",
          zeroRecords: "검색된 데이터가 없습니다.",
          paginate: {
            first: "첫 페이지",
            last: "마지막 페이지",
            next: "다음",
            previous: "이전",
          },
          aria: {
            sortAscending: " :  오름차순 정렬",
            sortDescending: " :  내림차순 정렬",
          },
        };
      

      
    </script>
    
    <script>
    
    
	
	function showPop() {
		 
	    var width = '430';
	    var height = '570';
	 
	    var left = Math.ceil(( window.screen.width - width )/2);
	    var top = Math.ceil(( window.screen.height - height )/2); 
	 
	    window.open('/reviewPopup.hdo', '리뷰남기기', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
	    window.close();
	}

</script>



<script> <!--테스트-->
$("input[name=reviewCheck]:checked").each(function() { 
    console.log( 'checkbox값 : '+$(this).val() );
});
		
	    
</script>
<!--테스트-->


<script><!--테스트-->

$("#insert").click(function(){ 
	
	var rowData = new Array();
	var tdArr = new Array();
	var checkbox = $("input[name=reviewCheck]:checked");
	
	// 체크된 체크박스 값을 가져온다
	checkbox.each(function(i) {

		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
		
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		var no = td.eq(1).text()+", "
		var userid = td.eq(2).text()+", ";
		var name = td.eq(3).text()+", ";
		var email = td.eq(4).text()+", ";
		
		// 가져온 값을 배열에 담는다.
		tdArr.push(no);
		tdArr.push(userid);
		tdArr.push(name);
		tdArr.push(email);
		
		console.log("no : " + no);
		console.log("userid : " + userid);
		console.log("name : " + name);
		console.log("email : " + email);
	});
	

</script>

  </head>
  <body class="sb-nav-fixed">
   <%@include file="hostnav.jsp" %>
        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">예약 목록</h1>
              <div class="card mb-4">
                <div class="card-body">
            	지난 예약 목록을 볼 수있습니다.
                </div>
            
              </div>
               		<button type="button" class="btn btn-primary"
										style="font-size: 10px; margin-left: 10px;" onclick="showPop()" id="insert" name="insert">리뷰 남기기</button>
              <table
              id="mainPageTable"
              class="table table-bordered display"
              width="100%"
            >
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
									</tr>
								</thead>
								<tbody>
									<c:forEach var="test" items="${list}">
										<tr>
											<td>${test.placeName}</td>
											<td>${test.reserveNum }</td>
											<td>${test.reserveName }</td>
											<td>${test.reserveYear }년-${test.reserveMonth }-월${test.reserveDate }일</td>
											
										
											<td>${test.startTime }</td>
											<td>${test.endTime }</td>
											<td>${test.personNum }</td>
											<td>${test.payPrice }</td>
											<td><input type="checkbox" id="reviewCheck" name="reviewCheck" /></td>
							


							</tr>


									</c:forEach>



								</tbody>

            </table>
            <input type="hidden" name="reserveNum" id="reserveNum" value="${test.reserveNum}"/>
											
          </div>
        </div>
      </div>
    </main>
    <footer class="py-4 bg-light mt-auto">
      <div class="container-fluid px-4">
        <div
          class="d-flex align-items-center justify-content-between small"
        >
          <div class="text-muted">Copyright &copy; YourPlace</div>
          <div>
          
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
	<script
		src="<c:url value="/resources/host/js/scripts.js" />"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
  crossorigin="anonymous"
></script>

<script
  src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
  crossorigin="anonymous"
></script>
	<script
		src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
  </body>
</html>
<!-- 


  toggle : toggleReview
 -->
    