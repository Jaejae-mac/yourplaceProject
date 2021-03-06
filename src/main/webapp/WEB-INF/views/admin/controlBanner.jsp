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
            <h1 class="mt-4">배너 등록 관리</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/index-admin.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Banner Management</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
		                배너 등록 및 Yourplace 메인 페이지 공개여부를 관리하는 페이지입니다.
                
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
                
	                
	                <button type="button" class="btn btn-primary" id="file_upload_btn"
	                      data-toggle="modal" data-target="fileUploadModal"
	                      style="font-size: 10px; margin-left: 10px;">
	                      	이미지 등록
	                </button>
	                
	                <button type="button" class="btn btn-primary" id="file_send_btn"
	                      style="font-size: 10px; margin-left: 10px; background: rgb(0, 204, 120); border-color: rgb(0, 204, 120);">
	                      	배너로 공개
	                </button>
	                
	                <button type="button" class="btn btn-primary" id="file_disable_btn"
	                      style="font-size: 10px; margin-left: 10px; background: rgb(96, 96, 96); border-color: rgb(96, 96, 96);">
	                      	비공개 전환
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
				                      	<form action="/uploadBannerImg.mdo" method="POST" enctype="multipart/form-data">
				                      		<div class="form-group">

												<label for="url_banner"><span class="burl"></span>배너와 연결할 링크</label>
				                      			<input type="text" class="form-control" id="url_banner" name="url"/>

				                      			<!-- 이미지 업로드 시작 -->
				                      				<div class="form-group">
									                  <label for="inputSubject1"><span class="if"></span>
									                  	이미지 업로드</label>
									                  	
									                  <input type="file" multiple="multiple" name="bannerImg" id="fileInput" filestyle="" data-class-button="btn btn-default"
									                  data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" accept="image/*"
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

					<tr style="background: rgba(231,231,231,0.4)">
						<th style="width:70px; text-align:center">선택</th>
                        <th style="width:100px; text-align:center">이미지번호</th>
                        <th style="text-align:center">미리보기</th>
                        <th style="text-align:center">연결된 주소</th>
                        <th style="text-align:center">등록일자</th>
                        <th style="text-align:center">공개상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="ban" items="${bannerList }">
                    <tr>
                    
                    <c:if test="${ban.bannerShow eq '0'}">
                      <td style="width:100px; align:center;"><input type="checkbox" style="align:center;" class="ch" name="banner_check" value="banner_check" /></td>
                    </c:if>
                    
                    <c:if test="${ban.bannerShow eq '1'}">
                      <td style="width:100px; align:center;"><input type="checkbox" style="align:center;" checked=checked class="ch" name="banner_check" value="banner_check" /></td>
                    </c:if>
                    
                      <td>${ban.bannerNum }</td>
                      <td><a href="https://s3.ap-northeast-2.amazonaws.com/yourplacebuc/${ban.s3FileName }">${ban.originalFileName }</a></td> <!-- KEY -->
                      <td>${ban.bannerUrl }</td>
                      <td><fmt:formatDate value="${ban.fileRegDate}" pattern="yyyy-MM-dd" /></td>
                      
                      	<c:if test="${ban.bannerShow eq '0'}"><td>비공개</td></c:if>
                      	<c:if test="${ban.bannerShow eq '1'}"><td id="show" style="background-color: #00CC78;">공개</td></c:if>
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
       
       <form id = "submitForm2" method="POST" action="/applyBanner.mdo" hidden="hidden">
       	<input type="hidden" id="sendBannerHidden" name="sendBannerName" >
       </form>
       
       <form id = "submitForm3" method="POST" action="/nonapplyBanner.mdo" hidden="hidden">
       	<input type="hidden" id="disableBannerHidden" name="disableBannerName" >
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
  	//파일전송 시작.
    var counterFile = 0;
    var tagFile = {};
    function addTag(value) {
        tagFile[counterFile] = value;
        counterFile++; // del-btn 의 고유 id 가 된다.
    }
    
    </script>

    
	<script>
	$(document).on("click","#file_upload_btn",function()
	{
		var myModal = new bootstrap.Modal(document.getElementById('fileUploadModal'));
	  	myModal.show();
	});
	</script>
	
	<script>
	   $(document).on("click","#file_send_btn",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=banner_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var thumb = td.eq(2).text();
					
					tdAr.push(no);
					tdAr.push(thumb);
					
					rowNo.push(no);
					
					console.log("each 문 안에서 돌려지는 쿠폰 번호= " + no)
					
		    	});

		   	console.log("체크된 배너 이름= " + tdAr[0]);
		   	console.log("체크된 배너 이름(배열)= " + rowNo);
		   	
		   	alert("선택한 " + rowNo + " 번 이미지가 배너로 공개되었습니다.");
		   	
		   	$("#sendBannerHidden").val(rowNo); //tdAr[1]=name값을 담고 있는 배열객체
			$("#submitForm2").submit();
		    
		});
	
	</script>   
	   
		<script>
	   $(document).on("click","#file_disable_btn",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=banner_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var thumb = td.eq(2).text();
					
					tdAr.push(no);
					tdAr.push(thumb);
					
					rowNo.push(no);
					
		    	});

		   	console.log("체크된 배너 이름= " + tdAr[0]);
		   	console.log("체크된 배너 이름(배열)= " + rowNo);
		   	
		   	alert("선택한 " + rowNo + " 번 이미지가 비공개 처리되었습니다.");
		   	
		   	$("#disableBannerHidden").val(rowNo); //tdAr[1]=name값을 담고 있는 배열객체
			$("#submitForm3").submit();
		    
		});
	
	</script>
    		
  </body>
</html>
