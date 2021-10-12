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
    <title>쿠폰 관리</title>
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

     
  <!-- ///////////////// -->
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
      <form action="/couponView.mdo" method="POST">
        <main>

        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Tables</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Coupon View</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
		                쿠폰 발송과 조회가 가능한 페이지입니다.
                <!-- <a target="_blank" href="https://datatables.net/"
                  >official DataTables documentation</a
                > -->
              </div>
            </div>
            <!-- 테이블 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                쿠폰 관리
              </div>
              <div class="promotion-coupon">
              
                <td>
	                <button type="button" id="coup_regist_form" name="coup_regist_form" class="btn btn-primary"
	                style="font-size: 10px;margin-left: 10px;" onclick="location='couponRegist.mdo'">
	                	쿠폰 등록
	                </button>
	                <button type="button" id="coup_send_form" name="coup_send_form" class="btn btn-primary"
	                style="font-size: 10px;margin-left: 10px;" onclick="location='couponSend.mdo'">
	                	쿠폰 전송
	                </button>
                </td>
                <td>
	                <button type="button" class="btn btn-danger" onclick="deleteall()"
	                style="font-size: 10px;margin-left: 10px;" id="alldelete" name="alldel">
	                	기한만료쿠폰 전체삭제
	                </button>
                </td>
                
              </div>
              <div class="clear"></div>
              
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                    	<th style="width:100px">전송</th>
                        <th>쿠폰코드</th>
                        <th>쿠폰명</th>
                        <th>할인율</th>
                        <th>쿠폰시작일</th>
                        <th>쿠폰만료일</th>
                        <th>쿠폰삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="cp" items="${couponList }">
                    <tr>
                      <td style="width:100px"><input type="checkbox" name="coup_check" value="coup_check" /></td>
                      <td>${cp.coupNum }</td>
                      <td>${cp.coupName }</td>
                      <td>${cp.coupDisRate }%</td>
                      <td><fmt:formatDate value="${cp.coupStartD }" pattern="yyyy-MM-dd" /></td>
                      <td><fmt:formatDate value="${cp.coupEndD }" pattern="yyyy-MM-dd" /></td>
                      <td><button type="button" class="btn btn-danger"
                      style="font-size: 10px;margin-left: 10px;" id="delete_btn">
                      	Delete
                      </button></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 테이블 끝 -->
          </div>
        </main>
        </form>
      	
        
        <!-- delete -->
       <form id="submitForm" method="POST" action="/deleteCoupon.mdo" hidden="hidden">
       	<input type="hidden" id="deleteCoupHidden" name="deleteCoupName">
       	<input type="hidden" id="deleteNumHidden" name="deleteCoupNum">
       </form>
       
       <form id="submitForm2" method="POST" action="/couponSend.mdo" hidden="hidden">
       	<input type="hidden" id="coup_num" name="numCoup" >
       	<input type="hidden" id="start_date" name="startD" >
       	<input type="hidden" id="end_date" name="endD" >
       </form>
       
       <form id="submitForm3" method="POST" action="/alldelete.mdo" hidden="hidden">
       </form>
        
        
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

		$(document).on("click","#delete_btn",function()
		{
// 			console.log('삭제버튼 클릭');
			
			var tdArr = new Array();
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var send = td.eq(0).text();
			var no = td.eq(1).text();
			var name = td.eq(2).text();
			
			td.each(function(i)
			{
				tdArr.push(td.eq(i).text());
			});
			
			console.log("쿠폰이름 text : " + name);
		
			var result = confirm("쿠폰을 삭제하시겠습니까?");
			
			if(result)
			{
				$("#deleteCoupHidden").val(no);
				$("#deleteNumHidden").val(no);
				$("#submitForm").submit();
				
				alert("삭제되었습니다.")
			}
			else
			{
				
			}
			
			
		});
		
	</script>
	
	<script>
	    function coup_Regist() {
	      $("#coup_regist_form").attr("action", "/couponRegist.mdo").submit();
	   }
    </script>
    
    <script>
	   $(document).on("click","#coup_send_form",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=coup_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var name = td.eq(2).text();
					var rate = td.eq(3).text();
					var start = td.eq(4).text();
					var end = td.eq(5).text();
					
					tdAr.push(no); //0
					tdAr.push(name); //1
					tdAr.push(start); //2
					tdAr.push(end); //3
					
					rowNo.push(no);
					
					console.log("each 문 안에서 돌리는 쿠폰 이름= " + name)
					console.log("each 문 안에서 돌려지는 쿠폰 번호= " + no)
					
		    	});

		   	console.log("체크된 쿠폰 번호= " + tdAr[0]);
		   	console.log("체크된 쿠폰 이름= " + tdAr[1]);
		   	console.log("체크된 쿠폰 시작일= " + tdAr[2]);
		   	console.log("체크된 쿠폰 종료일= " + tdAr[3]);
		   	
		   	console.log("체크된 쿠폰 이름(배열)= " + rowNo);
		   	console.log("체크된 쿠폰 이름(배열)= " + rowNo[0]);
		   	console.log("체크된 쿠폰 이름(배열)= " + rowNo[1]);
		   	
		   	$("#coup_num").val(tdAr[0]); //tdAr[1]=name값을 담고 있는 배열객체
		   	$("#start_date").val(tdAr[2]);
		   	$("#end_date").val(tdAr[3]);
		   	
		   	var result = confirm("선택한 쿠폰을 전송하시겠습니까?")
		   	
		   	if(result)
		   	{
		   		alert("전송이 완료되었습니다.")
		   		$("#submitForm2").submit();
		   		
		   	}else
		   	{
		   		alert("선택한 쿠폰이 없습니다.")	
		   	}
		   	
		   	
		    
		});
		    
    </script>
    
    <script>
    $(document).on("click","#alldelete",function(){
    	
    	var result = confirm("기한만료된 쿠폰을 일괄 삭제하시겠습니까?")
    	
    	if(result)
		   	{
    			$("#submitForm3").submit();
		   		alert("삭제가 완료되었습니다.")
		   	}else
		   	{
		   		alert("취소되었습니다.")	
		   	}
    	
    });
    </script>
	
	
  </body>
</html>
