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
   <link href="<c:url value="/resources/host/css/styles.css" />" rel="stylesheet" />
     <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    

    
  </head>
  
  <body class="sb-nav-fixed">

  <%@include file="hostnav.jsp" %>
      <div id="layoutSidenav_content">
        <main>
          
          <div class="container-fluid px-4">
            <h1 class="mt-4">내 장소 관리</h1>
      

					<div class="card mb-4">
						<div class="card-body">등록한 장소를 관리할 수 있습니다.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> <a href="/managementHostPlace.hdo" style="text-decoration:none; color:black;">내 장소 관리</a>
							<i class="fas fa-table me-1"></i> <a href="/managementHostRoomPlace.hdo" style="text-decoration: none; color:black">세부 방 정보 관리</a>
							
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>장소 번호</th>
										<th>장소 이름</th>
										<th>시간당 대여금액</th>
										<th>기본 인원</th>
									</tr>
								</thead>
								<tfoot>
								</tfoot>
								<tbody>
									<c:forEach var="mana" items="${list}">
										<tr class="placeList">
											<td>${mana.placeNum}</td>
									
											<td>${mana.placeName}</td>
											<td>${mana.placePrice }</td>

											<td>${mana.placePersonNum }</td>

											<td>
										   <!-- delete -->
									
												<button type="submit" class="btn btn-danger" name="delete" id="delete" style="font-size: 10px; margin-left: 10px;">삭제</button>
												<button type="button" class="btn btn-primary" name="change" id="change"
												onclick="location.href='/updatePlaceDetail.hdo?placeNum=${mana.placeNum}'"
													style="font-size: 10px; margin-left: 10px;">수정</button>
													
												
											</td>

										</tr>


									</c:forEach>


								</tbody>
								<tfoot>



								
				

								</tfoot>
							</table>




						</div>
					</div>
				</div>
				

			

			<form id="sub" name="sub" method="get" action="/reviewForGuest.hdo" hidden="hidden">
				<input type="hidden" name="placeNum" id="placeNum" value="" >
					</form>

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
  <script>
  
  
  
  $(document).on("click","#delete",function()
			{
		var chk = confirm("삭제하시겠습니까?");

		if (chk) {
			var tdArr = new Array();
			var c = $(this);
			
			var tr = c.parent().parent();
			var td = tr.children();

			var active = td.eq(0).text();
			var no = td.eq(0).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log (no);
			$("#placeNum").val(no);
	


		}
			});
</script>
</html>