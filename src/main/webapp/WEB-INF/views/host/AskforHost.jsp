<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>


<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>고객문의</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
     <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css"
    />
    <link
      href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
      rel="stylesheet"
    />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>
    
  </head>
  <body class="sb-nav-fixed">
   <%@include file="hostnav.jsp" %>

        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">고객 문의</h1>
              <div class="card mb-4">
                <div class="card-body">
                문의사항을 남겨주시면 추후에 메일로 답신 드리겠습니다.
                </div>
              </div>
              <div class="card mb-4">
                <div class="card-header">
  

                   <table id="datatablesSimple">
                      <thead>
                        <tr>
                          
                            <th>번호</th>
                      
                            <th>문의 내역</th>
                            <th>처리 여부</th>
                        </tr>
                      </thead>
                      <tfoot>
                      </tfoot>
                      <tbody>

								<c:forEach var="ask" items="${list}" varStatus="status">
									<tr>
					
										<td>${ask.reserveNum}</td>
	
										<td>${ask.content }</td>
										<td>${ask.doneYN }</td>
								</tr>
								</c:forEach>
							




							</tbody>
                    </table>
                  </div>
                </div>
                    <button type="button" class="btn btn-primary" onclick="showPop()" style="font-size: 10px;margin-left: 10px;">문의하기</button>
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
    </div>
	<script>
	
		
		function showPop() {
			 
			window.name="AskforHost.hdo"
		    var width = '430';
		    var height = '560';
		 
		    var left = Math.ceil(( window.screen.width - width )/2);
		    var top = Math.ceil(( window.screen.height - height )/2); 
		 
		    window.open('/AskPopup.hdo', '문의하기', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
		   
		}

	</script>
</body>
</html>
<!-- 


  toggle : toggleReview
 -->
