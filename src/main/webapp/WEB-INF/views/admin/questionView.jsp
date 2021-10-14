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
    <title>문의사항 확인/답변 페이지</title>
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
    
    <script>
    $(document).on("click","#sendResponse",function()
	{
		alert("작성한 답변이 이메일로 전송되었습니다.");
	});
	</script>
    
  </head>
  <body class="sb-nav-fixed">
    <%@ include file="adminNavigation.jsp" %>
    
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">문의사항 확인</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/home.mdo">Admin Home</a>
              </li>
              <li class="breadcrumb-item active">Question and Answer</li>
            </ol>
            <div class="card mb-4">
              <div class="card-body">
                
                문의사항을 확인하고 답변하는 곳입니다.
                <!-- <a target="_blank" href="https://datatables.net/"
                  >official DataTables documentation</a
                > -->
                
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
                  <thead>
                    <tr style="background: rgba(231,231,231,0.4)">
                        <th style="text-align:center">상태</th>
                        <th style="text-align:center">문의번호</th>
                        <th style="text-align:center">예약번호</th>
                        <th style="text-align:center">유저유형</th>
                        <th style="text-align:center">아이디</th>
                        <th style="text-align:center">이메일</th>
                        <th style="text-align:center">문의 내용</th>
                        <th style="text-align:center">답변</th>
                    </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="que" items="${queList}">
                    <tr>
                      <td>
                      	<c:if test="${que.reprtDoneYn eq 'Y' }">
                      		완료
                      	</c:if>
                      	<c:if test="${que.reprtDoneYn eq 'N' }">
                      		대기
                      	</c:if>
                      </td>
                      <td>${que.reprtSeq}</td>
                      <td>${que.rsvNum}</td>
                      <td><c:if test="${que.userType eq '0' }">게스트</c:if><c:if test="${que.userType eq '1' }">호스트</c:if>
                      </td>
                      <td>${que.userId }</td>
                      <td>${que.userEmail }</td>
                      <td>${que.reprtContent }</td>
                      <td align="center">
	                      <button type="button" class="btn btn-primary" id="response_btn"
	                      data-toggle="modal" data-target="responseModal"
	                      style="font-size: 10px;">
	                      	답변
	                      </button>
	                      
	                      <!-- Modal -->
	                      <div class="modal fade" id="responseModal" style="text-align:left"
	                      tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                      	<div class="modal-dialog" role="document">
	                      		<div class="modal-content">
	                      			
	                      			<div class="modal-header">
				                      <h5 class="modal-title" id="staticBackdropLabel"> 이메일 답변하기 </h5>
				                    </div>
				                      
				                      <div class="modal-body">
				                      	<form role="form" action="/sendQuestion.mdo" method="POST">
				                      		<div class="form-group">

				                      			<!-- user 아이디, 이름, 타입 -->
				                      			<label for="reportUserType"><span class="ut"></span>유저 타입</label>
				                      			<input type="text" class="form-control" id="reportUserType" />

				                      			<label for="reportUserId"><span class="ui"></span>아이디</label>
				                      			<input type="text" class="form-control"
				                      			id="reportUserId" name="userId"/>
				                      		
				                      			<!-- 이메일 -->
				                      			<label for="reportUserEmail"><span class="ue"></span>받을 이메일</label>
				                      			<input type="text" class="form-control"
				                      			id="reportUserEmail" name="userEmail" />
				                      			
				                      			<!-- 예약 번호 -->
				                      			<label for="reportRsvNum"><span class="rn"></span>예약번호/장소번호</label>
				                      			<input type="text" class="form-control"
				                      			id="reportRsvNum" name="rsvNum"/>
				                      			
				                      			<!-- 회신할 이메일 내용 -->
				                      			<label for="emailContent"><span class="cont"></span>회신할 이메일 내용</label>
				                      			<textarea class="form-control" id="emailContent" name="repliedContent"></textarea>
				                      			
				                      			<!-- 문의내용, 이메일에 같이 포함해서 보내야해서 hidden -->
				                      			<input type="text" id="reportquestion" name="question" hidden="hidden"/>
				                      			<input type="text" id="reportNum" name="reportSeq" hidden="hidden" />
				                      			
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
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
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