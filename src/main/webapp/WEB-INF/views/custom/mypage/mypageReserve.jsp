<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->

	<div class="h_column_center" id="main_vue" style="min-height: 1000px;">
		<div style="width: 1160px; min-height: 1000px; padding-bottom: 200px;">
			<div style="margin-top: 20px;">
				<p style="font-size: 32px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.31;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
					신청 예약
				</p>
			</div>

			<div class="h_row_center" style="position: relative; padding: 0px 8px; margin-top: 50px; width: 1160px; height: 56px; border-radius: 4px; background-color: rgb(245, 247, 248);">
				<div class="h_center" style="margin: 0 auto;">
					<div class="h_center " id="ing" onclick="select_booking_ing()" style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: #ffffff;">
						<p>
							 진행중
						</p>
					</div>
					
					<div style="width: 1px;height: 16px;background-color: #72787f;"></div>
					
                    <div class="h_center" id="all"onclick="select_booking_all()" 
                    	style=" width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
                    	<p>
                    		전체
                    	</p> 
                    </div>
                    
                    <div style="width: 1px;height: 16px;background-color: #72787f;"></div>
                    
                    <div class="h_center" id="end" onclick="select_booking_end()" 
                    	style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
                    	<p>
                    		지난내역
                    	</p>
                    </div>
                    
                    <div style="width: 1px;height: 16px;background-color: #72787f;"></div>
                    
                    <div class="h_center" id="cancel" onclick="select_booking_cancel()" 
                    	style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
                    	<p>
                    		취소
                    	</p>
                    </div>
                </div>    
            </div>

            <div class="h_row_center" style="position: relative; width: 100%; margin-top: 40px; height: 40px;">
            	<div class="h_row_center">
            		<p id="rsv_state" style="font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
            			진행중
                    </p> 
                </div> 
                <div onclick="show_booking_sort()" class="h_center h_hover_button" style="position: absolute; right: 0px; width: 110px; height: 40px; border-radius: 4px; border: solid 1px var(--grey-025); cursor: pointer;">
                    <div class="h_row_center"><img src="//s3.hourplace.co.kr/web/images/icon/sort.svg" style="width: 20px; height: 20px;"> 
                    	<p id="main_booking"style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: var(--grey-060);">
                    		진행일순
                        </p>
                    </div>
                </div> 
                <div  class="booking_sort" style="position: absolute; display: none; top: 50px; right: 0px; width: 160px; height: 100px; z-index: 9999; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
                    <div style="padding-top: 10px; padding-bottom: 10px; border-top-left-radius: 12px;">
                        <div onclick="close_booking_ing()" class="h_hover_button" style="position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
                            <p>
                                	진행일순
                            </p>
                        </div> 
                        <div onclick="close_booking_app()" class="h_hover_button" style="position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
                            <p >
                                	신청일순
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="h_row_center" style="position: relative; padding: 0px 8px; margin-top: 50px; width: 1160px; height: 56px;">
            	
            </div>
            <c:if test="${fn:length(reserveList) == 0 }">
            <div class="h_center" style="width: 100%; height: 800px; position: relative;">
                <div class="h_column_center">
                    <img src="https://s3.hourplace.co.kr/web/images/icon/guest_empty.png" style="width: 80px; height: 80px;"> 
                    <p style="margin-top: 20px; font-size: 24px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
                        	예약 내역이 없어요
                    </p>
                </div>
            </div>
            </c:if>
        </div>
    </div>
    <!-- Footer -->
	<%@ include file="../footer.jsp" %>
	<!-- Footer 끝 -->
    <script>
        function show_booking_sort(){
            if ($('.booking_sort').css('display') === 'none') {
                h_show_popup('.booking_sort')
            } else {
                h_hide_popup('.booking_sort')
            }
        }
        function h_show_popup(id) {
            $(id).show()
        }
        function h_hide_popup(id) {
            $(id).hide()
        }
        function close_booking_ing() {
            document.getElementById('main_booking').innerHTML='진행일순'
            h_hide_popup('.booking_sort')
        }
        function close_booking_app() {
            document.getElementById('main_booking').innerHTML='신청일순'
            h_hide_popup('.booking_sort')
        }

        function select_booking_ing(){
            document.getElementById('rsv_state').innerHTML='진행중'
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = '#ffffff';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        }
        function select_booking_all(){
            document.getElementById('rsv_state').innerHTML='전체'
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = '#ffffff';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        }
        function select_booking_end(){
            document.getElementById('rsv_state').innerHTML='지난내역';
            document.getElementById('end').style.backgroundColor = '#ffffff';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        }
        function select_booking_cancel(){
            document.getElementById('rsv_state').innerHTML='취소'
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = '#ffffff';
        }
    </script>
</body>
</html>