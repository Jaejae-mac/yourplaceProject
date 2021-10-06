<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/page.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/category.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/card.css" />">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- SweetAlert Lib -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>

<body>
	<%@include file="header.jsp"%>
	<div id="warp">
		<div id="category-detail">
			<ul>
				<c:forEach var="li" items="${categoryList }">
					<li>
						<p onclick="location.href='/category.do?maincate=${mainCategory}&subcate=${li}&sort=최신순'">${li }</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		<c:if test="${keyword != null}">
			<div style="margin-top: 20px;">
				<p style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: #1b1d1f;">
				${keyword }
				</p>
			</div>
		</c:if>
		<hr>
		
		<div id="option-d" style="height: 80px;">
			<c:if test="${keyword == null}">
			<div class="h_row_center-d">
				<div class="h_left_button-d" id="bookingPeople">
					<p>인원</p>
				</div>
				<div class="h_left_button-d" id="bookingPrice">
					<p>가격</p>
				</div>
				<div class="h_left_button-d" id="bookingAddr">
					<p>지역</p>
				</div>
				<div id="show_booking_sort" class="h_center h_hover_button"
					style="position: absolute; right: 0px; width: 120px; height: 40px; border-radius: 4px; border: solid 1px #aeb3b8; cursor: pointer;">
					<div class="h_row_center">
						<img src="<c:url value="/resources/img/icon/sort.png" />"
							style="width: 20px; height: 20px;">
						<p id="main_booking"
							style="margin-bottom: 0; margin-top: 0; margin-left: 7px; font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; text-align: center; color: #454b50;">
							최신순</p>
					</div>
				</div>
				<div class="booking_sort"
					style="position: absolute; display: none; top: 50px; right: 0px; width: 160px; height: auto; z-index: 9999; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
					<div
						style="padding-top: 10px; padding-bottom: 10px; border-top-left-radius: 12px;">
						<div id="close_booking_best" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px; color: #454b50;">
							<p>추천순</p>
						</div>
						<div id="close_booking_new" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px; color: #454b50;">
							<p>최신순</p>
						</div>
						<div id="close_booking_old" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px; color: #454b50;">
							<p>오래된순</p>
						</div>
						<div id="close_booking_review" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px; color: #454b50;">
							<p>리뷰많은순</p>
						</div>
						<div id="close_booking_rank" class="h_hover_button"
							style="margin-bottom: 0; position: relative; display: flex; flex-direction: row; align-items: center; height: 40px; padding: 0px 30px; color: #454b50;">
							<p>평점높은순</p>
						</div>
					</div>
				</div>	
			</div>
			</c:if>
		</div>
		
			<div class="booking_people"
				style="display: none; position: absolute; z-index: 2; left: 180px; top: 250px; width: 340px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<div style="width: 100%; height: fit-content">
					<div class="h_row_center"
						style="width: 280px; margin: 30px 30px 20px; height: 44px; position: relative;">
						<p
							style="margin-bottom: 0px; margin-top: 0px; font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: #1b1d1f;">
						총인원 수</p>
						<div class="h_row_center" style="height: 44px; width: 168px; position: absolute; right: 0px;">
							<div style="width: 40px; height: 44px; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;"
								id="people_minus">
							<img src=" <c:url value="/resources/custom/icon/minus.svg"/>" style="width: 20px; height: 20px" />
						</div>
						<div style="width: 60px; margin: 0px 14px; padding: 0px 2px; height: 44px; border-radius: 4px; border: solid 1px var(- -grey-025); display: flex; flex-direction: row; align-items: center; justify-content: center;">
							<input type="text" pattern="[0-9]*" id="select_search_people" placeholder="1"
								style="width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; text-align: center; color: #1b1d1f;"value="1" />
						</div>
							<div style="width: 40px; height: 44px; display: flex; flex-direction: row; align-items: center; justify-content: center; cursor: pointer;"
								id="people_plus">
								<img src=" <c:url value="/resources/custom/icon/plus.svg"/>" style="width: 20px; height: 20px" />
							</div>
						</div>
					</div>
				</div>
				<div class="h_row_center"
					style="position: relative; width: 100%; height: 70px; border-top: 1px solid rgb(231, 234, 238);">
					<p class="h_center"
						style="margin-left: 30px; margin-top: 5px; font-size: 15px;color: #131415; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; cursor: pointer;"
						onclick="resetPeople()">초기화</p>
					<div style="position: absolute; right: 20px">
						<div class="request on" style="margin-top: 0px; width: 80px; height: 40px; cursor: default;"
							onclick="setPeople()">
							<div class="h_right_button-d" style="background-color: #609bff; ">
								<p style="margin-top: 9px; font-color: white">
								완료</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="booking_price"
				style="display: none; position: absolute; z-index: 2; left: 250px; top: 250px; width: 340px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<div class="h_center"style="width: 100%; height: fit-content">
					<div class="h_row_center"
						style="width: 280px; margin: 30px 15px 20px; height: 44px; position: relative;">
						<div style="width: 150px; margin: 0px 14px; height: 44px; border-radius: 4px; border: solid 2px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center;">
							<input type="text"id="select_search_minprice" placeholder="10,000"
								style="padding-left: 8px; width: 100%; height: 100%; border-width: 0px;  font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;" />
							<p class="h_center"style="margin-right: 5px; width: 20px; height: 100%; border-width: 0px; text-align: right;font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #131415;">
							원</p>
						</div>
						<div style="width: 30px ">
							<p style="text-align: center; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #131415;">
								~<p>
						</div>
						<div style="width: 150px; margin: 0px 14px; height: 44px; border-radius: 4px; border: solid 2px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center;">
							<input type="text"id="select_search_maxprice" placeholder="9,900,000"
								style="padding-left: 8px; width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;" />
							<p class="h_center"style="margin-right: 5px; width: 20px; height: 100%; border-width: 0px; text-align: right;font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #131415;">
							원</p>
						</div>
					</div>
				</div>
				<div class="h_row_center"
					style="position: relative; width: 100%; height: 70px; border-top: 1px solid rgb(231, 234, 238);">
					<p class="h_center"
						style="margin-left: 30px; margin-top: 5px; font-size: 15px;color: #131415; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; cursor: pointer;"
						onclick="resetPrice()">초기화</p>
					<div style="position: absolute; right: 20px">
						<div class="request on" style="margin-top: 0px; width: 80px; height: 40px; cursor: default;"
							onclick="setPrice()">
							<div class="h_right_button-d" style="background-color: #609bff; ">
									<p style="margin-top: 9px; font-color: white">
								완료</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="booking_addr"
				style="display: none; position: absolute; z-index: 2; left: 320px; top: 250px; width: 340px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);">
				<div class="h_center"style="width: 100%; height: fit-content">
					<div class="h_row_center"
						style="width: 280px; margin: 30px 0px 20px; height: 44px; position: relative;">
						<div class="find-address" style="width: 100%; margin-right:14px; height: 44px; border-radius: 4px; border: solid 2px #dfe2e7; display: flex; flex-direction: row; align-items: center; justify-content: center;">
							<input type="text" id="select_search_addr" placeholder="주소를 입력해주세요"
								style=" width: 100%; height: 100%; border-width: 0px;  font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: #1b1d1f;" />
						</div>
						
					</div>
				</div>
				<div class="h_row_center"
					style="position: relative; width: 100%; height: 70px; border-top: 1px solid rgb(231, 234, 238);">
					<p class="h_center"
						style="margin-left: 30px; margin-top: 5px; font-size: 15px;color: #131415; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; margin-bottom: 0px; cursor: pointer;"
						onclick="resetAddr()">초기화</p>
					<div style="position: absolute; right: 20px">
						<div class="request on" style="margin-top: 0px; width: 80px; height: 40px; cursor: default;"
							onclick="setAddr()">
							<div class="h_right_button-d" style="background-color: #609bff; ">
									<p style="margin-top: 9px; font-color: white">
								완료</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		<c:if test="${fn:length(placeCateList) == 0 }">
	            <div class="h_center" style="width: 1160px; height: 1000px;">
	                <div class="h_column_center">
	                    <div class="h_center" style="width: 80px;height: 80px;background-color: #eff3f5;border-radius: 40px;">
	                        <img src="<c:url value="/resources/img/icon/search.png" />" style="width: 70px;height: 70px;" />
	                    </div>
	                    <p style="margin-top: 20px;font-size: 24px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.33;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
	                       	 일치되는 결과가 없습니다.
	                    </p>
	                </div>
	            </div>
            </c:if>
		<div class="total_card_layout" >
			<c:forEach var="place" items="${placeCateList}" varStatus="status" >
				<div class="card_layout" style="margin-right:15px;" id="cardList">
					<div class="card">
						<div class="card_header" onclick="gotoDetail('#place_num${status.index }')">
							<img src="${place.placeThumb }" alt="이미지 넣는 곳" />
							<!-- 데이터 베이스의 해당 image 가져오기-->
						</div>
						<div class="card_body" onclick="gotoDetail('#place_num${status.index }')">
							<div class="card_body_header" >
								<p>
									${place.placeCate } · ${place.placeArea }
									<!-- 데이터 베이스 연동시 예 {{ place.category_sub }} · {{ place.local }} -->
								</p>
								<div class="card_body_header_right">
									<div>
										<img src="<c:url value="/resources/custom/icon/person.png" />">
										<p>
											${place.placeCapa }
											<!-- {{ place.people }} -->
										</p>
									</div>
									<div>
										<img src="<c:url value="/resources/custom/icon/parking.png" />">
										<p>
											${place.placeCapaCar }
											<!-- {{ place.parking }} -->
										</p>
									</div>
								</div>
							</div>
							<div class="card_body_title">
								${place.placeName }
								<!-- 데이터 베이스 연동시 예 {{ place.title }} -->
							</div>
						</div>
						<div id="line"></div>
						<div class="card_body_footer">
							<img src="<c:url value="/resources/custom/icon/gold_star.png" />">
							<p class="card_body_footer_star">
								${place.avgRate }
								<!-- {{ place.feedback_rating }} -->
							</p>
							<p class="card_body_footer_review">
								리뷰 ${place.reviewCnt }
								<!-- 리뷰 {{ place.feedback_count }} -->
							</p>
							<p class="card_body_footer_price">
								${place.placePrice }원
								<!-- {{ place.price_guest }}원 -->
							</p>
							<img class="card_body_footer_booking" src="<c:url value="/resources/custom/icon/bookmark_g.png" />" onclick="interest()">
							<!-- 관심 장소로 선택시 이미지 변경 구현필요-->
						</div>
					</div>
				</div>
				<input type="hidden" id="place_num${status.index }" value="${place.placeNum} "/>
			</c:forEach>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
