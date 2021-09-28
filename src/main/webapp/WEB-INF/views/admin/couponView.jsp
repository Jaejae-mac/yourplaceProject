<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>쿠폰관리 TABLE</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/resources/css/admin/css/style-coupon.css">
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
     
  <!-- ///////////////// -->
  </head>
  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="admin.html">Space Cloud Admin</a>
        <!-- Sidebar Toggle-->
        <button
          class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
          id="sidebarToggle"
          href="#!"
        >
          <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <form
          class="
            d-none d-md-inline-block
            form-inline
            ms-auto
            me-0 me-md-3
            my-2 my-md-0
          "
        >
          <div class="input-group">
            <input
              class="form-control"
              type="text"
              placeholder="Search for..."
              aria-label="Search for..."
              aria-describedby="btnNavbarSearch"
            />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              id="navbarDropdown"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              ><i class="fas fa-user fa-fw"></i
            ></a>
            <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdown"
            >
              <li><a class="dropdown-item" href="#!">Settings</a></li>
              <li><a class="dropdown-item" href="#!">Activity Log</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
          <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <!--사이드바 nav태그(사이드메뉴) 시작-->
            <div class="sb-sidenav-menu">
              <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="index.html">
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-tachometer-alt"></i>
                  </div>
                  Dashboard
                </a>
  
                <div class="sb-sidenav-menu-heading">Menu</div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseMember"
                  aria-expanded="false"
                  aria-controls="collapseMember"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fa fa-user-circle"></i>
                  </div>
                  회원 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseMember"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="tablesHost.html">호스트 관리</a>
                    <a class="nav-link" href="tablesMembers.html"
                      >클라이언트 관리</a
                    >
                    <a class="nav-link" href="tablesMembers.html"
                      >신고 회원 관리</a
                    >
                    <a class="nav-link" href="tablesCoupon.html"
                      >쿠폰 관리</a
                    >
                  </nav>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsePayManagement"
                  aria-expanded="false"
                  aria-controls="collapsePayManagement"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-money-bill-alt"></i>
                  </div>
                  결제/예약/매출 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapsePayManagement"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="layout-static.html">결제 관리</a>
                    <a class="nav-link" href="layout-sidenav-light.html"
                      >예약 관리</a
                    >
                    <a class="nav-link" href="chartsAdmin.html"
                      >매출 현황</a
                    >
                  </nav>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseAnnounce"
                  aria-expanded="false"
                  aria-controls="collapseAnnounce"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-bullhorn"></i>
                  </div>
                  공지사항 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseAnnounce"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="layout-static.html">공지사항관리</a>
                  </nav>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseFAQ"
                  aria-expanded="false"
                  aria-controls="collapseFAQ"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-question-circle"></i>
                  </div>
                  FAQ
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseFAQ"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="layout-static.html">FAQ</a>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsePages"
                  aria-expanded="false"
                  aria-controls="collapsePages"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-book-open"></i>
                  </div>
                  Pages
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapsePages"
                  aria-labelledby="headingTwo"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav
                    class="sb-sidenav-menu-nested nav accordion"
                    id="sidenavAccordionPages"
                  >
                    <a
                      class="nav-link collapsed"
                      href="#"
                      data-bs-toggle="collapse"
                      data-bs-target="#pagesCollapseAuth"
                      aria-expanded="false"
                      aria-controls="pagesCollapseAuth"
                    >
                      Authentication
                      <div class="sb-sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                      </div>
                    </a>
                    <div
                      class="collapse"
                      id="pagesCollapseAuth"
                      aria-labelledby="headingOne"
                      data-bs-parent="#sidenavAccordionPages"
                    >
                      <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="login.html">Login</a>
                        <a class="nav-link" href="register.html">Register</a>
                        <a class="nav-link" href="password.html"
                          >Forgot Password</a
                        >
                      </nav>
                    </div>
                    <a
                      class="nav-link collapsed"
                      href="#"
                      data-bs-toggle="collapse"
                      data-bs-target="#pagesCollapseError"
                      aria-expanded="false"
                      aria-controls="pagesCollapseError"
                    >
                      Error
                      <div class="sb-sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                      </div>
                    </a>
                    <div
                      class="collapse"
                      id="pagesCollapseError"
                      aria-labelledby="headingOne"
                      data-bs-parent="#sidenavAccordionPages"
                    >
                      <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="401.html">401 Page</a>
                        <a class="nav-link" href="404.html">404 Page</a>
                        <a class="nav-link" href="500.html">500 Page</a>
                      </nav>
                    </div>
                  </nav>
                </div>
  
                <div class="sb-sidenav-menu-heading">Management</div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseSiteManage"
                  aria-expanded="false"
                  aria-controls="collapseSiteManage"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-laptop-house"></i>
                  </div>
                  사이트 관리
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseSiteManage"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="layout-static.html"
                      >Static Navigation</a
                    >
                    <a class="nav-link" href="layout-sidenav-light.html"
                      >Light Sidenav</a
                    >
                  </nav>
                </div>
  
                <div class="sb-sidenav-menu-heading">Addons</div>
                <a class="nav-link" href="charts.html">
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-chart-area"></i>
                  </div>
                  Charts
                </a>
                <a class="nav-link" href="tables.html">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  Tables
                </a>
              </div>
            </div>
            <div class="sb-sidenav-footer">
              <div class="small">Logged in as:</div>
              Start Bootstrap
            </div>
          </nav>
          <!--사이드바 nav태그((사이드메뉴)) 끝-->
      </div>
      <div id="layoutSidenav_content">
      <form action="/couponView.mdo" method="POST">
        <main>

        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Tables</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">메인으로</a>
              </li>
              <li class="breadcrumb-item active">Coupon</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
		                쿠폰 생성 및 조회가 가능한 페이지입니다.
                <!-- <a target="_blank" href="https://datatables.net/"
                  >official DataTables documentation</a
                > -->
              </div>
            </div>
            <!-- 테이블 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                쿠폰 관리
              </div>
              <div class="promotion-coupon">
              
                <td>
	                <button type="button" id="coup_regist_form" name="coup_regist_form" class="btn btn-primary"
	                style="font-size: 10px;margin-left: 10px;" onclick="location='couponRegist.mdo'">
	                	쿠폰 등록
	                </button>
	                <button type="button" id="coup_send_form" name="coup_send_form" class="btn btn-primary"
	                style="font-size: 10px;margin-left: 10px;" onclick="location='couponSend.mdo'">
	                	쿠폰 전송
	                </button>
                </td>
                <td>
	                <button type="button" class="btn btn-danger"
	                style="font-size: 10px;margin-left: 10px;">
	                	기한만료쿠폰 전체삭제
	                </button>
                </td>
                
              </div>
              <div class="clear"></div>
              
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                    	<th style="width:100px">전송</th>
                        <th>쿠폰코드</th>
                        <th>쿠폰명</th>
                        <th>할인율</th>
                        <th>쿠폰시작일</th>
                        <th>쿠폰만료일</th>
                        <th>쿠폰삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="cp" items="${couponList }">
                    <tr>
                      <td style="width:100px"><input type="checkbox" name="coup_check" value="coup_check" /></td>
                      <td>${cp.coupNum }</td>
                      <td>${cp.coupName }</td>
                      <td>${cp.coupDisRate }%</td>
                      <td><fmt:formatDate value="${cp.coupStartD }" pattern="yyyy-MM-dd" /></td>
                      <td><fmt:formatDate value="${cp.coupEndD }" pattern="yyyy-MM-dd" /></td>
                      <td><button type="button" class="btn btn-danger"
                      style="font-size: 10px;margin-left: 10px;" id="delete_btn">
                      	Delete
                      </button></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 테이블 끝 -->
          </div>
        </main>
        </form>
      	
        
        <!-- delete -->
       <form id = "submitForm" method="POST" action="/deleteCoupon.mdo" hidden="hidden">
       	<input type="hidden" id="deleteCoupHidden" name="deleteCoupName">
       </form>
       
       <form id = "submitForm2" method="POST" action="/couponSend.mdo" hidden="hidden">
       	<input type="hidden" id="sendCoupHidden" name="sendCoupName" >
       </form>
        
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
    
    	<script>

		$(document).on("click","#delete_btn",function()
		{
// 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var send = td.eq(0).text();
			var no = td.eq(1).text();
			var name = td.eq(2).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("쿠폰이름 text : " + name);
		
			$("#deleteCoupHidden").val(name);
			$("#submitForm").submit();
			
		});
		
	</script>
	
	<script>
	    function coup_Regist() {
	      $("#coup_regist_form").attr("action", "/couponRegist.mdo").submit();
	   }
    </script>
    
    <script>
	   $(document).on("click","#coup_send_form",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=coup_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var name = td.eq(2).text();
					
					tdAr.push(no);
					tdAr.push(name);
					
					rowNo.push(no);
					
					console.log("each 문 안에서 돌리는 쿠폰 이름= " + name)
					console.log("each 문 안에서 돌려지는 쿠폰 번호= " + no)
					
		    	});

		   	console.log("체크된 쿠폰 이름= " + tdAr[0]);
		   	console.log("체크된 쿠폰 이름(배열)= " + rowNo);
		   	
		   	$("#sendCoupHidden").val(tdAr[0]); //tdAr[1]=name값을 담고 있는 배열객체
			$("#submitForm2").submit();
		    
		});
		    
    </script>
	
	<script>
	    function coup_send() {
	      $("#coup_send_form").attr("action", "/couponSend.mdo").submit();
	   }
    </script>
	
  </body>
</html>