<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>

<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/page.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/category.css" />">
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/custom/css/card.css" />">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
						<p onclick="location.href='/category.do?maincate=${mainCategory}&subcate=${li}'">${li }</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		<hr>
		<div id="sub_category-detail">
			<!-- 선택된 메인 카테고리와 연동해서 서브카테고리가 나열되게 하는 기능 필요(데이터베이스와 연동필요) -->
		</div>
		<div id="option-d">
			<div class="h_row_center-d">
				<div class="h_left_button-d" onclick="">
					<p>날짜</p>
				</div>
				<div class="h_left_button-d" onclick="">
					<p>인원</p>
				</div>
				<div class="h_left_button-d" onclick="">
					<p>가격</p>
				</div>
				<div class="h_left_button-d" onclick="">
					<p>지역</p>
				</div>
				<div class="h_right_button-d" onclick="">

					<p>
						<img src="image/sort.png"> 추천순
					</p>
				</div>
			</div>

		</div>
		<div class="total_card_layout">
			<c:forEach var="place" items="${placeCateList}" varStatus="status">
				<div class="card_layout" style="margin-right:15px;">
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
							<c:choose>
								<c:when test="${place.bookmark eq false}">
									<img
										class=“card_body_footer_booking”
										 src="<c:url value="/resources/custom/icon/bookmark_g.png"/>"
										style="width: 24px; height: 24px; margin-left:auto; text-align:center; "
										id="bookmark_img${place.placeNum }" 
										onclick="yourplaceBookmark(${place.placeNum},'bookmark_img${place.placeNum }')" />
								</c:when>
								<c:otherwise>
									<img
										class=“card_body_footer_booking”
										 src="<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>"
										style="width: 24px; height: 24px; margin-left:auto; text-align:center; "
										id="bookmark_img${place.placeNum }" 
										onclick="yourplaceBookmark(${place.placeNum},'bookmark_img${place.placeNum }')"/>
								</c:otherwise>
							</c:choose>

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
<!-- Bookmark -->
<script>
    function yourplaceBookmark(placeNum,imgId){
    	console.log("bookmark Clicked");
    	console.log(imgId);
    	var sessionUser ="${userVO.userId}"; 
    	if(!sessionUser){
    		swal("","로그인 후 관심장소 등록이 가능합니다.","warning");
    	}else{
    		$.ajax({
                type:"GET",
                url: "/bookmark.do?userId="+sessionUser+"&placeNum="+placeNum,
                async:false,
                contentType: "application/json",
                success:function(data){
                	if(data === 'addBookmark'){
                		console.log("bookmark!!!");
                		$("#"+imgId).attr("src",'<c:url value="/resources/custom/icon/bookmark_b_v4.svg"/>');
                	}else{
                		$("#"+imgId).attr("src",'<c:url value="/resources/custom/icon/bookmark_g.png"/>');
                	}
                }
    		});	
    	}
    	
    }
    </script>
</html>