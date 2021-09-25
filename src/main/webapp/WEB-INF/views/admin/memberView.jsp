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
    <title>회원관리</title>
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
    $(document).on("click","#delete_btn",function()
	{
		alert("선택한 사용자가 탈퇴처리 되었습니다. (계정삭제)");
	});
</script>
  
  </head>
  
  <body class="sb-nav-fixed">
	
    <%@ include file="adminNavigation.jsp" %>

      <!-- 회원관리 테이블 시작 -->
      
      <div id="layoutSidenav_content">
      <form action="/memberView.mdo" method="POST" >
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">회원관리</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="indexOurPlace.html">Go Home</a>
              </li>
              <li class="breadcrumb-item active">Member</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                	모든 회원의 정보를 볼 수 있으며, 삭제할 수 있는 페이지 입니다.
              </div>
            </div>
            
            <!-- DataTable 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	전체 회원 관리
              </div>
              <div class="card-body">
	              <select class="dataTable-selector">
	              	<option>전체 회원 보기</option>
	              	<option>게스트만 보기</option>
	              	<option>호스트만 보기</option>
	              </select>
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                    	<th>정지 여부</th>
                        <th>회원번호</th>
                        <th>회원타입</th>                
                        <th>아이디</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                        <th>성별</th>
                        <th>가입일자</th>
                        <th>SMS 수신동의</th>
                        <th>Email 수신동의</th>
                        <th>접근제한여부</th>
                        <th>회원탈퇴</th>
                    </tr>
                  </thead>

				<tbody>
                  <c:forEach var="mem" items="${memberList}">
                    <tr>
                    	<td id="active">
	                      	<c:if test="${mem.userActive eq '0'}">제한된 이용자</c:if>
	                      	<c:if test="${mem.userActive eq '1'}">사용가능</c:if>
                     	</td>
                    
                      <td>${mem.userNum }</td>
                      
                      <td>
                      	<c:if test="${mem.userType eq '0'}">
                      	게스트
                      	</c:if>
                      	<c:if test="${mem.userType ne '0'}">
                      	호스트
                      	</c:if>
                      </td>
                      
                      <td>${mem.userId  }</td>
                      <td>${mem.userName }</td>
                      <td>${mem.userTel }</td>
                      <td>${mem.userEmail }</td>
                      <td>${mem.userSex }</td>
                      <td>${mem.userRegDate }</td>
                      <td>${mem.userSmsAgree }</td>
                      <td>${mem.userEmailAgree }</td>
                      <td>
	                      <button type="button"
	                      class="btn btn-danger"
	                      style="font-size: 10px; margin-left: 10px;" id="disable_btn">
	                      	제한
	                      </button>
                      </td>
                      <td>
	                      <button type="button"
	                      class="btn btn-danger"
	                      style="font-size: 10px; margin-left: 10px;" id="delete_btn">
	                      	삭제
	                      </button>
                      </td>
                    </tr>
                  </c:forEach>
				</tbody>
               </table>
                
              </div>
            </div>
            <!-- DataTable 끝 -->
            
          </div>
        </main>
       </form>
       
       <!-- delete -->
       <form id = "submitForm" method="POST" action="/deleteMember.mdo" hidden="hidden">
       	<input type="hidden" id="deleteUserHidden" name="deleteUserId">
       </form>
       
       <form id="submitForm2" method="POST" action="/disableMember.mdo" hidden="hidden">
       	<input type="hidden" id="disableUserHidden" name="disableUserId">
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
      crossorigin="anonymous">
    </script>
    
    <script src="resources/css/admin/js/scripts.js"></script>
    
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous">
    </script>
    
    <script src="resources/css/admin/js/datatables-simple-demo.js"></script>

	<script>

		$(document).on("click","#delete_btn",function()
		{
// 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var active = td.eq(0).text();
			var no = td.eq(1).text();
			var name = td.eq(2).text();
			var id = td.eq(3).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("아이디 text : " + id);
		
			$("#deleteUserHidden").val(id);
			$("#submitForm").submit();
			
		});
			
	</script>
	
		<script>

		$(document).on("click","#disable_btn",function()
		{
// 			console.log('유저 접근제한 버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var active = td.eq(0).text();
			var no = td.eq(1).text();
			var name = td.eq(2).text();
			var id = td.eq(3).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("아이디 text : " + id);
			console.log(id + " 회원님의 계정 상태: " + active);
		
			$("#disableUserHidden").val(id);
			$("#submitForm2").submit();
			

			if(active == '제한된 이용자')
				{
					alert("사용 가능으로 변경되었습니다.");
				}
			else(active == '사용가능')
				{
					alert("선택한 사용자는 접근이 제한되었습니다.");
				}
			
		});
			
	</script>
		
  </body>
</html>