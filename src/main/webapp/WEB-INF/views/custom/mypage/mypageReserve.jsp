<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<body>
	<!-- 세션에 아이디 값이 존재 한다면 마이페이지를 불러주어라. -->
	<c:if test="${userId != null}">
		MY Page - ${userId }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<div class="h_column_center" id="main_vue" style="min-height: 1000px;">
		<div style="width: 1160px; min-height: 1000px; padding-bottom: 200px;">
			<div style="margin-top: 20px;">
				<p
					style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
					신청 예약</p>
			</div>

			<div class="h_row_center"
				style="position: relative; padding: 0px 8px; margin-top: 50px; width: 1160px; height: 56px; border-radius: 4px; background-color: rgb(245, 247, 248);">
				<div class="h_center" style="margin: 0 auto;">
					<div class="h_center " id="ing" onclick="location.href='/goreserve.do'"
						style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: #ffffff;">
						<p style="margin-bottom: 0;">진행중</p>
					</div>

					<div style="width: 1px; height: 16px; background-color: #72787f;"></div>

					<div class="h_center" id="all"
						style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
						<p style="margin-bottom: 0;">전체</p>
					</div>

					<div style="width: 1px; height: 16px; background-color: #72787f;"></div>

					<div class="h_center" id="end"
						style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
						<p style="margin-bottom: 0;">지난내역</p>
					</div>

					<div style="width: 1px; height: 16px; background-color: #72787f;"></div>

					<div class="h_center" id="cancel"
						style="width: 230px; height: 40px; border-radius: 4px; cursor: pointer; background-color: rgb(245, 247, 248);">
						<p style="margin-bottom: 0;">취소</p>
					</div>
				</div>
			</div>

			<div class="h_row_center"
				style="position: relative; width: 100%; margin-top: 40px; height: 40px;">
				<div class="h_row_center">
					<p id="rsv_state"
						style="margin-bottom: 0; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						진행중</p>
				</div>
				<div onclick="show_booking_sort()" class="h_center h_hover_button"
					style="position: absolute; right: 0px; width: 130px; height: 40px; border-radius: 4px; border: solid 1px var(- -grey-025); cursor: pointer;">
					<div class="h_row_center">
						<img src="//s3.hourplace.co.kr/web/images/icon/sort.svg"
							style="width: 20px; height: 20px;">
						<p id="main_booking"
							style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: var(- -grey-060);">
							최신일 순</p>
					</div>
				</div>
				<div class="booking_sort"
					style="position: absolute; display: none; top: 50px; right: 0px; width: 160px; height: 100px; z-index: 9999; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
					<div
						style="padding-top: 10px; padding-bottom: 10px; border-top-left-radius: 12px;">
						<div onclick="close_booking_ing()" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
							<p>최신일 순</p>
						</div>
						<div onclick="close_booking_app()" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
							<p>오래된 순</p>
						</div>
					</div>
				</div>
			</div>

			

			<div class="h_row_center"
				style="position: relative; padding: 0px 8px; margin-top: 50px; width: 1160px; height: 30px;">
				<div class="h_row_center" style="width: 100px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						예약번호</p>
				</div>
				<div class="h_row_center" style="width: 600px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						촬영정보</p>
				</div>
				<div class="h_row_center" style="width: 130px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						호스트</p>
				</div>
				<div class="h_row_center" style="width: 120px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						금액</p>
				</div>
				<div class="h_row_center" style="width: 100px;">
					<p
						style="margin-bottom: 0px; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						진행상태</p>
				</div>
				<div class="h_row_center" style="width: 100px;">
					<p
						style="margin-bottom: 0px; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						환불신청</p>
				</div>
			</div>
			<hr>
			
			<div id="resList">				
			</div>
			
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
            document.getElementById('main_booking').innerHTML='최신일 순'
            h_hide_popup('.booking_sort')
        }
        function close_booking_app() {
            document.getElementById('main_booking').innerHTML='오래된 순'
            h_hide_popup('.booking_sort')
        }
		$(document).ready(function(){
			reserveListIng();
		})
		function reserveListIng(){
			$.ajax({
           		url:"/reserveListIng.do",
           		type:"post",
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		}
           	});
		};
        $(document).on('click','#all',function(){
        	document.getElementById('rsv_state').innerHTML='전체'
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = '#ffffff';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        	$.ajax({
           		url:"/reserveListAll.do",
           		type:"post",
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
           			alert("error");
           			return false
           		}
           	});
        });
        $(document).on('click','#end',function(){
        	$.ajax({
           		url:"/reserveListEnd.do",
           		type:"post",
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
               		alert("error");
               		return false
               	}
           	});
            document.getElementById('rsv_state').innerHTML='지난내역';
            document.getElementById('end').style.backgroundColor = '#ffffff';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        });
        $(document).on('click','#cancel',function(){
        	$.ajax({
           		url:"/reserveListCancel.do",
           		type:"get",
           		dataType:"json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
           			alert("error");
           			return false
           		}
           	});
            document.getElementById('rsv_state').innerHTML='취소'
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = '#ffffff';
            
        });
        function getRserveListCall(data){
        	var list = data;
            var listLen = data.length;
                    
            var res = "";
        	if(listLen > 0){
       			for(var i=0;i<listLen; i++){
       				var placeNum = list[i].placeNum;
       				var rsvId = list[i].rsvId
       				var rsvNum = list[i].rsvNum;
       				var rsvMonth = list[i].rsvMonth;
       				var rsvDate = list[i].rsvDate;
       				var rsvStartT = list[i].rsvStartT;
       				var rsvEndT = list[i].rsvEndT;
       				var rsvRefundYn = list[i].rsvRefundYn;
       				if(rsvRefundYn == 0){
       					rsvRefundYn = "정상예약";
       				}else if(rsvRefundYn == 1){
       					rsvRefundYn = "환불 진행중";
       				}
       				else if(rsvRefundYn == 2){
       					rsvRefundYn = "환불 완료";
       				}
       				else if(rsvRefundYn == 3){
       					rsvRefundYn = "호스트에 의한 환불";
       				}
       				var rsvPay = list[i].rsvPay;
       				var userId = list[i].userId
       				var placeArea = list[i].placeArea;
       				var placeName = list[i].placeName;
       				
       				res += '<div class="h_row_center" style="position: relative; padding: 0px 8px; width: 1160px; height: 150px;">';
       				res += '<div class="h_row_center" style="width: 100px;">';
       				res += '<input type="hidden" id ="userId" value="'+ rsvId + '">';
       				res += '<a href="">';
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center;">';
       				res += rsvNum + '</p></a></div>';
       				res += '<div class="h_row_center" style="width: 600px;">';
       				res += '<img src="https://s3.hourplace.co.kr/web/images/icon/elements_image_empty_guest.png" style="width: 150px; position: absolute;">';
       				res += '<a href="">';
       				res += '<p style="margin-left: 170px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvMonth+'월'+ rsvDate +'일 '+ rsvStartT +':00 ~ ' + rsvEndT + ':00';
       				res += '<br>['+ placeArea +'] '+ placeName +'</p></a></div>';
       				res += '<input type="hidden" id ="day'+i+'" value="'+ rsvMonth +'-'+ rsvDate +'">';
       				res += '<div class="h_row_center" style="width: 130px;">';
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += userId + '</p></div>';
       				res += '<div class="h_row_center" style="width: 120px;">'
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvPay +'원</p></div>';
       				res += '<div class="h_row_center" style="width: 100px;">'
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvRefundYn +'</p></div>';
       				res += '<div class="h_row_center" style="width: 100px;">';
       				res += '<p id="refundbtn'+i+'"class="btn btn-primary btn-sm" style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += '환불신청</p></div></div></div>';
       			}
       		}else{
       			res +='<div class="h_center" style="width: 100%; height: 800px; position: relative;">';
       			res +='<div class="h_column_center">';
       			res +='<img src="https://s3.hourplace.co.kr/web/images/icon/guest_empty.png" style="width: 80px; height: 80px;">';
       			res +='<p style="margin-top: 20px; font-size: 24px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">';
       			res +='예약 내역이 없어요</p>';
       			res +='</div>';
       			res +='</div>';
       		}
       		$("#resList").html(res);
        }
    </script>
</body>
</html>