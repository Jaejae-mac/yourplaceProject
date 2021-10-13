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
<script src="/resources/css/admin/js/bootstrap-datepicker.js"></script>
<script src="/resources/css/admin/js/bootstrap-datepicker.ko.min.js"></script>

<script>
    $(document).on("click","#regist",function()
	{
		alert("게스트 공지사항이 정상적으로 추가되었습니다.");
	});
</script>

<!--Boot Strap Date picker end-->
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
      
      
      <div id="layoutSidenav_content">
      <form action="/infoGuestRegist.mdo" method="POST">
        <main>
          <div class="container-fluid px-4">
           
           
           
            <h1 class="mt-4">공지사항 추가등록 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Add Information(Guest)</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                	공지사항을 등록할 수 있는 페이지입니다.
              </div>
            </div>
            <div class="card-header">
              <b>공지사항 추가등록</b>
            </div>
            
            <div>
              <table class="table table-bordered">
                <tbody>
                
                <tr>
                  <th scope="col" style="background: rgba(231,231,231,0.4)">카테고리</th>
                  <td>
                  	<select name="infoGueCate">
                  		<option value="0">게스트 가입</option>
                  		<option value="1">예약 </option>
                  		<option value="2">예약 확정</option>
                  		<option value="3">예약 취소</option>
                  		<option value="4">예약 진행</option>
                  		<option value="5">추가 결제</option>
                  		<option value="6">이용 요금</option>
                  	</select>
                  <!-- <input type="text" id="infoGueCate" name="infoGueCate" size="40"> -->
                  </td>
                </tr>
                
                <tr>
                  <th scope="col" style="background: rgba(231,231,231,0.4)">공지사항 제목</th>
                  <td><input type="text" id="infoTitle" name="infoGueTitle" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col" style="background: rgba(231,231,231,0.4)">공지사항 내용</th>
                  <td><textarea id="infoContent" name="infoGueContent" style="width:410px; height:100px;"> </textarea></td>
                </tr>
              
              </tbody>
              </table>
              
              
              <div class="promotion-coupon-regist">
                
                <td>
	                <button type="button" class="btn btn-danger" style="font-size: 10px;margin-left: 10px;"
	                onclick="location='infoGuest.mdo'">
	                	취소
	                </button>
                </td>
                
                
                <td>
	                <input type="submit" class="btn btn-primary" value="등록하기"
	                id="regist" style="font-size: 10px;margin-left: 10px;" />
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

	<script>
	
	 $("#regist").click(function(){
		 
		    if($.trim($("#infoTitle").val())==''){
		      alert("공지사항 제목을 입력해 주세요.");
		      return false;
		    }
		    
		    if($.trim($("#infoContent").val())==''){
			      alert("공지사항 내용을 입력해주세요.");
			      return false;
			   }
		    
		    $("#regist").submit();
		    
		  });
	

	</script>

  </body>
</html>

