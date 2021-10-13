<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>장소 관리 및 승인</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
    <script>
    $(document).on("click","#allow_btn",function()
	{
		alert("장소 승인이 완료되었습니다.");
	});
	</script>
	
	<script>
    $(document).on("click","#deny_btn",function()
	{
		alert("장소 승인이 거절되었습니다.");
	});
	</script>
    
  </head>
  
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>


      <div id="layoutSidenav_content">
        <main>
        <form action="/spaceallow.mdo" method="POST">
          <div class="container-fluid px-4">
            <h1 class="mt-4">장소등록 조회 및 승인 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo"> Admin Home </a>
              </li>
              <li class="breadcrumb-item active">Shared Space List</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                호스트로부터 요청된 장소등록을 확인 후, 승인 처리를 할 수 있는 페이지입니다.
              </br>
                호스트의 아이디, 닉네임, 장소에 대한 정보만 확인됩니다.
              </br>
                또한 현재 운영 중인 장소를 조회할 수 있으며, 장소명을 누르면 상세보기로 이동합니다.
              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                장소 등록 승인
              </div>
              <div class="card-body">
                <table id="datatablesSimple">

                  <thead>
                    <tr style="background: rgba(231,231,231,0.4)">
                      <th style="text-align:center">승인상태</th>
                      <th style="text-align:center">장소번호</th>
                      <th style="text-align:center">아이디</th>
                      <th style="text-align:center">이름</th>
                      <th style="text-align:center">장소분류</th>
                      <th style="text-align:center">장소명</th>
                      <th style="text-align:center">연락처</th>
                      <th style="text-align:center">이메일</th>
                      <th style="text-align:center">승인처리</th>
                      <th style="text-align:center">장소삭제</th>
                      
                    </tr>
                  </thead>
                  
                  <tbody>
					<c:forEach var="spc" items="${spaceList }">
					
                    <tr>
                      <td>
                      		<c:if test="${spc.placeAllow eq '1'}">
	                      		승인
	                      	</c:if>
	                      	<c:if test="${spc.placeAllow ne '1'}">
	                      		미승인
	                      	</c:if>
	                  </td>
	                  
                      <td>${spc.placeNum }</td>
                      
                      <td>
                      	<c:if test="${spc.userType eq '1' }">
                      		${spc.userId}
                      	</c:if>
                      	
                      	<c:if test="${spc.userType eq '0'}">
                      		<font color="red">${spc.userId}</font>
                      	</c:if>
                      </td>
                      
                      <td>${spc.userName}</td>
                      <td>${spc.placeMaincate }</td> <!--클릭시 장소 상세보기 페이지로 이동.-->
                      <td><a href="/detailPlaceForm.do?placeNum=${spc.placeNum}" target="_blank"
                      	style="color: black;">${spc.placeName }</a></td>
                      <td>${spc.userTel }</td>
                      <td>${spc.userEmail }</td>
                      
                      <td align="center">
                      
	                   <c:if test="${spc.placeAllow eq '0' && spc.userType eq '1'}">
	                        <button type="button" class="btn btn-primary"
	                        style="font-size: 10px;margin-left: 10px;" id="allow_btn">
	                        	승인하기
	                        </button>
	                   </c:if>
                   
	                   <c:if test="${spc.placeAllow eq '1'}">
	                        <button type="button" class="btn btn-danger"
	                        style="font-size: 10px;margin-left: 10px;" id="deny_btn">
	                        	승인취소
	                        </button>
	                   </c:if>
                      
	                   <c:if test="${spc.placeAllow eq '0' && spc.userType eq '0'}">
	                        <font color="red" align="center">정지된 계정</font>
	                   </c:if>
                     
                      </td>
                      
                      
                      <td align="center">
                      <button type="button" class="btn btn-danger"
                      style="font-size: 10px;margin-left: 10px;" id="delete_btn">
                      	삭제
                      </button></td>
                    </tr>
                    
                    </c:forEach>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
          </form>
        </main>
        
        <!-- delete -->
       <form id = "submitForm" method="POST" action="/deleteSpace.mdo" hidden="hidden">
       	<input type="hidden" id="deleteSpaceHidden" name="deleteSpace">
       </form>
       
       <!-- allow -->
       <form id="submitForm2" method="POST" action="/allowSpace.mdo" hidden="hidden">
       	<input type="hidden" id="allowSpaceHidden" name="allowSpace">
       	<input type="hidden" id="allowSpaceEmail" name="allowEmail">
       </form>
       
       <!-- deny -->
       <form id="submitForm3" method="POST" action="/denySpace.mdo" hidden="hidden">
       	<input type="hidden" id="denySpaceHidden" name="denySpace">
       	<input type="hidden" id="denySpaceEmail" name="denyEmail">
       </form>
        
        
      </div>
    </div>
    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous">
    </script>
    
    <script src="/resources/css/admin/js/scripts.js"></script>
    
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous">
    </script>
    
    <script src="/resources/css/admin/js/datatables-simple-demo.js"></script>
    
    <script>

		$(document).on("click","#delete_btn",function()
		{
 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var active = td.eq(0).text();
			var no = td.eq(1).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("장소 번호 text : " + no);
			
			var result = confirm("선택하신 장소를 삭제하시겠습니까?");
			
			if(result){
			    alert("장소 삭제가 완료되었습니다.");
			    
				$("#deleteSpaceHidden").val(no);
				$("#submitForm").submit();
				console.log("정상!")
			
			}else{
			    alert("장소 삭제가 취소되었습니다.");
			}
		

			
		});
			
	</script>
	
	<script>
	
	$(document).on("click","#allow_btn", function()
		{
		
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
	
			var active = td.eq(0).text();
			var no = td.eq(1).text();
			var id = td.eq(2).text();
			var name = td.eq(3).text();
			var cate = td.eq(4).text();
			var spaceName = td.eq(5).text();
			var tel = td.eq(6).text();
			var email = td.eq(7).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
		
	        console.log("선택된 번호: " + no);
	        console.log("승인 메일 보낼 주소: " + email);
	        
	        $("#allowSpaceHidden").val(no);
	        $("#allowSpaceEmail").val(email);
	        $("#submitForm2").submit();
	        
	        

		});
			
	</script>
	
	
	<script>
	
	$(document).on("click","#deny_btn",function()
		{
		
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
	
			var active = td.eq(0).text();
			var no = td.eq(1).text();
			var id = td.eq(2).text();
			var name = td.eq(3).text();
			var cate = td.eq(4).text();
			var spaceName = td.eq(5).text();
			var tel = td.eq(6).text();
			var email = td.eq(7).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
		
	        console.log("선택된 번호: " + no);
	        console.log("거절 메일 보낼 주소: " + email);
	        
	        $("#denySpaceHidden").val(no);
	        $("#denySpaceEmail").val(email);
	        $("#submitForm3").submit();

		});
			
	</script>
	

    
  </body>
</html>
