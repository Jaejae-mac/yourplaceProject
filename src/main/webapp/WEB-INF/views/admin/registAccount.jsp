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
    <title>관리자 계정 추가</title>

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
<script src="/resources/css/admin/js/bootstrap-datepicker.js"></script>
<script src="/resources/css/admin/js/bootstrap-datepicker.ko.min.js"></script>

<script>
    $(document).on("click","#regist",function()
	{
		alert("관리자가 추가되었습니다.");
	});
</script>

<!--Boot Strap Date picker end-->
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
      
      
      <div id="layoutSidenav_content">
      <form action="/registAccount.mdo" method="POST">
        <main>
          <div class="container-fluid px-4">
 
 
            <h1 class="mt-4">관리자 추가 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">관리자 추가</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                blank
                
              </div>
            </div>
            <div class="card-header">
              <b>관리자 추가 (root account)</b>
            </div>
            
            <div>
              <table class="table table-bordered">
                <tbody>
                
                <tr>
                  <th scope="col">권한</th>
                  <td>
                  	<select name="adminAuthority">
                  		<option value="1">root</option>
                  		<option value="2">admin</option>
                  	</select>
                  <!-- <input type="text" id="infoGueCate" name="infoGueCate" size="40"> -->
                  </td>
                </tr>
                
                <tr>
                  <th scope="col">아이디</th>
                  <td><input type="text" id="id" name="adminId" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">비밀번호</th>
                  <td><input type="password" id="pw" name="adminPw" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">이메일</th>
                  <td><input type="text" id="email" name="adminEmail" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">사용자 이름</th>
                  <td><input type="text" id="name" name="adminName" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">연락처</th>
                  <td><input type="text" id="tel" name="adminTel" size="40"></td>
                </tr>
              
              </tbody>
              </table>
              
              
              <div class="promotion-coupon-regist">
                
                <td>
	                <button type="button" class="btn btn-danger" style="font-size: 10px;margin-left: 10px;"
	                onclick="location='registAccount.mdo'">
	                	취소
	                </button>
                </td>
                
                
                <td>
	                <input type="submit" class="btn btn-primary" id="regist" style="font-size: 10px;margin-left: 10px;" />
                </td>
              
              </div>
              
              </form>
              
              <div class="clear"></div>
            </div>
          </div>
        </main>
        
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

