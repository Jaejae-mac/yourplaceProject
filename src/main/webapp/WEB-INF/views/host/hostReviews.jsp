<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>Yourplace_리뷰 관리</title>
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
        var col_kor = [
          { title: "예약번호" },
          { title: "장소번호" },
          { title: "회원아이디" },
          { title: "별점" },
          { title: "등록날짜" },
          { title: "리뷰보기" },
        ];
        
        columns: [
        	{ data: 'reservNum' },
        	{ data: 'placeNum' },
        	{ data: 'memId' },
        	{ data: 'star' },
        	{ data: 'regDate' },
        	
        	
        	
        	 ];

       
      
    </script>
  </head>
  <body class="sb-nav-fixed">
   <%@include file="hostnav.jsp" %>
   
        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">Reviews</h1>
              <div class="card mb-4">
                <div class="card-body">
                  게스트 리뷰를 클릭하여 호스트 리뷰를 볼 수 있습니다.
                  리뷰보기를 클릭하여 리뷰의 내용을 확인할 수 있습니다.
                </div>
              </div>
              <div class="card mb-4">
                <div class="card-header">
              <i class="fas fa-table me-1"></i> <a href="/hostReviews.hdo" style="text-decoration:none; color:black;">리뷰관리</a>
                  <div style="display: inline; float: right">
                    <label for="toggle-one" style="margin-right: 5px"
                      >클릭하여 전환</label
                    >
                    <input
                      id="toggle-one"
                      checked
                      type="checkbox"
                      style="text-align: center"
                      name="toggleReview"
                    />
                  </div>
                </div>

                <div class="card-body">
                  <table
                    id="mainPageTable"
                    class="table table-bordered display"
                    width="100%"
                  >
                    <thead align="center">
                      <tr>
                        <th>예약번호</th>
                        <th>장소번호</th>
                      
                        <th>회원아이디</th>
                        <th>별점</th>
                        <th>등록날짜</th>
                        <th>리뷰 보기</th>
                        
                      </tr>
                     
              



                    </thead>
               
                    <tbody align="center">
                   
  			<c:forEach var="test" items="${list}">
  			<tr>
  			<td>${test.reservNum }</td>
  			<td>${test.placeNum }</td>
  			<td>${test.memId }</td>
  			<td>${test.star }</td>
  			<td>${test.regDate }</td>
  			<td><a href="">리뷰 보기</a></td>
  			
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
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
	<script src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
  </body>
</html>
<!-- 


  toggle : toggleReview
 -->
