<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>배너 관리</title>
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
    
    <script>
	    $(document).on("click","#coup_send_form",function()
		{
			alert("선택하신 쿠폰이 정상적으로 전송되었습니다.");
		});
	</script>
	
	<script type="text/javascript">
      $(document).ready(function(){
         $("#fileInput").on('change', function(){
            if(window.FileReader){
               var filename = $(this)[0].files[0].name;
            } else {
               var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $("#userfile").val(filename);
         });
      });
   </script>
     
  <!-- ///////////////// -->
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
      <!--  <form action="/contorlBanner.mdo" method="POST">  -->

        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">배너관리</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/index-admin.mdo">메인으로</a>
              </li>
              <li class="breadcrumb-item active">Coupon</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
		                쿠폰 생성 및 조회가 가능한 페이지입니다.
                <!-- <a target="_blank" href="https://datatables.net/"
                  >official DataTables documentation</a
                > -->
              </div>
            </div>
            <!-- 테이블 시작 -->
            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-table me-1"></i>
                	배너 관리
              </div>
              <div class="promotion-coupon">
              
                <td>
                <!-- 
	                <button type="button" id="coup_regist_form" name="coup_regist_form" class="btn btn-success"
	                style="font-size: 10px;margin-left: 10px; size:13px;" onclick="">
	                	이미지 등록
	                </button>  -->
	                
	                <button type="button" class="btn btn-primary" id="file_upload_btn"
	                      data-toggle="modal" data-target="fileUploadModal"
	                      style="font-size: 10px; margin-left: 10px;">
	                      	이미지 등록
	                </button>
	                
	                <!-- Modal -->
	                      <div class="modal fade" id="fileUploadModal"
	                      tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                      	<div class="modal-dialog" role="document">
	                      		<div class="modal-content">
	                      			
	                      			<div class="modal-header">
				                      <h5 class="modal-title" id="staticBackdropLabel"> 등록할 배너 이미지 업로드 </h5>
				                      
				                    </div>
				                      
				                      <div class="modal-body">
				                      	<form role="form" action="/uploadBannerImg.mdo" method="POST">
				                      		<div class="form-group">

				                      			<!-- 이미지 업로드 시작 -->
				                      				<div class="form-group">
									                  <label for="inputSubject1"><span class="if"></span>
									                  	이미지 업로드</label>
									                  	
									                  <input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default"
									                  data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload"
									                  class="form-contol" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
									                     
									                     <div class="bootstrap-filestyle and input-group">
									                        <input type="text" id="userfile" class="form-control" name="userfile"
									                        disable="">
									                        <span class="group-span-filestyle input-group-btn" tabindex="0">
									                           <label for="fileInput" class="btn btn-default">
									                              <span class="glyphicon fa fa-upload"></span>
									                           </label>
									                        </span>
									                     </div>
									                     
									               </div>
               									<!-- 이미지 업로드 끝 -->

				                      			<!-- 문의내용, 이메일에 같이 포함해서 보내야해서 hidden -->
				                      			<!--  <input type="text" id="reportquestion" name="question" hidden="hidden"/>
				                      			<input type="text" id="reportNum" name="reportSeq" hidden="hidden" />  -->
				                      			
				                      		</div>
				                      		
										<div class="modal-footer">
				                      
				                      <!-- 전송버튼 -->
				                      <input type="submit" class="btn btn-primary" id="sendResponse" value="전송"/>
				                      <button type="button" class="btn btn-secondary" data-dismiss="modal">
				                      	닫기
				                      </button>
				
	                      			</div>
				                     </form>				                      	
				                      </div>
	                      		</div>

	                      	</div>
	                      </div>
	                      <!-- modal 끝 -->
	                
                </td>

                
              </div>
              <div class="clear"></div>
              
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
<!--                     	<th style="width:100px">전송</th> -->
                        <th>이미지번호</th>
                        <th>미리보기</th>
                        <th>등록일자</th>
<!--                         <th>파일삭제</th> -->
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="ban" items="${bannerList }">
                    <tr>
<!--                       <td style="width:100px"><input type="checkbox" name="coup_check" value="coup_check" /></td> -->
                      <td>${ban.bannerNum }</td>
                      <td>${ban.s3FileName }%</td> <!-- KEY -->
                      <td><fmt:formatDate value="${ban.fileRegDate}" pattern="yyyy-MM-dd" /></td>
                      <!--  <td><button type="button" class="btn btn-danger"
                      style="font-size: 10px;margin-left: 10px;" id="delete_btn">
                      	Delete
                      </button></td> -->
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 테이블 끝 -->
          </div>
        </main>
        <!--  </form>  -->

      	
        
        <!-- delete -->
       <form id = "submitForm" method="POST" action="/deleteCoupon.mdo" hidden="hidden">
       	<input type="hidden" id="deleteCoupHidden" name="deleteCoupName">
       </form>
       
       <form id = "submitForm2" method="POST" action="/couponSend.mdo" hidden="hidden">
       	<input type="hidden" id="sendCoupHidden" name="sendCoupName" >
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
    
	<script>
	$(document).on("click","#file_upload_btn",function()
	{
		var myModal = new bootstrap.Modal(document.getElementById('fileUploadModal'));
	  	myModal.show();
	});
	</script>
	
	<!-- <script>
	    function coup_Regist() {
	      $("#coup_regist_form").attr("action", "/couponRegist.mdo").submit();
	   }
    </script>  -->
    		
  </body>
</html>
