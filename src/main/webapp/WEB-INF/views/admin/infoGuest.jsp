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
    <title>게스트 공지사항</title>
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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Tables</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html">메인으로</a>
              </li>
              <li class="breadcrumb-item active">Tables</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
                test
                <!-- <a target="_blank" href="https://datatables.net/"
                  >official DataTables documentation</a
                > -->
                
              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                공지사항 관리 - 게스트
              </div>
              <div class="promotion-coupon">
                <td><button type="button" class="btn btn-primary" style="font-size: 10px;margin-left: 10px;"
                  onclick="location='infoGuestRegist.mdo'">공지사항 추가</button></td>
              </div>
              <div class="clear"></div>
              
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>삭제</th>
                        
                    </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="faq" items="${infoGuestList}">
                    <tr>
                      <td>
                      	<c:if test="${faq.infoGueCate eq '0' }">
                      		게스트 가입
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '1' }">
                      		예약
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '2' }">
                      		예약 확정
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '3' }">
                      		예약 취소
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '4' }">
                      		예약 진행
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '5' }">
                      		추가 결제
                      	</c:if>
                      	<c:if test="${faq.infoGueCate eq '6' }">
                      		이용 요금
                      	</c:if>
                      </td>
                      <td>${faq.infoGueTitle}</td>
                      <td>${faq.infoGueContent}</td>
                      <td>
	                      <button type="button" class="btn btn-danger" id="delete_btn"
	                      style="font-size: 10px;margin-left: 10px;">
	                      	삭제
	                      </button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </main>
        
        <!-- delete -->
       <form id = "submitForm" method="POST" action="/deleteInfoGue.mdo" hidden="hidden">
       	<input type="hidden" id="deleteInfoHidden" name="deleteInfoTitle">
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
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/scripts.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/datatables-simple-demo.js"></script>
    

    <!-- 공지사항 수정 -->
    <script>

		$(document).on("click","#delete_btn",function()
		{
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var cate = td.eq(0).text();
			var title = td.eq(1).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("공지사항 text : " + title);
		
			$("#deleteInfoHidden").val(title);
			$("#submitForm").submit();
			
		});
		
	</script>
    
  </body>
</html>