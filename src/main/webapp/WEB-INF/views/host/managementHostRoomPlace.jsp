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
    <title>Yourplace_내 장소 관리</title>
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
<%@include file="hostnav.jsp" %>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">내 장소 관리</h1>
            <input type="hidden" value="${userId}" name="userId" id="userId"/>

					<div class="card mb-4">
						<div class="card-body">등록한 장소를 관리할 수 있습니다.</div>
					</div>
					<div class="card mb-4">
					
						<div class="card-header">
							<i class="fas fa-table me-1"></i> <a href="/managementHostRoomPlace.hdo" style="text-decoration: none; color:black;">세부 방 정보 관리</a>
							<i class="fas fa-table me-1"></i> <a href="/managementHostPlace.hdo" style="text-decoration: none; color:black;">내 장소 관리</a>
						         
						</div>
						
						<div class="card-body">
					
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
							var cell7 = row.insertCell(6);
						
							cell1.innerHTML = "<tr><td><input type='text' name='pNum' id='pNum' placeholder='장소 번호를 적어주세요'/></td>"
							cell2.innerHTML = "<td><input type='text'  name='roomNum' id='roomNum'/></td>"
							cell3.innerHTML = "<td><input type='text'  name='detailTitle' id='detailTitle' placeholder='방 이름을 적어주세요'/></td>"
							cell4.innerHTML = "<td><input type='text'  name='detailPersonNum' id='detailPersonNum' placeholder='인원수를 적어주세요'/></td>"
							cell5.innerHTML = "<td><input type='text' name='surcharge' id='surcharge' placeholder='추가 금액을 적어주세요'/></td>"								
							cell6.innerHTML ="<td><button type='button' class='btn btn-danger' onclick='delete_row()' style='font-size: 10px; margin-left: 10px;'>삭제</button></td>"
							cell7.innerHTML="<td><input type='submit' id='getValue' name='getValue' class='btn btn-primary' style='font-size: 10px; margin-left: 10px;' value='등록'/></td></tr>"
						
						
								}
						
						function delete_row(){
							var roomListTbody = document.getElementById('roomListTbody');
							if(roomListTbody.rows.length <1)
								return;
							roomListTbody.deleteRow(roomListTbody.rows.length-1);
						}
						
					

						</script>
	<script>
	
	
	var arr1 = new Array();
	var arr2 = new Array();
	var arr3 = new Array();
	var arr4 = new Array();
	var arr5 = new Array();
	
	

	 $(document).on("click","#getValue",function(){
			var placeNum = $('#pNum').val();
			var roomNum =  $('#roomNum').val();
			 var roomName =  $('#detailTitle').val();
			 var personNum =  $('#detailPersonNum').val();
			 var extra = $('#surcharge').val();
			 
			 arr1.push(placeNum);
			 arr2.push(roomNum);
			 arr3.push(roomName);
			 arr4.push(personNum);
			 arr5.push(extra);
			 
	
		 $.ajax(

			{
			
			url : '/getRoomVlaue.hdo',
					data : {placeNum : arr1, detailNum : arr2, detailTitle : arr3, detailPersonNum:arr4, surcharge: arr5},
					datatype : "text",
					type : 'POST',
					success : function(xh) {
						alert("등록되었습니다.");
					}
				});
	
	});
	

	  
	  $(document).on("click","#delete",function()
				{
			var chk = confirm("삭제하시겠습니까?");

			if (chk==true) {
				var tdArr = new Array();
				var c = $(this);
				
				var tr = c.parent().parent();
				var td = tr.children();

				var active = td.eq(0).text();
				var no = td.eq(1).text();
				var noo = td.eq(0).text();
				
				td.each(function(i)
				{
					tdArr.push(td.eq(i).text());
				});
				
				console.log (no);
				console.log(noo);
				$("#detailNum").val(no);
				$("#placeNum").val(noo);
				$("#sub").submit();
		
				alert("삭제되었습니다.");	
	
			}
				});
	</script>

							         
							<table id="datatablesSimple">
							             
								<thead>
									 <tr>
                        <th>장소 번호</th>
                 		<th>방 번호</th>
                        <th>세부 방 이름</th>
                        <th>기본 인원</th>
                       <th>추가 금액</th>
                       
                    </tr>
                </thead>
                <tbody id="roomListTbody">

                  <c:forEach var="room" items="${list2}" varStatus="status">
										<tr>
											<td>${room.placeNum}</td>

										<td>${room.detailNum}</td>
									
										<td>${room.detailTitle }</td>
											<td>${room.detailPersonNum }</td>
											<td>${room.surcharge }</td>
									<td>
							
							<button type="submit" class="btn btn-danger"  name="delete" id="delete" style="font-size: 10px; margin-left: 10px;">삭제</button>
										
											</td>

										</tr>


									</c:forEach>

								</tbody>
								<tfoot>





								</tfoot>
							</table>




			<form id="sub" name="sub" method="get" action="/deleteRoom.hdo" hidden="hidden">
				<input type="hidden" name="detailNum" id="detailNum" value="" > 
				<input type="hidden" name="placeNum" id="placeNum" value=""/>


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
  </body>

</html>