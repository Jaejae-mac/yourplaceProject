<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>공지사항 추가등록</title>

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

<!--Boot Strap Date picker end-->
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
                    <a class="nav-link" href="tablesMembers.html">호스트 관리</a>
                    <a class="nav-link" href="tablesMembers.html"
                      >클라이언트 관리</a
                    >
                    <a class="nav-link" href="tablesMembers.html"
                      >신고 회원 관리</a
                    >
                    <a class="nav-link" href="layout-sidenav-light.html"
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
      <form action="/infoHostRegist.mdo" method="POST">
        <main>
          <div class="container-fluid px-4">
           
           
           
            <h1 class="mt-4">공지사항 추가등록 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">공지사항 등록</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                blank
                
              </div>
            </div>
            <div class="card-header">
              <b>공지사항 추가등록</b>
            </div>
            
            <div>
              <table class="table table-bordered">
                <tbody>
                
                <tr>
                  <th scope="col">카테고리</th>
                  <td>
                  	<select name="infoHostCate">

                  		<option value="0">호스트 지원</option>
                  		<option value="1">장소 등록</option>
                  		<option value="2">입금 계좌 설정</option>
                  		<option value="3">예약</option>
                  		<option value="4">예약 진행</option>
                  		<option value="5">파손 및 배상</option>
                  		<option value="6">추가 청구</option>
                  		<option value="7">대금 지급</option>
                  		<option value="8">이용 요금</option>

                  	</select>
                  
                  </td>
                </tr>
                
                <tr>
                  <th scope="col">공지사항 제목</th>
                  <td><input type="text" id="infoTitle" name="infoHostTitle" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">공지사항 내용</th>
                  <td><textarea id="infoContent" name="infoHostContent" style="width:410px; height:100px;"> </textarea></td>
                </tr>
              
              </tbody>
              </table>
              
              
              <div class="promotion-coupon-regist">
                
                <td>
	                <button type="button" class="btn btn-danger" style="font-size: 10px;margin-left: 10px;"
	                onclick="location='infoHost.mdo'">
	                	취소
	                </button>
                </td>
                
                
                <td>
	                <input type="submit" class="btn btn-primary" style="font-size: 10px;margin-left: 10px;" />
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

