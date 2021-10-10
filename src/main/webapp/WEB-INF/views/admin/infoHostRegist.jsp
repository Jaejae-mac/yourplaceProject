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

<script>
    $(document).on("click","#regist",function()
	{
		alert("호스트 공지사항이 정상적으로 추가되었습니다.");
	});
</script>

<!--Boot Strap Date picker end-->
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
      
      
      <div id="layoutSidenav_content">
      <form action="/infoHostRegist.mdo" method="POST">
        <main>
          <div class="container-fluid px-4">
           
           
           
            <h1 class="mt-4">공지사항 추가등록 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">공지사항 등록</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                blank
                
              </div>
            </div>
            <div class="card-header">
              <b>공지사항 추가등록</b>
            </div>
            
            <div>
              <table class="table table-bordered">
                <tbody>
                
                <tr>
                  <th scope="col">카테고리</th>
                  <td>
                  	<select name="infoHostCate">

                  		<option value="0">호스트 지원</option>
                  		<option value="1">장소 등록</option>
                  		<option value="2">입금 계좌 설정</option>
                  		<option value="3">예약</option>
                  		<option value="4">예약 진행</option>
                  		<option value="5">파손 및 배상</option>
                  		<option value="6">추가 청구</option>
                  		<option value="7">대금 지급</option>
                  		<option value="8">이용 요금</option>

                  	</select>
                  
                  </td>
                </tr>
                
                <tr>
                  <th scope="col">공지사항 제목</th>
                  <td><input type="text" id="infoTitle" name="infoHostTitle" size="40"></td>
                </tr>
                
                <tr>
                  <th scope="col">공지사항 내용</th>
                  <td><textarea id="infoContent" name="infoHostContent" style="width:410px; height:100px;"> </textarea></td>
                </tr>
              
              </tbody>
              </table>
              
              
              <div class="promotion-coupon-regist">
                
                <td>
	                <button type="button" class="btn btn-danger" style="font-size: 10px;margin-left: 10px;"
	                onclick="location='infoHost.mdo'">
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

