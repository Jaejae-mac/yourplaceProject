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
    <title>결제 내역 조회</title>
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
            <h1 class="mt-4">결제 조회 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Payment View</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                결제완료된 내역을 전체 조회할 수 있는 페이지입니다.
              </br>

              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                결제 내역 조회
              </div>
              <div class="card-body">
                <table id="datatablesSimple">

                  <thead>
                    <tr style="background: rgba(231,231,231,0.4)">
                      <th style="text-align:center">결제상태</th> <!-- 0 payRefundYn -->
                      <th style="text-align:center">주문번호</th>
                      <th style="text-align:center">승인번호</th> <!-- 1 payNum -->
                      <th style="text-align:center">장소번호</th> <!-- 5 placeNum -->
                      <th style="text-align:center">결제일시</th> <!-- 2 payYear + payMonth + payDate -->
                      <th style="text-align:center">결제금액</th> <!-- 3 invBfTax -->
                      <th style="text-align:center">결제자 아이디</th>
                      <th style="text-align:center">결제자 이름</th> <!-- 7 rsvName -->
                      
                    </tr>
                  </thead>
                  
                  <tbody>
					<c:forEach var="pay" items="${paymentList }">
					
                    <tr>
                      <td> <!-- 0 -->
                      		<c:if test="${pay.rsvRefundYn eq '0'}">
	                      		결제 완료
	                      	</c:if>
	                      	<c:if test="${pay.rsvRefundYn eq '1'}">
	                      		<font color="orange">환불 진행중</font>
	                      	</c:if>
	                      	<c:if test="${pay.rsvRefundYn eq '2'}">
	                      		<font color="green">환불 완료</font>
	                      	</c:if>
	                      	<c:if test="${pay.rsvRefundYn eq '3'}">
	                      		<font color="red">호스트에 의한 환불</font>
	                      	</c:if>
	                  </td>
	                  <td>${pay.orderNum }</td>
                      <td>${pay.payNum }</td> <!-- 1 -->
                      <td>${pay.placeNum }</td> <!-- 5 -->
                      <td>${pay.payYear }년 ${pay.payMonth }월 ${pay.payDate }일 </td> <!-- 2 -->
                      <td>${pay.invBfTax }</td> <!-- 3 -->
                      <td>${pay.userId}</td>
                      <td>${pay.rsvName }</td> <!-- 7 -->
                      
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
