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
    <title>예약 현황 조회</title>
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
    <%@ include file="adminNavigation.jsp" %>

      <div id="layoutSidenav_content">
        <main>
        <form action="/spaceallow.mdo" method="POST">
          <div class="container-fluid px-4">
            <h1 class="mt-4">예약 조회 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="index.html"> 메인으로 </a>
              </li>
              <li class="breadcrumb-item active">Tables</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                예약된 내역을 전체 조회할 수 있는 페이지입니다.
              </br>

              </br>

              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                예약 페이지 조회
              </div>
              <div class="card-body">
                <table id="datatablesSimple">

                  <thead>
                    <tr>
                      <th>예약상태</th> <!-- 0 -->
                      <th>예약번호</th> <!-- 1 -->
                      <th>장소번호</th> <!-- 2 -->
                      <th>호스트 아이디</th> <!-- 3 -->
                      <th>예약자 아이디</th> <!-- 4 -->
                      <th>예약자 이름</th>
                      <th>예약자 연락처</th> <!-- 5 -->
                      <th>장소이용일</th> <!-- 6 -->
                      <th>사용목적</th> <!-- 7 -->
                      
                    </tr>
                  </thead>
                  
                  <tbody>
					<c:forEach var="rsv" items="${reserveList }">
					
                    <tr>
                      <td> <!-- 0 -->
                      		<c:if test="${rsv.rsvRefundYn eq '0'}">
	                      		정상예약
	                      	</c:if>
	                      	<c:if test="${rsv.rsvRefundYn eq '1'}">
	                      		환불 진행중
	                      	</c:if>
	                      	<c:if test="${rsv.rsvRefundYn eq '2'}">
	                      		환불 완료
	                      	</c:if>
	                      	<c:if test="${rsv.rsvRefundYn eq '3'}">
	                      		호스트에 의한 환불
	                      	</c:if>
	                  </td>
                      <td>${rsv.rsvNum }</td> <!-- 1 -->
                      <td>${rsv.placeNum }</td> <!-- 2 -->
                      <td>${rsv.userId }</td> <!-- 3 호스트 아이디 -->
                      <td>${rsv.userNum }</td> <!-- 4 예약자(께스트)아이디 -->
                      <td>${rsv.rsvName }</td>
                      <td>${rsv.rsvTel }</td> <!-- 5 -->
                      <td>${rsv.rsvYear}년 ${rsv.rsvMonth}월 ${rsv.rsvDate}일</td> <!-- 6 -->
                      <td>${rsv.rsvPurpose }</td> <!-- 7 -->
                      
                    </tr>
                    
                    </c:forEach>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
          </form>
        </main>
        
        
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
    
  </body>
</html>
