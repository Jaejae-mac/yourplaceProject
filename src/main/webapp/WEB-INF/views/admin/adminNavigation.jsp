<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:if test="${adminId == null }">
	
	<script>
		location.href="/main.mdo";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

 <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/home.mdo">Yourplace Admin</a>
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
<!--            <input
              class="form-control"
              type="text"
              placeholder="Search for..."
              aria-label="Search for..."
              aria-describedby="btnNavbarSearch"
            />
             <button class="btn btn-primary" id="btnNavbarSearch" type="button"> 
               <i class="fas fa-search"></i>
             </button> -->
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
<!--               <li><a class="dropdown-item" href="#!">Settings</a></li> -->
<!--               <li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
<!--               <li><hr class="dropdown-divider" /></li> -->
              <li><a class="dropdown-item" href="/adminLogout.mdo">Logout</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
          <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <!--???????????? nav??????(???????????????) ??????-->
            <div class="sb-sidenav-menu">
              <div class="nav">
                
  
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
                 	 ?????? ??????
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
                  <c:if test="${adminLevel == 0 }">
                  	  <a class="nav-link" href="/rootAccountView.mdo">????????? ??????</a>
                  </c:if>
                    <a class="nav-link" href="/memberView.mdo">?????? ??????</a>
                    <!-- <a class="nav-link" href="/reportedMember.mdo"
                      >?????? ?????? ??????</a
                    > -->
                    
                  </nav>
                </div>
                
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseAdmin"
                  aria-expanded="false"
                  aria-controls="collapseAdmin"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fa fa-user-circle"></i>
                  </div>
                  	?????? ??????
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseAdmin"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/spaceList.mdo">?????? ??????</a>
                  </nav>
                </div>
                
                
                
                <!---->
                <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseCoupon"
                aria-expanded="false"
                aria-controls="collapseCoupon">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-percentage"></i>
                </div>
                	?????? ??????
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseCoupon"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="/couponView.mdo">?????? ??????</a>
                  <a class="nav-link" href="/couponRegist.mdo">?????? ??????</a>
                </nav>
              </div>
                <!---->
                <!--?????? ?????? ?????? ??????-->
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
                  	??????/?????? ??????
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
                    <a class="nav-link" href="/reserveView.mdo">?????? ??????</a>
                    <a class="nav-link" href="/paymentView.mdo">?????? ??????</a>
                    <a class="nav-link" href="/refundView.mdo">?????? ??????</a>
                  </nav>
                </div>
                
                <!--?????? ?????? ?????? ??????-->
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseRevenueManagement"
                  aria-expanded="false"
                  aria-controls="collapseRevenueManagement"
                >
                  <div class="sb-nav-link-icon">
                    <i class="fas fa-money-bill-alt"></i>
                  </div>
                  	?????? ??????
                  <div class="sb-sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                  </div>
                </a>
                <div
                  class="collapse"
                  id="collapseRevenueManagement"
                  aria-labelledby="headingOne"
                  data-bs-parent="#sidenavAccordion"
                >
                  <nav class="sb-sidenav-menu-nested nav">
                    
<!--                     <a class="nav-link" href="/revenueView.mdo">?????? ??????</a> -->
                    <a class="nav-link" href="/specificRevenue.mdo">?????? ??????</a>
                    
                  </nav>
                </div>
                
                <!---->
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
                  	???????????? ??????
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
                    <a class="nav-link" href="infoGuest.mdo">????????? FAQ</a>
                    <a class="nav-link" href="infoHost.mdo">????????? FAQ</a>
                    <a class="nav-link" href="controlBanner.mdo">?????? ?????????</a>
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
                  		???????????? ??????
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
                    <a class="nav-link" href="/questionView.mdo">???????????? ??????</a>
                    <a class="nav-link" href="answerView.mdo">???????????? ??????</a>
                </div>
                <a
                  class="nav-link collapsed"
                  href="#"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapsePages"
                  aria-expanded="false"
                  aria-controls="collapsePages"
                >
                  
                  
                  <div class="sb-sidenav-collapse-arrow">
                    
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
                   
                    <div
                      class="collapse"
                      id="pagesCollapseAuth"
                      aria-labelledby="headingOne"
                      data-bs-parent="#sidenavAccordionPages"
                    >
                      
                    </div>
                    
                    <div
                      class="collapse"
                      id="pagesCollapseError"
                      aria-labelledby="headingOne"
                      data-bs-parent="#sidenavAccordionPages"
                    >
                      
                    </div>
                  </nav>
                </div>
  

                <div class="sb-sidenav-menu-heading"></div>
                </div>
              
            </div>
            <div class="sb-sidenav-footer">
              <div class="small">?????? ????????? ??????:</div>
             ${adminId}
            </div>
          </nav>
          <!--???????????? nav??????((???????????????)) ???-->
      </div>
</body>
</html>