<script>
function gotoDetail(e){
	location.href="/detailPlaceForm.do?placeNum="+$(e).val();
}
function interest(){
	console.log("img click");
}
</script>
<script>
	$(document).ready(function(){
		var placesort = "${placeSort}";
		if(placesort.equals("평점")){
			placesort = "평점높은순"
		}else if(placesort.equals("리뷰")){
			placesort = "리뷰많은순"
		}
		document.getElementById('main_booking').innerHTML= placesort;
	});
</script>
<script>
// 인원수
	function toggleBooking(e){
	    $(e).toggle();
	}
	function hideBooking(e){
		$(e).hide();
	}
	$("#bookingPeople").click(function(){
	    toggleBooking(".booking_people");
	    hideBooking(".booking_price");
	    hideBooking(".booking_addr");
	});
	$("#people_plus").click(function(){
		var t = parseInt($("#select_search_people").val())+1;
	    console.log(t);
	    $("#select_search_people").val(t);
	});
	$("#people_minus").click(function(){
    	var t = parseInt($("#select_search_people").val())-1;
    	if(t <= 0){
    		t = 1;
    	}
    	console.log(t);
    	$("#select_search_people").val(t);
  	});
	function resetPeople(){
	    $("#select_search_people").val("1");
	    $("#select_search_people").attr("placeholer","1");
	}
