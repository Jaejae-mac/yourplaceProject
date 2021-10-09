<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yourplace Reserve</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user-register.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/custom/css/reviewstar.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
/*sweetalert 이 제일 위로 하기 위한 css*/
      .swal2-container {
        z-index: 100000
      };
</style>
</head>

<body>
	<!-- 세션에 아이디 값이 존재 한다면 마이페이지를 불러주어라. -->
	<c:if test="${user.userNum != null}">
		MY Page - ${user.userNum }
	</c:if>
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<input type="hidden" id="userNum" name="userNum" value="${user.userNum }">
	<div class="h_column_center" id="main_vue" style="min-height: 1000px;">
		<div style="width: 1160px; min-height: 1000px; padding-bottom: 200px;margin-top: 100px;">
			<div>
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
					<span id="rsv_state"
						style="margin-bottom: 0; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
						진행중
					</span>	
					<label id="reservelength" style="margin-left: 10px; margin-bottom: 0; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal;line-height: 1.33; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);"></label>	
				</div>
				
				<div onclick="show_booking_sort()" class="h_center h_hover_button"
					style="position: absolute; right: 0px; width: 130px; height: 40px; border-radius: 4px; border: solid 1px var(#dfe2e7); cursor: pointer;">
					<div class="h_row_center">
						<img src="<c:url value="/resources/img/icon/sort.png" />"
							style="width: 20px; height: 20px;">
						<p id="main_booking"
							style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: var(- -grey-060);">
							신청순</p>
					</div>
				</div>
				<div class="booking_sort"
					style="position: absolute; display: none; top: 50px; right: 0px; width: 160px; height: 100px; z-index: 9999; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
					<div
						style="padding-top: 10px; padding-bottom: 10px; border-top-left-radius: 12px;">
						<div id="close_booking_ing" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
							<p>신청순</p>
						</div>
						<div id="close_booking_app" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px;">
							<p>오래된 순</p>
						</div>
					</div>
				</div>	
			</div>
			<!-- 검색창 -->
			<div class="h_row_center" style="position: relative; width: 100%; margin-top: 30px;"> 
				<div class="h_center" style="position: absolute; right: 0px;">
					<input type="hidden" id="state" value="진행중"/><!-- 현 페이지의 상태값 -->
					<input type="text" placeholder="장소 이름을 입력하세요" id="searchKeyword" name="searchKeyword" style="padding-left: 10px; border: solid 1px; border-radius: 10px;"/>
					<p id ="keyword" class="btn btn-primary btn-sm" style="margin-left: 7px; margin-bottom: 0px;font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; letter-spacing: normal;">검색</p>
				</div>
			</div>
			

			<div class="h_row_center"
				style="position: relative; padding: 0px 8px; margin-top: 50px; width: 1160px; height: 30px;">
				<div class="h_row_center" style="width: 80px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						예약번호</p>
				</div>
				<div class="h_row_center" style="width: 540px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						촬영정보</p>
				</div>
				<div class="h_row_center" style="width: 100px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						호스트</p>
				</div>
				<div class="h_row_center" style="width: 90px;">
					<p
						style="margin-bottom: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						금액</p>
				</div>
				<div class="h_row_center" style="width: 150px;">
					<p
						style="margin-bottom: 0px; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						진행상태</p>
				</div>
				<div class="h_center" style="width: 80px;">
					<p
						style="margin-bottom: 0px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						매출전표</p>
				</div>
				<div class="h_center" style="width: 85px;">
					<p
						style="margin-bottom: 0px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						환불신청</p>
				</div>
				<div class="h_center" style="width: 85px;">
					<p
						style="margin-bottom: 0px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
						리뷰쓰기</p>
				</div>
			</div>
			<hr>
			<!-- 예약 리스트  -->
			<div id="resList" style="display: flex; flex-direction: column;">				
			</div>
			
			<!-- 리뷰 팝업 -->
			<div class="direct h_center" id="direct_vue"
			style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; display: none; z-index: 9999; background-color: rgba(0, 0, 0, 0.6);">

			<div
				style="position: relative; width: 420px; border-radius: 12px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">

				<p
					style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: #1b1d1f; width: 100%; text-align: center">
					리뷰 남기기</p>
				<div class="h_center"
					style="width: 24px; height: 24px; position: absolute; right: 40px; top: 30px; cursor: pointer;"
					onclick="close_direct()">
					<img src="https://s3.hourplace.co.kr/web/images/icon/close.svg"
						style="width: 24px; height: 24px;" />
				</div>

				<form id="form_review" method="post" name="form_review"
					style="margin-top: 30px; padding: 0 40px; margin-bottom: 40px"
					action="">
					<!-- Action -->
					<!--<input type="hidden" name="type" value="direct"> -->
					<input type="hidden" id="rsvNum" name = "rsvNum" value="">
					<input type="hidden" id="placeNum" name = "placeNum" value="">
					<input type="hidden" id="userId" name = "userId" value=${userId }>
					<div
						style="padding: 12px 14px; border-radius: 8px; background-color: #f5f7f8;">
						<p
							style="margin-bottom: 0; font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: #454b50; text-align: center;">
							아워플레이스 장소 이용 중 <br /> 불편하신 점이나 좋았던 점이 있으셨나요?
						</p>
					</div>
					<p style="margin-left: 18px; margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
						별점</p>
	                <div class="star-rating space-x-4 mx-auto">
	                    <input type="radio" id="5-stars" name="reviewGuestRate" value="5" v-model="ratings"/>
	                    <label for="5-stars" class="star pr-4">★</label>
	                    <input type="radio" id="4-stars" name="reviewGuestRate" value="4" v-model="ratings"/>
	                    <label for="4-stars" class="star">★</label>
	                    <input type="radio" id="3-stars" name="reviewGuestRate" value="3" v-model="ratings"/>
	                    <label for="3-stars" class="star">★</label>
	                    <input type="radio" id="2-stars" name="reviewGuestRate" value="2" v-model="ratings"/>
	                    <label for="2-stars" class="star">★</label>
	                    <input type="radio" id="1-star" name="reviewGuestRate" value="1" v-model="ratings" />
	                    <label for="1-star" class="star">★</label>
	                </div>
									
					<p style="margin-left: 18px; margin-top: 20px; font-size: 14px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: #9ea4aa;">
						내용</p>

					<div
						style="margin-top: 8px; height: 192px; padding: 14px; border-radius: 4px; border: solid 1px #eff3f5;">
						<textarea 
							style="resize: none; width: 100%; height: 100%; border: solid 1px white; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;"
							placeholder="리뷰 내용을 입력해주세요" id="review_guest_wr"
							name="reviewGuestWr"></textarea>

					</div>

					<div class="h_center" style="margin-top: 30px;">
						<p onclick="reviewsubmit()" class="btn btn-primary btn-lg" style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">
						리뷰쓰기</p>
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="../footer.jsp" %>
	<!-- Footer 끝 -->
	<script>
	// 정렬 팜업창 열고 닫기
        function show_booking_sort(){
            if ($('.booking_sort').css('display') === 'none') {
                h_show_popup('.booking_sort')
            } else {
                h_hide_popup('.booking_sort')
            }
        }
	// 리뷰창 열기
        function show_direct(rsvnum,placenum) {
        	document.getElementById('rsvNum').value= rsvnum
        	document.getElementById('placeNum').value= placenum
			$('body').addClass('modal-open')
			$('.direct').show()
		}
        function close_direct() {
			$('body').removeClass('modal-open')
			$('.direct').hide()
		}
        
        function h_show_popup(id) {
            $(id).show()
        }
        function h_hide_popup(id) {
            $(id).hide()
        }
        // 원하는 정렬 클릭시 상태 변화
        $(document).on('click','#close_booking_ing',function(){
        	document.getElementById('main_booking').innerHTML='신청순';
            document.getElementById('resList').style.flexDirection ='column';
            h_hide_popup('.booking_sort')
        })
        $(document).on('click','#close_booking_app',function(){
        	document.getElementById('main_booking').innerHTML='오래된 순';
            document.getElementById('resList').style.flexDirection ='column-reverse';
            h_hide_popup('.booking_sort')
        })
        //예약 내역 불러오기
		$(document).ready(function(){
			reserveListIng();			
		})
		function reserveListIng(){
        	var userNum = $('#userNum').val();
			$.ajax({
           		url:"/reserveListIng.do",
           		type:"post",
           		data:{"num":userNum},
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		}
           	});
		};
		// 전체 클릭시 예약내역 값가져오기
		$(document).on('click','#all',function(){
			var userNum = $('#userNum').val();
        	document.getElementById('rsv_state').innerHTML='전체'
        		document.getElementById('state').value="전체"
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = '#ffffff';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        	$.ajax({
           		url:"/reserveListAll.do",
           		type:"post",
           		data:{"num":userNum},
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
           			alert("error");
           			return false
           		}
           	});
        });
		// 지난 내역 예약 내역 가져오기
        $(document).on('click','#end',function(){
        	var userNum = $('#userNum').val();
        	$.ajax({
           		url:"/reserveListEnd.do",
           		type:"post",
           		data:{"num":userNum},
           		dataType : "json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
               		alert("error");
               		return false
               	}
           	});
            document.getElementById('rsv_state').innerHTML='지난내역';
            document.getElementById('state').value="지난내역";
            document.getElementById('end').style.backgroundColor = '#ffffff';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = 'rgb(245, 247, 248)';
        });
		// 취소 예약 내역 가져오기
        $(document).on('click','#cancel',function(){
        	var userNum = $('#userNum').val();
        	$.ajax({
           		url:"/reserveListCancel.do",
           		type:"get",
           		data:{"num":userNum},
           		dataType:"json",
           		success : function(data){
           			getRserveListCall(data);
           		},error : function(request, status, error){
           			alert("error");
           			return false
           		}
           	});
            document.getElementById('rsv_state').innerHTML='취소'
            document.getElementById('state').value="취소"
            document.getElementById('end').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('ing').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('all').style.backgroundColor = 'rgb(245, 247, 248)';
            document.getElementById('cancel').style.backgroundColor = '#ffffff';
            
        });
		// 검색 내역 가져오기
        $(document).on('click','#keyword',function(){
        	var userNum = $('#userNum').val();
        	var keyword = $('#searchKeyword').val();
        	keyword = keyword.trim();
        	var title = $('#state').val();
        	console.log(keyword +"?"+title);
        	if(keyword.length < 2){
        		Swal.fire({
          		  icon: 'error',
         			  title: '검색 할 수 없습니다.',
         			  text: '검색창에 최소 2글자 이상 적어주시기 바랍니다.',
          		})
        	}else{
	        	$.ajax({
	           		url:"/reserveListkeyword.do",
	           		type:"get",
	           		data:{"keyword":keyword,"title":title,"num":userNum},
	           		dataType:"json",
	           		success : function(data){
	           			getRserveListCall(data);
	           		},error : function(request, status, error){
	           			alert("error");
	           			return false
	           		}
	           	});
	        }
        });
		// ajax로 가져온 값 리스트로 만들기
        function getRserveListCall(data){
        	var res = "";
        	var list = data;
        	console.log(list);
            var listLen = data.length;
            console.log(listLen);
            document.getElementById('reservelength').innerHTML= listLen;
            res += '<input type="hidden" id ="reservelen" value="'+ listLen + '">';
        	if(listLen > 0){
        		
       			for(var i=0;i<listLen; i++){
       				var placeNum = list[i].placeNum;
       				var userNum = list[i].userNum
       				var rsvNum = list[i].rsvNum;
       				var rsvYear = list[i].rsvYear;
       				var rsvMonth = list[i].rsvMonth;
       				var rsvDate = list[i].rsvDate;
       				var rsvStartT = list[i].rsvStartT;
       				var rsvEndT = list[i].rsvEndT;
       				var rsvRefundYn = list[i].rsvRefundYn;
       				var rsvRefundYnS = null;
       				if(rsvRefundYn == 0){
       					rsvRefundYnS = "정상예약";
       				}else if(rsvRefundYn == 1){
       					rsvRefundYnS = "환불 진행중";
       				}
       				else if(rsvRefundYn == 2){
       					rsvRefundYnS = "환불 완료";
       				}
       				else if(rsvRefundYn == 3){
       					rsvRefundYnS = "호스트에 의한 환불";
       				}
       				var rsvPay = list[i].invBfTax;
       				var userId = list[i].userId
       				var placeArea = list[i].placeArea;
       				var placeName = list[i].placeName;
       				var placeThumb = list[i].placeThumb;
       				var rsvReviewYn = list[i].rsvReviewYn;
       				
       				var now = new Date()
       				var year = now.getFullYear();
       				var month = now.getMonth()+1;
       				var day = now.getDate();
       				var Time = now.getHours();
       				var rsvDay = new Date(rsvYear,rsvMonth,rsvDate,rsvEndT);
       				var nowDay = new Date(year,month,day,Time);
       				// 날짜 차이 계산
       				var btms = rsvDay.getTime() - nowDay.getTime();
       				var btDay = btms / (1000*60*60*24);
       				res += '<div class="h_row_center" style="position: relative; padding: 0px 8px; width: 1160px; height: 150px;">';
       				res += '<div class="h_row_center" style="width: 80px;">';
       				res += '<input type="hidden" id="rsvNum'+i+'"onclick="Arefundbtn(rsvNum'+i+')" value="'+ rsvNum + '">';
       				res += '<input type="hidden" id="rsvDay'+i+'"onclick="Arefundbtn(rsvDay'+i+')" value="'+ rsvDay.getTime() + '">';
       				res += '<input type="hidden" id="placeNum'+i+'" value="'+ placeNum + '">';
       				res += '<a href="/invoice.do?rsvNum=' + rsvNum + '"target="_blank">';
       				res += '<p name="rsvNum" style="margin-left: 8px; margin-right: 8px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center;">';
       				res += rsvNum + '</p></a></div>';
       				res += '<div class="h_row_center" style="margin-left: 7px; width: 540px;">';
       				res += '<img src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/' + placeThumb + '" style="border-radius: 10px;width: 150px; position: absolute;">';
       				res += '<a href="/detailPlaceForm.do?placeNum='+ placeNum + '">';
       				res += '<p style="margin-left: 160px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvMonth+'월'+ rsvDate +'일 '+ rsvStartT +':00 ~ ' + rsvEndT + ':00';
       				res += '<br>['+ placeArea +'] '+ placeName +'</p></a></div>';     				
       				res += '<div class="h_row_center" style="width: 100px;">';
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += userId + '</p></div>';
       				res += '<div class="h_row_center" style="width: 90px;">'
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvPay +'원</p></div>';
       				res += '<div class="h_row_center" style="width: 150px;">'
       				res += '<p style="margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += rsvRefundYnS +'</p></div>';
       				res += '<div class="h_center" style="width: 80px;">';
       				res += '<p id="salesSip'+i+'" onclick="" class="btn btn-primary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
       				res += '보기</p></div>';
       				res += '<div class="h_center" style="width: 85px;">';
       				// 환불 신청 상태 설정
       				if(rsvRefundYn === 2 || rsvRefundYn === 3){
	       				res += '<p id="refund'+i+'"onclick="Arefundbtn(refund'+i+')"class="btn btn-secondary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '환불신청 </p></div>';
       				}else if(btDay > 4){
       					res += '<p id="refund'+i+'"onclick="refundbtn(rsvNum'+i+',rsvDay'+i+')"class="btn btn-primary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '환불신청</p></div>';
       				}else{
       					res += '<p id="refund'+i+'"onclick="Nrefundbtn(refund'+i+')"class="btn btn-secondary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '환불신청</p></div>';
       				}
       				res += '<div class="h_center" style="width: 85px;">';
       				// 리뷰 작성 가능 여부 설정
       				if(rsvRefundYn == "환불 진행중" || rsvRefundYn == "환불완료"){
	       				res += '<p id="review'+i+'"onclick="Review1()"class="btn btn-secondary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '리뷰쓰기 </p></div></div></div>';
       				}else if(btDay > 0){
       					res += '<p id="review'+i+'"onclick="Review2()"class="btn btn-secondary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '리뷰쓰기</p></div></div></div>';
       				}else if(rsvReviewYn == 'Y'){
       					res += '<p id="review'+i+'"onclick="Review3()"class="btn btn-secondary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '리뷰쓰기</p></div></div></div>';
       				}else{
       					res += '<p id="review'+i+'"onclick="reviewbtn(rsvNum'+i+',placeNum'+i+')"class="btn btn-primary btn-sm" style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal;">';
	       				res += '리뷰쓰기</p></div></div></div>';
       				}
       				
       			}
       		}else{
       			// 예약 내역 없을시 출력
       			res +='<div class="h_center" style="width: 100%; height: 800px; position: relative;">';
       			res +='<div class="h_column_center">';
       			res +='<img src="https://s3.hourplace.co.kr/web/images/icon/guest_empty.png" style="width: 80px; height: 80px;">';
       			res +='<p style="margin-top: 20px; font-size: 24px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">';
       			res +='예약 내역이 없어요</p>';
       			res +='</div>';
       			res +='</div>';
       		}        	
       		$("#resList").html(res); //해당 id의 div에 값 넣기
        };
        // 환불신청
        function refundbtn(e,w){
        	//버튼 클릭시 시간계산
        	var checkdate = new Date();
        	var checkyear = checkdate.getFullYear();
			var checkmonth = checkdate.getMonth()+1;
			var checkday = checkdate.getDate();
			var checkDay = new Date(checkyear,checkmonth,checkday);
			//시간 차이 계산
			var btms = $(w).val() - checkDay.getTime();
			var btDay = btms / (1000*60*60*24);
        	console.log(e, btDay)
        	if(btDay>4){
	        	Swal.fire({
	  	    		title: '정말로 환불하시겠습니까?',
	  	    		text: '예약일로부터 4일전까지는 환불이 가능합니다.',
	  	    		icon: 'warning',
	  	    		showCancelButton: true,
	  	    		confirmButtonColor: '#3085d6',
	  	    		cancelButtonColor: '#d33',
	  	    		confirmButtonText: '네, 환불하겠습니다!',
	  	    		cancelButtonText: '아니오.'
	  	    	}).then((result) => {
	  	    		if (result.isConfirmed) {
	  	    		    var rsvnum = $(e).val();
	  	    		    console.log(rsvnum);
	  	    		    $.ajax({
	  	    		    	url:"/mypagerefund.do",
	  	    	           	type :"post",
	  	    	           	data : {"rsvNum" : rsvnum },
	  	    	           	success:function(responseData){
	  	    	           		console.log(responseData);
	  	    	           		if(responseData === "success"){
		  	    	           		Swal.fire({
		  	    	    		      title : '성공적으로 환불신청이 되었습니다.',
		  	    	    		      icon :'success'
		  	    	    		    }).then((result) => {
		  	    	    		    	location.href='/goreserve.do'
		  	    	    		    })	
	  	    	           		}
	  	    	           	
	  	    	           	}
	  	    		    });
	  	    		}
	        	})
        	}else{
        		Swal.fire({
          		  icon: 'error',
         			  title: '환불하실수 없습니다.',
         			  text: '신청시간으로부터 4일이내가 아닙니다.',
          		})
        	}
        }
        // 환불 거부 예약일로부터 4일이내
        function Nrefundbtn(e){
        	console.log(e)
        	Swal.fire({
        		  icon: 'error',
       			  title: '환불하실수 없습니다.',
       			  text: '예약일로부터 4일이내에는 환불하실수 없습니다.',
        	})
        }
        // 환불 거부 이미 환불상태
        function Arefundbtn(e){
        	console.log(e)
        	Swal.fire({
       			icon: 'error',
        		title: '환불하실수 없습니다.',
        		text: '이미 환불하셨거나 진행중인 예약입니다.',
        	})
        }
        //리뷰창 열기
        function reviewbtn(e,w){
        	var rsvnum = $(e).val();
        	var placenum = $(w).val()
        	console.log(rsvnum)
        	console.log(placenum)
        	show_direct(rsvnum,placenum)
        }
        //리뷰 등록
        function reviewsubmit(){
        	var checkRate = $('input[name=reviewGuestRate]').is(":checked");
        	console.log(checkRate)
        	var review = $('#review_guest_wr').val();
        	review = review.trim();
        	if(review.length < 2){
        		Swal.fire({
        			  target: document.getElementById('direct_vue'),
            		  icon: 'error',
           			  title: '등록할 수 없습니다.',
           			  text: '리뷰내용에 최소 2글자 이상 적어주시기 바랍니다.',
            		})
        	}else if(!checkRate){
        		Swal.fire({
      			  target: document.getElementById('direct_vue'),
          		  icon: 'error',
         			  title: '등록할 수 없습니다.',
         			  text: '별점을 선택해 주시기 바랍니다.',
          		})
        	}else{
        		$("#form_review").attr("action","/insertGuestReview.do").submit();
        	}
        	
        }
        // 리뷰 거부 환불상태
        function Review1(){
        	Swal.fire({
       			icon: 'error',
        		title: '리뷰를 작성하실 수 없습니다.',
        		text: '환불하셨거나 환불진행중인 장소에는 리뷰를 쓰실 수 없습니다.',
        	})
        }
        // 리뷰 거부 이용전
        function Review2(){
        	Swal.fire({
       			icon: 'error',
        		title: '리뷰를 작성하실 수 없습니다.',
        		text: '해당 장소를 이용하신 후 작성해주시기 바랍니다.',
        	})
        }
        // 리뷰 거부 이미 작성
        function Review3(){
        	Swal.fire({
       			icon: 'error',
        		title: '리뷰를 작성하실 수 없습니다.',
        		text: '이미 리뷰를 작성하신 장소 입니다.',
        	})
        }
    </script>
</body>
</html>