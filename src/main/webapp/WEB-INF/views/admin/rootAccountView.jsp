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
  
  </head>
  
  <body class="sb-nav-fixed">
  
	<c:set var="authority" scope="session" value="${AdminAuthority }"/>

    <%@ include file="adminNavigation.jsp" %>

      <!-- 회원관리 테이블 시작 -->
      
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">관리자 계정 관리</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Admin Account Management</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                	관리자 계정을 조회할 수 있는 페이지입니다. </br>
                	Root 계정의 생성은 반드시 0번 ROOT 계정을 통해 생성하시기 바랍니다.
              </div>
            </div>
            
            <!-- DataTable 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	관리자 계정 조회
              </div>
              
           <c:choose>   
			<c:when test="${authority eq 0}">
              <!-- 계정 추가 및 Modal -->
              <div class="promotion-coupon" style="padding-top: 10px">
              
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
				                      
				                    </div>
				                      
				                      <div class="modal-body">
				                      	<form role="form" action="/adminRegist.mdo" method="POST">
				                      		<div class="form-group">

				                      			<!-- 추가할 계정의 아이디, 이름, 타입 -->
				                      			<label for="authority"><span class="auth"></span>권한 지정</label>
				                      			<select class="form-control" name="adminAuthority" id="authority">
				                      				<option value="1">SUB-ROOT</option>
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
				                      
				
	                      			</div>
				                     </form>				                      	
				                      </div>
	                      		</div>
	                      	</div>
	                      </div>
	                      <!-- modal 끝 -->
	        	 </div>
	        
              </c:when>

		          <c:when test="${authority ne 0}">
		          </c:when>
		          
		          <c:otherwise></c:otherwise>
		          
	       </c:choose>
	          
              <div class="card-body">

                <table id="datatablesSimple">
                  <thead>
                    <tr>
                    	<th style="text-align:center">계정권한</th> <!-- adminAuthority -->
                    	<th style="text-align:center">관리자번호</th> <!-- adminNum -->
                        <th style="text-align:center">아이디</th> <!-- adminId -->
                        <th style="text-align:center">이메일</th> <!-- adminEmail -->
                        <th style="text-align:center">연락처</th> <!-- adminTel -->
                        <th style="text-align:center">삭제</th>
	                        
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
                      
	                      <td style="width:120px"><button type="button"
		                      class="btn btn-danger"
		                      style="font-size: 10px; margin-left: 10px; " id="delete_btn"> 
		                      	계정 삭제
		                      </button></td>
	                      
                    </tr>
                  </c:forEach>
				</tbody>
               </table>
                
              </div>
            </div>
            <!-- DataTable 끝 -->
            
          </div>
        </main>
       
<!--        delete -->
       <form id = "submitForm" method="POST" action="/deleteAdmin.mdo" hidden="hidden">
       	<input type="hidden" id="deleteAdminHidden" name="deleteAdmin">
       </form>
       
<!--        <form id="submitForm2" method="POST" action="/disableMember.mdo" hidden="hidden"> -->
<!--        	<input type="hidden" id="disableUserHidden" name="disableUserId"> -->
<!--        </form> -->
       
        
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
	
	<script>
	
	 $("#sendRegist").click(function(){
		 
		    if($.trim($("#id").val())==''){
		      alert("아이디를 입력해 주세요.");
		      return false;
		    }
		    
		    if($.trim($("#pw").val())==''){
			      alert("비밀번호를 입력해 주세요.");
			      return false;
			   }
		    
		    if($.trim($("#name").val())==''){
			      alert("관리자 이름을 입력해 주세요.");
			      return false;
			   }
		    
		    if($.trim($("#email").val())==''){
			      alert("이메일을 입력해 주세요.");
			      return false;
			   } 
		    
		    if($.trim($("#tel").val())==''){
			      alert("연락처를 입력해 주세요.");
			      return false;
			   } 
		    
		    $("#sendRegist").submit();
		    
		    alert("입력하신 정보가 관리자 계정으로 등록되었습니다.")
		    
		  });
	

	</script>
	
    <script>

		$(document).on("click","#delete_btn",function()
		{
// 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var authority = td.eq(0).text();
			var adminno = td.eq(1).text();

			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			
			var result = confirm("해당 관리자 계정을 삭제하시겠습니까?")
			
			if(result)
				{
					$("#deleteAdminHidden").val(adminno);
					$("#submitForm").submit();
					alert("계정이 삭제 처리되었습니다.")
				} else {
					alert("취소되었습니다.")
				}
			
			
		});
		
	</script>	
  </body>
</html>