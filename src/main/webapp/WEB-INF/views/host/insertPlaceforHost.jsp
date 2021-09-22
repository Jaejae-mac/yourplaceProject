<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Tables - SB Admin</title>
        <link
          href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
          rel="stylesheet"
        />
     <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
        <script
          src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
          crossorigin="anonymous"
        ></script>
      </head>
      <body class="sb-nav-fixed">
     <%@include file="hostnav.jsp" %>
          <div id="layoutSidenav_content">
            <main>
              <div class="container-fluid px-4">
                <h1 class="mt-4">장소 등록</h1>
        
                <div class="card mb-4">
                  <div class="card-body">
                    
               사용자에게 제공할 장소를 등록할 수있습니다.
                    
                  </div>
                </div>
                <div class="card mb-4">
                  <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                장소 등록
                  </div>
                  <div class="card-body">
                    <table id="datatablesSimple">
                      <thead>
                        <tr>
                            <th>장소 번호</th>
                            <th>장소 이름</th>
                            <th>시간당 대여금액</th>
                            <th>기본 인원</th>
                        </tr>
                      </thead>
                      <tfoot>
                      </tfoot>
                      <tbody>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td align="left">
    
                           
                          </td>
    
                          <td> <button type="button" class="btn btn-primary" style="font-size: 10px;margin-left: 10px;">등록</button></td>
                        </tr>
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
                  <div class="text-muted">Copyright &copy; YourPlace</div>
                  <div>
            
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
	<script src="<c:url value="/resources/host/js/scripts.js" />"></script>
        <script
          src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
          crossorigin="anonymous"
        ></script>
	<script src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
      </body>
    </html>
    