<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>환불 처리 및 조회</title>
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
          <div class="container-fluid px-4">
            <h1 class="mt-4">환불 내역 확인 페이지</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Refund Management</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                환불 내역을 조회하고, 쿠폰을 재발급하는 페이지입니다.
              </br>

              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                환불 내역 확인 페이지
              </div>
              <div class="card-body">
                <table id="datatablesSimple">

                  <thead>
                    <tr>
                      <th>환불상태</th> <!-- 0 -->
                      <th>주문번호</th> <!-- 1 -->
                      <th>승인번호</th>
                      <th>회원번호</th>
                      <th>환불금액</th> <!-- 5 -->
                      <th>환불사유</th>
                      <th>환불일자</th>
                      <th>사용한 쿠폰</th> <!-- 6 -->
                      <th>처리</th>
                    </tr>
                  </thead>
                  
                  <tbody>
					<c:forEach var="refund" items="${refundList }">
					
                    <tr>
                      <td> <!-- 0 -->
	                      	<c:if test="${refund.rsvRefundYn eq 1}">
	                      		<font color="orange">환불 진행중</font>
	                      	</c:if>
	                      	<c:if test="${refund.rsvRefundYn eq 2}">
	                      		<font color="green">환불 완료</font>
	                      	</c:if>
	                      	<c:if test="${refund.rsvRefundYn eq 3}">
	                      		<font color="red">호스트에 의한 환불</font>
	                      	</c:if>
	                  </td>
                      
                      <td>${refund.orderNum }</td>
                      <td>${refund.payNum }</td>
                      <td>${refund.userNum }</td>
                      
                      <td>

                      <c:if test="${refund.rsvRefundYn < 2}"> <!-- 환불전 -->
                      	${refund.invBfTax }
                      </c:if>
                      
                      <c:if test="${refund.rsvRefundYn > 1}"> <!-- 환불후 -->
                      	${refund.refundCost }
                      </c:if>
                      
                      </td>
                      
                      <td>${refund.rsvRefundReason }</td>
                      <td><fmt:formatDate value="${refund.refundDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                      <td>${refund.payCoupNum }(${refund.coupDisRate }%)</td>
                   
                      <td>

                      <c:if test="${refund.rsvRefundYn < 2}">
                      <!-- 버튼 누르면 쿠폰 다시 입력 + rsvRefundYn 상태 2로 변경 + 메일 발송 -->
                      	  <button type="button"
	                      class="btn btn-danger"
	                      style="font-size: 10px; margin-left: 10px;" id="refund_btn"> 
	                      	환불 처리
	                      </button>
                      </c:if>
                      
                      <c:if test="${refund.rsvRefundYn > 1}">
                      	완료
                      </c:if>
                      
                      </td>
                      
                    </tr>
                    
                    </c:forEach>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </main>
        
        <form id="submitForm" method="POST" action="/refundProcess.mdo" hidden="hidden">
       	<input type="hidden" id="refundOrderNumHidden" name="refudnNumName">
       </form>
        
        
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
    
    <script>

		$(document).on("click","#refund_btn",function()
		{
// 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var status = td.eq(0).text();
			var order = td.eq(1).text();
			var payno = td.eq(2).text();
			var userno = td.eq(3).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			alert("order Number" + order);
			
			$("#refundOrderNumHidden").val(order);
			$("#submitForm").submit();
			
		});
		
	</script>
    
  </body>
</html>
