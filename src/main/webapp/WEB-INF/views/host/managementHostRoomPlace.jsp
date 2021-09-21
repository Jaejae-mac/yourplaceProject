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
    <title>내 장소 관리</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <link href="<c:url value="/resources/host/css/styles.css" />" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="sb-nav-fixed">


    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/indexOurPlace.hdo">Yourplace Host</a>
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
              <div class="sb-sidenav-menu-heading">Menu</div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseHost"
                aria-expanded="false"
                aria-controls="collapseHost"
              >
              <input type="hidden" value="${userId }" name="userId" value="userId"/>
                <div class="sb-nav-link-icon">
                  <i class="fa fa-user-circle"></i>
                </div>
                호스트 관리
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapseHost"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="/updateProfileforHost.hdo">내 프로필 관리</a>
                </nav>
              </div>
              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapsePlace"
                aria-expanded="false"
                aria-controls="collapsePlace"
              >
                <div class="sb-nav-link-icon">
                  <i class="fa fa-cloud"></i>
                </div>
                장소 관리
                <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
                </div>
              </a>
              <div
                class="collapse"
                id="collapsePlace"
                aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion"
              >
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="/managementHostPlace.hdo">내 장소 관리</a>
                  <a class="nav-link" href="/insertPlaceforHost.hdo">내 장소 등록</a>
                  <a class="nav-link" href="/hostReviews.hdo">리뷰 관리</a>
                </nav>
              </div>

              <a
                class="nav-link collapsed"
                href="#"
                data-bs-toggle="collapse"
                data-bs-target="#collapseMember"
                aria-expanded="false"
                aria-controls="collapseMember"
              >
                <div class="sb-nav-link-icon">
                  <i class="fa fa-calendar-check"></i>
                </div>
                예약 관리
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
                  <a class="nav-link" href="/placeReserveListforHost.hdo">예약 현황</a>
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
                결제/매출 관리
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
                  <a class="nav-link" href="layout-static.html">결제 정보</a>
                  <a class="nav-link" href="chartsAdmin.html">매출 현황</a>
                </nav>
              </div>
            </div>
          </div>
          <input type="hidden" id="userId" name="userId" value="${userId }"/>
          <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
         ${userId }
          </div>
        </nav>
        <!--사이드바 nav태그((사이드메뉴)) 끝-->
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">내 장소 관리</h1>

					<div class="card mb-4">
						<div class="card-body">등록한 장소를 관리할 수 있습니다.</div>
					</div>
					<div class="card mb-4">
					
						<div class="card-header">
							<i class="fas fa-table me-1"></i> <a href="/managementHostPlace.hdo" style="text-decoration: none; color:black;">내 장소 관리</a>
							<i class="fas fa-table me-1"></i> <a href="/managementHostRoomPlace.hdo" style="text-decoration: none; color:black;">세부 방 정보 관리</a>
						</div>
						
						<div class="card-body">
					<form action="/getRoomValue.hdo" method="post">
								<input type="button" onclick="add_row()"
									class="btn btn-primary"
									style="font-size: 10px; margin-left: 10px;" value="추가" />


								<script>
						
								function add_row(){
							var roomListTbody =document.getElementById('roomListTbody');
							var row = roomListTbody.insertRow(roomListTbody.rows.length);
							var cell1 = row.insertCell(0);
							var cell2 = row.insertCell(1);
							var cell3 = row.insertCell(2);
							var cell4 = row.insertCell(3);
							var cell5 = row.insertCell(4);
							var cell6 = row.insertCell(5);	
							
						
							cell1.innerHTML = "<td><input type='text' name='inputplaceNum' id='inputplaceNum' readonly/></td>"
							cell2.innerHTML = "<td><input type='text  name='inputplaceName' id='inputplaceName' placeholder='장소 이름을 적어주세요'/></td>"
							cell3.innerHTML = "<td><input type='text'  name='inputroomName' id='inputroomName' placeholder='방 이름을 적어주세요'/></td>"
							cell4.innerHTML = "<td><input type='text'  name='inputpersonNum' id='inputpersonNum' placeholder='인원수를 적어주세요'/></td>"
							cell5.innerHTML = "<td><input type='text' name='inputextraCharge' id='inputextraCharge' placeholder='추가 금액을 적어주세요'/></td>"								
							cell6.innerHTML ="<td><button type='button' class='btn btn-danger' onclick='delete_row()' style='font-size: 10px; margin-left: 10px;'>삭제</button><input type='button' onclick='getValue()' id='getV' value='등록' class='btn btn-primary' style='font-size: 10px; margin-left: 10px;'></td>"
					
					
						
						}
						
						function delete_row(){
							var roomListTbody = document.getElementById('roomListTbody');
							if(roomListTbody.rows.length <1)
								return;
							roomListTbody.deleteRow(roomListTbody.rows.length-1);
						}
						

						</script>




						
							      
							<table id="datatablesSimple">
							             
								<thead>
									 <tr>
                        <th>장소 번호</th>
                        <th>장소 이름</th>
                        <th>세부 방 이름</th>
                        <th>기본 인원</th>
                       <th>추가 금액</th>
                       
                    </tr>
                </thead>
                <tbody id="roomListTbody">

                  <c:forEach var="room" items="${list2}">
										<tr>
											<td>${room.placeNum}</td>
											<td>${room.detailNum}</td>
											<td>${room.detailTitle }</td>
											<td>${room.detailPersonNum }</td>
											<td>${room.surcharge }</td>
									<td>
							<button type="button" class="btn btn-danger"  onclick="location.href='/deleteRoom.hdo?placeNum=${room.placeNum}'" style="font-size: 10px; margin-left: 10px;">삭제</button>
									
									</td>

										</tr>


									</c:forEach>

								</tbody>
								<tfoot>





								</tfoot>
							</table>
	 </form>



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
    <script src="<c:url value="/resources/host/js/scripts.js" />"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
 
    <script src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>

  </body>

</html>