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
    <title>관리자 계정 조회</title>
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
    $(document).on("click","#sendRegist",function()
	{
		alert("입력하신 사용자 정보가 관리자 계정으로 등록되었습니다.");
	});
	</script>
  
  </head>
  
  <body class="sb-nav-fixed">
	
    <%@ include file="adminNavigation.jsp" %>

      <!-- 회원관리 테이블 시작 -->
      
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">관리자 계정 관리</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="indexOurPlace.html">Go Home</a>
              </li>
              <li class="breadcrumb-item active">Member</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                	관리자 계정을 조회할 수 있는 페이지입니다.
                	</br>
                	Root(1) : delete 제한: 장소삭제, 멤버삭제, 쿠폰삭제, 공지사항 삭제
                	</br>
                	Admin(2) : delete 및 create 제한: 장소삭제, 멤버삭제, 쿠폰등록/삭제, 공지사항 등록/삭제 제한
                	</br>
                	Root 계정의 생성은 반드시 0번 ROOT 계정을 통해 생성하시기 바랍니다.
              </div>
            </div>
            
            <!-- DataTable 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	관리자 계정 조회
              </div>
              
              <!-- 계정 추가 및 Modal -->
              <div class="promotion-coupon">
              	
              	<!-- 계정추가 버튼 -->
	                <button type="button" id="regist" name="accountRegist" class="btn btn-primary"
	                style="font-size: 10px;margin-left: 10px;"
	                data-toggle="modal" data-target="#registAdmin">
	                	계정 추가
	                </button>
	                
	                <!-- Modal -->
	                      <div class="modal fade" id="registAdmin"
	                      tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                      	<div class="modal-dialog" role="document">
	                      		<div class="modal-content">
	                      			
	                      			<div class="modal-header">
				                      <h5 class="modal-title" id="staticBackdropLabel"> 관리자 계정 추가 </h5>
				                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                      <span aria-hidden="true">&times;</span>
				                      </button>
				                    </div>
				                      
				                      <div class="modal-body">
				                      	<form role="form" action="/adminRegist.mdo" method="POST">
				                      		<div class="form-group">
				                      	

				                      			<!-- 추가할 계정의 아이디, 이름, 타입 -->
				                      			<label for="authority"><span class="auth"></span>권한 지정</label>
				                      			<select class="form-control" name="adminAuthority" id="authority">
				                      				<option value="1">SUB-ROOT</option>
				                      				<option value="2">SUB ADMIN</option>
				                      			</select>
												<!-- <input type="text" class="form-control" id="reportUserType" /> -->

												<!-- 아이디 -->
				                      			<label for="id"><span class="ai"></span>아이디</label>
				                      			<input type="text" class="form-control"
				                      			id="id" name="adminId"/>
				                      		
				                      			<!-- 비밀번호 -->
				                      			<label for="pw"><span class="ap"></span>비밀번호</label>
				                      			<input type="password" class="form-control"
				                      			id="pw" name="adminPw" />
				                      		
				                      			<!-- 사용자 이름 -->
				                      			<label for="name"><span class="an"></span>이름</label>
				                      			<input type="text" class="form-control"
				                      			id="name" name="adminName"/>
				                      		
				                      			<!-- 이메일 -->
				                      			<label for="email"><span class="ae"></span>이메일</label>
				                      			<input type="text" class="form-control"
				                      			id="email" name="adminEmail"/>
				                      			
				                      			<!-- 연락처 -->
				                      			<label for="tel"><span class="at"></span>연락처</label>
				                      			<input type="text" class="form-control"
				                      			id="tel" name="adminTel"/>
				                      			
				                      			
				                      		</div>
				                      		
										<div class="modal-footer">
				                      
				                      <!-- 등록버튼 -->
				                      <input type="submit" class="btn btn-primary" id="sendRegist" value="등록"/>
				                      <button type="button" class="btn btn-secondary" data-dismiss="modal">
				                      	닫기
				                      </button>
				
	                      			</div>
				                     </form>				                      	
				                      </div>
	                      		</div>
	                      	</div>
	                      </div>
	                      <!-- modal 끝 -->
	        	 </div>
              
              <div class="card-body">
<!-- 	              <select class="dataTable-selector">
	              	<option>전체 회원 보기</option>
	              	<option>게스트만 보기</option>
 	              	<option>호스트만 보기</option>
 	              </select> -->
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                    	<th>계정권한</th> <!-- adminAuthority -->
                    	<th>관리자번호</th> <!-- adminNum -->
                        <th>아이디</th> <!-- adminId -->
                        <th>이메일</th> <!-- adminEmail -->
                        <th>연락처</th> <!-- adminTel -->
                    </tr>
                  </thead>

				<tbody>
                  <c:forEach var="root" items="${adminList}">
                    <tr>
                    	<td id="authority">
                    		<c:if test="${root.adminAuthority eq '0'}">
	                      	ROOT
	                      	</c:if>
	                      	<c:if test="${root.adminAuthority eq '1'}">
	                      	SUB-ROOT
	                      	</c:if>
	                      	<c:if test="${root.adminAuthority eq '2'}">
	                      	SUB
	                      	</c:if>
                     	</td>
                    
                      <td>${root.adminNum }</td>
                      <td>${root.adminId  }</td>
                      <td>${root.adminEmail }</td>
                      <td>${root.adminTel }</td>
                      
                      <!-- <td>
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
                      </td> -->
                      
                    </tr>
                  </c:forEach>
				</tbody>
               </table>
                
              </div>
            </div>
            <!-- DataTable 끝 -->
            
          </div>
        </main>
       
       <!-- delete -->
<!--        <form id = "submitForm" method="POST" action="/deleteMember.mdo" hidden="hidden"> -->
<!--        	<input type="hidden" id="deleteUserHidden" name="deleteUserId"> -->
<!--        </form> -->
       
<!--        <form id="submitForm2" method="POST" action="/disableMember.mdo" hidden="hidden"> -->
<!--        	<input type="hidden" id="disableUserHidden" name="disableUserId"> -->
<!--        </form> -->
       
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
	$(document).on("click","#regist",function()
			{
				var myModal = new bootstrap.Modal(document.getElementById('registAdmin'));
			  	myModal.show();
			});
	</script>
		
  </body>
</html>