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
    <title>답변 목록 페이지</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/resources/css/admin/css/style-coupon.css">
    <link href="/resources/css/admin/css/styles.css" rel="stylesheet" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">답변목록 확인</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Response</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
                문의사항을 확인하고 답변하는 곳입니다.
                
              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                문의사항 관리
              </div>
<!--             <div class="promotion-coupon">
                <td><button type="button" class="btn btn-primary" style="font-size: 10px;margin-left: 10px;"
                  onclick="location='infoGuestRegist.mdo'">이메일 답변하기</button></td>
               </div> -->
              <div class="clear"></div>
              
              <div class="card-body">
                <table id="datatablesSimple">
               	
               	<colgroup>
               		<col width="20px" style="background:rgb(231,231,231,0.3)">
               		<col width="20px">
               		<col width="30px">
               		<col width="30px">
               		<col width="60px">
               		<col width="230px" style="background:rgb(231,231,231,0.3)">
               		<col width="70px">
               		<col width="10px" >
               	</colgroup>
               	
                  <thead>
                    <tr  style="background: rgba(231,231,231,0.4)">
                    	<th style="text-align:center">답변번호</th>
                        <th style="text-align:center">문의번호</th>
                        <th style="text-align:center">예약번호</th>
                        <th style="text-align:center">유저유형</th>
                        <th style="text-align:center">아이디</th>
                        <th style="text-align:center">답변내용</th>
                        <th style="text-align:center">이메일</th>
                        <th style="text-align:center">답변날짜</th>
                    </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="ans" items="${ansList}">
                    <tr>
                      <td>${ans.reprtSeqAns }</td>
                      <td>${ans.reprtSeq}</td>
                      <td>${ans.rsvNum}</td>
                      
                      <c:if test="${ans.userType eq '0' }"><td>게스트</td></c:if>
                      
                      <c:if test="${ans.userType eq '1' }"><td style="color:blue">호스트</td></c:if>
                      
                      <td>${ans.userId }</td>
                      <td>${ans.reprtContentAns }</td>
                      <td>${ans.userEmail }</td>
                      <td>${ans.regDateAns }</td>
                      
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </main>
       
        
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
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/scripts.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/datatables-simple-demo.js"></script>

	<script>
		$(document).on("click", "#sendResponse", function(){
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var yn = td.eq(0).text();
			var no = td.eq(1).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			$("updateStatus").val(no);
			$("updateForm").submit();
			
		});
	</script>

    <!-- 공지사항 수정 -->
    <script>

		$(document).on("click","#response_btn",function()
		{
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var yn = td.eq(0).text();
			var no = td.eq(1).text(); //문의번호
			var rsvnum = td.eq(2).text(); //예약번호
			var usertype = td.eq(3).text();
			var userid = td.eq(4).text();
			var useremail = td.eq(5).text();
			var report = td.eq(6).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("클릭된 문의번호 : " + no);
			console.log("클릭된 유저 아이디 : " + userid);
			console.log("클릭된 유저 이메일 : " + useremail);
			
			//BootModal V5
          	var myModal = new bootstrap.Modal(document.getElementById('responseModal'));
          	myModal.show();

          	$("#reportUserType").val(usertype);
			$("#reportUserId").val(userid);
          	$("#reportUserEmail").val(useremail);
          	$("#reportRsvNum").val(rsvnum);
          	$("#reportquestion").val(report);
          	$("#reportNum").val(no); //신고번호
          	
          	
// 			$("#deleteInfoHidden").val(title);
// 			$("#submitForm").submit();
          
		});
		
	</script>
	
    
  </body>
</html>