<%@page import="com.yourplace.custom.login.vo.UserVO" %>
<%@page import="com.yourplace.custom.login.dao.impl.LoginDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<title>Yourplace MyPage</title>
</head>
<body>
	
	<!-- 세션에 아이디 값이 존재 한다면 마이페이지를 불러주어라. -->
	<c:if test="${userId != null}">
		MY Page - ${userId }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<div id="main_vue" class="h_column_center" style="min-height: 1000px; margin-top: 100px">
        <div style="width: 1160px;">
            <div style="margin-top: 20px;">
                <p style="font-size: 32px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.31;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
                    게스트 프로필
                </p>
            </div>
        </div>
        <div style="margin-top: 50px; width: 100%; height: 1px; background-color: #e7eaee;"></div>
        <div class="h_row" style="margin-top: 60px; margin-bottom: 200px;">
            <div class="h_column_center" style="width: 360px;">
                <div style="width: 360px;border-radius: 10px;border: solid 1px #dfe2e7;background-color: #ffffff;">
                    <div class="h_column_center">
                        <div style="position:relative; margin-top: 50px; width: 120px; height: 120px; border-radius: 60px; overflow:hidden;">
                            <c:if test="${user.userProfileImg == null}">
                            <img src="https://s3.hourplace.co.kr/web/images/icon/elements_image_empty_guest.png"
                                style="width: 100%; height: 100%; position: absolute;">
                            </c:if>
                            <c:if test="${user.userProfileImg != null}">
                            <img src="${user.userProfileImg}"
                                style="width: 100%; height: 100%; position: absolute;">
                            </c:if>     
                        </div>
                        <p style="padding: 0 20px; margin-top: 20px; font-size: 16px; font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.38;letter-spacing: -0.1px;text-align: center;color: #1b1d1f;">
                        	${user.userNickName}
                        </p>
                    </div>
                    <div style="margin: 30px 30px 40px;">
                        <div class="h_row_center" style="height: 34px;">
                            <p style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                            	상세 정보
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	이름
                            </p>
                            <p class="h_ellipsis_1" style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	${user.userName}
                            </p>
                        </div>
                        <div class="h_row_center" style="position: relative; height: 48px;">
                            <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #72787f;">
                            	이메일
                            </p>
                            <p class="h_ellipsis_1" style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: #1b1d1f">
                            	${user.userEmail}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="h_row_center">
	                <div onclick="location.href='/gocoupon.do'" class="h_center h_hover_button"
	                    style="margin-top: 30px; margin-right: 5px; width: 141px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
	                    <p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
	                    	쿠폰
	                    </p>
	                </div>
	                <div onclick="location.href='/goreserve.do'" class="h_center h_hover_button"
	                    style="margin-top: 30px; margin-left: 5px; width: 141px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
	                    <p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
	                    	예약 내역
	                    </p>
	                </div>
                </div>
                <div class="h_row_center">
	                <div onclick="location.href='/gopagefix.do'" class="h_center h_hover_button"
	                    style="margin-top: 30px; margin-right: 5px; width: 141px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
	                    <p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
	                    	프로필 편집
	                    </p>
	                </div>
	                <div onclick="location.href='/gocheckPw.do'" class="h_center h_hover_button"
	                    style="margin-top: 30px; margin-left: 5px; width: 141px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
	                    <p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
	                    	비밀번호 변경
	                    </p>
	                </div>
	            </div>
                <p onclick="deleteUser()" class="h_hover_text" style="margin-top: 30px; text-decoration: underline; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; text-align: center; color: rgb(27, 29, 31); cursor: pointer;">
                	회원 탈퇴
                </p>
            </div>
            <div style="margin-left: 60px; width: 580px;">
                <p style="font-size: 24px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.33;letter-spacing: -0.3px;color: #1b1d1f;">
                	소개
                </p>
                <p id="Intro" style ="margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                    ${user.userIntro}
                </p>
                <div style="margin-top: 40px; height: 1px; background-color: rgb(231, 234, 238);"></div>
                <div style="margin-top: 40px;">
                    <div
                        style="position: relative; height: 34px; display: flex; flex-direction: row; align-items: center; margin-bottom: 10px;">
                        <p style="font-size: 24px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                        	호스트에게 받은 리뷰
                            <label id="reviewlength" style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 0.7; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
                            </label>
                        </p>
                        <div style="display: flex; flex-direction: row; align-items: center; position: absolute; right: 0px;">
                            <img src="<c:url value="/resources/img/icon/register/review_star.png" />"
                                style="width: 24px; height: 24px;">
                            <p id="totalstar" style="font-size: 15px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                                0.0 <!-- 해당 아이디의 평점총합 / 평점갯수 -->
                            </p>
                        </div>
                    </div>
                    <div id="reviewList">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
	<%@ include file="../footer.jsp" %>
	<!-- Footer 끝 -->
	<script>
	 $(document).ready(function(){
		if(document.getElementById('Intro').value == null){
			document.getElementById('Intro').innerHTML='안녕하세요. ${user.userNickName}입니다.'
		}else{
			document.getElementById('Intro').innerHTML = '${user.userIntro}'
		}
		reviewList();
	 });
	 function reviewList(){
		 $.ajax({
        	url:"/mypagereviewList.do",
        	type:"post",
        	dataType : "json",
        	success : function(data){
        		getreivewListCall(data);
        	}
        });
	 }
	 
	 function deleteUser(){
	    	Swal.fire({
	    		  title: '정말로 탈퇴하시겠습니까?',
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#3085d6',
	    		  cancelButtonColor: '#d33',
	    		  confirmButtonText: '네, 탈퇴하겠습니다!',
	    		  cancelButtonText: '아니오.'
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
	    		    Swal.fire({
	    		      title : '성공적으로 탈퇴되었습니다.',
	    		      text : '지금까지 YourPlace를 이용해 주셔서 감사합니다.',
	    		      icon :'success'
	    		    }).then((result) => {
	    		    	location.href='/deleteUser.do'
	    		    })
	    		  }
	    		})
	    			 
	    }
	 function getreivewListCall(data){
		 var list = data;
         var listLen = data.length;
         var star = 0;
         var res = "";
         if(listLen > 0){
        	
    		for(var i=0;i<listLen; i++){
    			var rsvNum = list[i].rsvNum;
    			var rsvId = list[i].rsvId;
    			var userId = list[i].userId;
   				var placeNum = list[i].placeNum;
    			var reviewGuestRate = list[i].reviewGuestRate;
    			star += reviewGuestRate;
    			var reviewGuestWr = list[i].reviewGuestWr;
    			var date = list[i].reviewGuestRegd;
    			var Regd = new Date(date)
    			var reviewGuestRegd = Regd.getFullYear() + "-" + (Regd.getMonth()+1) +"-"+ Regd.getDate();
    				
   				res += '<div style="padding-top: 16px; padding-bottom: 28px;">';
   				res += '<div style="margin-top: 18px; display: flex; flex-direction: row; align-items: center;">';
   				res += "<div class='h_row' style='justify-content: space-between;'' >"
   				res += "<p style='font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);'>"
   				res += userId + "</p></div>"
   				res += '<p style="position: absolute; right: 0px; left: 110px; text-align: right; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.29; letter-spacing: normal; color: rgb(158, 164, 170);">';
                res += reviewGuestRegd + '</p>'
    			res += '<img src="<c:url value="/resources/img/icon/register/review_star.png" />" style="width: 24px; height: 24px;">';
    			res += '<p style="font-size: 15px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: -0.1px; color: rgb(27, 29, 31);">';
    			res += reviewGuestRate + '</p></div>';
               	res += '<p style="font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(114, 120, 127);">';
                res += reviewGuestWr + '</p></div>';
    		}
    		var totalstar = star/listLen
    		totalstar = totalstar.toFixed(1);
         	document.getElementById('reviewlength').innerHTML=listLen;
         	document.getElementById('totalstar').innerHTML=totalstar ;
         }else{
        	document.getElementById('reviewlength').innerHTML='0';
          	document.getElementById('totalstar').innerHTML='0'; 
         }
         $("#reviewList").html(res);
			     	 
         
	 }
	</script>
</body>
</html>