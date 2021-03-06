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
    <title>Login - Yourplace Admin</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/css/styles.css"/>"/>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="bg-primary">
    <div id="layoutAuthentication">
      <div id="layoutAuthentication_content">
        <main>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-5">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                  <div class="card-header">
                    <h3 class="text-center font-weight-light my-4">
                      <img src="<c:url value="/resources/img/logo/adminlogo.png" />"
                      style="width: 50%; cursor: pointer;">
                    </h3>
                  </div>
                  <div class="card-body">
                    <!-- 전송 시작 -->
                    <form method="POST" action="/login.mdo">
                      <div class="form-floating mb-3">
                        <input
                          class="form-control"
                          id="adminId"
                          name="adminId"
                          type="text"
                          placeholder="name@example.com"
                        />
                        <label for="inputEmail">ID</label>
                      </div>
                      <div class="form-floating mb-3">
                        <input
                          class="form-control"
                          id="adminPw"
                          name="adminPw"
                          type="password"
                          placeholder="Password"
                        />
                        <label for="inputPassword">Password</label>
                      </div>
                      
                      <div
                        class="
                          d-flex
                          align-items-center
                          justify-content-between
                          mt-4
                          mb-0
                        "
                      >
                        <a class="small" href="password.html"
                          ></a
                        >
<!--                         <a id="form_login" class="btn btn-primary" >Login</a> -->
                        <input type="submit" class="btn btn-primary"
                        id="login_guest" value="Login" onclick="login_guest_do()"/>
                      </div>
                    </form>
                  </div>
                  <div class="card-footer text-center py-3">
                    <div class="small">
                      @Team Connect
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
      <div id="layoutAuthentication_footer">
        
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="resources/css/admin/js/scripts.js"></script>

        <script>
	    function login_guest_do() {
	      $("#form_login").attr("action", "/main.mdo").submit();
	
	   }
    </script>
    
  </body>
</html>