function setPeople(){
	  var num = $("#select_search_people").val();
	  var main ="${mainCategory}";
	  var sub ="${subCategory}";
      hideBooking(".booking_people");
      location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=최신순';
}
</script>
<script>
	$("#bookingPrice").click(function(){
	    toggleBooking(".booking_price");
	    hideBooking(".booking_people");
	    hideBooking(".booking_addr");
	});
	function resetPrice(){
	    $("#select_search_minprice").val('');
	    $("#select_search_maxprice").val('');
	}
	function setPrice(){
		var min = $("#select_search_minprice").val();
		var mincheck = $.isNumeric(min)
		var max = $("#select_search_maxprice").val();
		var maxcheck = $.isNumeric(max)
		if(mincheck == false){
			min = 10000;
		}
		if(maxcheck == false){
			max = 9900000;
		}
		var main ="${mainCategory}";
		var sub ="${subCategory}";
		hideBooking(".booking_price");
		location.href='/placeListPrice.do?min='+min+'&max='+max+'&maincate='+main+'&subcate='+sub+'&sort=최신순';
	}
</script>
<script>
$("#bookingAddr").click(function(){
    toggleBooking(".booking_addr");
    hideBooking(".booking_people");
    hideBooking(".booking_price");
});
function resetAddr(){
    $("#select_search_addr").val('');
}
function setAddr(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var addr = $("#select_search_addr").val();
	var addrL = addr.trim();
	if(addrL.length < 2){
		hideBooking(".booking_addr");
		Swal.fire({
    		  icon: 'error',
   			  title: '검색 할 수 없습니다.',
   			  text: '주소창에 최소 2글자 이상 적어주시기 바랍니다.',
    		})
	}else{
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=최신순';
	}
}
</script>
<script>
$("#show_booking_sort").click(function(){
	toggleBooking(".booking_sort");
});
$(document).on('click','#close_booking_new',function(){
	document.getElementById('main_booking').innerHTML='최신순';
    hideBooking('.booking_sort')
    gobooking_new();
})
$(document).on('click','#close_booking_old',function(){
	document.getElementById('main_booking').innerHTML='오래된순';
    hideBooking('.booking_sort')
    gobooking_old();
})
$(document).on('click','#close_booking_best',function(){
	document.getElementById('main_booking').innerHTML='추천순';
	hideBooking('.booking_sort')
	gobooking_best();
})
$(document).on('click','#close_booking_review',function(){
	document.getElementById('main_booking').innerHTML='리뷰많은순';
	hideBooking('.booking_sort')
	gobooking_review();
})
$(document).on('click','#close_booking_rank',function(){
	document.getElementById('main_booking').innerHTML='평점높은순';
	hideBooking('.booking_sort')
	gobooking_rank();
})
function gobooking_new(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var num ="${placePeople}";
	var addr ="${placeAddr}";
	var max ="${priceMax}";
	var min ="${priceMin}";
	if(num !=""){
		location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=최신순';
	}else if(addr !=""){
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=최신순';
	}else if(max != "" && min != ""){
		location.href='/placeListPrice.do?min='+min+'&max='+max+'&maincate='+main+'&subcate='+sub+'&sort=최신순';
	}else{
		location.href ='/category.do?maincate='+main+'&subcate='+sub+'&sort=최신순';
	}
}
function gobooking_old(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var num ="${placePeople}";
	var addr ="${placeAddr}";
	var max ="${priceMax}";
	var min ="${priceMin}";
	if(num != ""){
		location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=오래된순';
	}else if(addr != ""){
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=오래된순';
	}else if(max != "" && min != ""){
		location.href='/placeListPrice.do?min='+min+'&max='+max+'&maincate='+main+'&subcate='+sub+'&sort=오래된순';
	}else{
		location.href ='/category.do?maincate='+main+'&subcate='+sub+'&sort=오래된순';
	}
}
function gobooking_best(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var num ="${placePeople}";
	var addr ="${placeAddr}";
	var max ="${priceMax}";
	var min ="${priceMin}";
	if(num != ""){
		location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=추천순';
	}else if(addr != ""){
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=추천순';
	}else if(max != "" && min != ""){
		location.href='/placeListPrice.do?min='+min+'&max='+max+'&maincate='+main+'&subcate='+sub+'&sort=추천순';
	}else{
		location.href ='/category.do?maincate='+main+'&subcate='+sub+'&sort=추천순';
	}
}
function gobooking_review(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var num ="${placePeople}";
	var addr ="${placeAddr}";
	var max ="${priceMax}";
	var min ="${priceMin}";
	if(num != ""){
		location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=리뷰';
	}else if(addr != ""){
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=리뷰';
	}else if(max != "" && min != ""){
		location.href='/placeListPrice.do?min='+min+'&max='+max+'&maincate='+main+'&subcate='+sub+'&sort=리뷰';
	}else{
		location.href ='/category.do?maincate='+main+'&subcate='+sub+'&sort=리뷰';
	}
}
function gobooking_rank(){
	var main ="${mainCategory}";
	var sub ="${subCategory}";
	var num ="${placePeople}";
	var addr ="${placeAddr}";
	var max ="${priceMax}";
	var min ="${priceMin}";
	if(num != ""){
		location.href='/placeListP.do?num='+num+'&maincate='+main+'&subcate='+sub+'&sort=평점';
	}else if(addr != ""){
		location.href ='/placeListAddr.do?addr='+ addr +'&maincate='+main+'&subcate='+sub+'&sort=평점';
	}else if(max != "" && min != ""){
		location.href='/placeListPrice.do?min='+min+'&maincate='+max+'&main='+main+'&subcate='+sub+'&sort=평점';
	}else{
		location.href ='/category.do?maincate='+main+'&subcate='+sub+'&sort=평점';
	}
}
</script>
</html>