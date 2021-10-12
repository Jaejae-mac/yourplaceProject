<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Yourplace_장소 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.1/js/dataTables.bootstrap5.min.js"></script>
<script
	src="https://cdn.datatables.net/scroller/2.0.5/js/dataTables.scroller.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/scroller/2.0.5/css/scroller.bootstrap5.min.css" />

<link
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js?ver=12"></script>
<!-- JQuery Lib -->
<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- 다음 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--부트스트랩 추가 -->

<link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
<%-- 	<link rel="stylesheet"
	href="<c:url value="/resources/place/css/style-regist.css" />" /> --%>
<link rel="stylesheet"
	href="<c:url value="/resources/place/css/regist-style.css" />" />
<script src="<c:url value="/resources/place/js/regist.js" />"></script>
<script>
	history.scrollRestoration = "manual"
</script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../hostnav.jsp"%>

	<div id="layoutSidenav_content">
		<main style="width: 70%; margin: 0 auto;">
			<h1 style="text-align: center;">장소 등록</h1>
			<!-- 전송 폼태그. -->
			<form method="POST" enctype="multipart/form-data"
				action="/regist/place/registPlace.hdo" id="regist_form">
				<!-- 다음 API 시작. -->
				<h3>지역 선택</h3>
				<div class="choose-area">
					<select class="form-select form-select-lg mb-3"
						style="width: 100%; min-height: 40px;" name="placeArea">
						<option selected>지역을 선택하세요</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="대전">대전</option>
						<option value="광주">광주</option>
						<option value="울산">울산</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="세종">세종</option>

					</select>
				</div>
				<hr>
				<h3>주소 등록</h3>
				<div class="find-address" style="margin-top: 20px;">
					<input type="text" id="roadAddress" class="roadAddress"
						placeholder="도로명주소" size="50" name="placeAddr" readonly />
						 <input
						type="button" onclick="execDaumPostcode()"
						class="btn btn-primary btn-find-address" value="우편번호 찾기" style="min-height:35px"/>
				</div>
				<hr>
				<!-- 해시태그 시작 -->
				<div class="tr_hashTag_area">
					<h3>해시 태그</h3>
					<!-- <p><strong>HashTag</strong></p> -->
					<div class="form-group-out">
						<input type="hidden" value="" name="tag" id="rdTag" />
					</div>
					<div class="form-group">
						<input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록하기"
							style="width: 100%; padding-left: 10px; min-height: 40px; outline: none;" />
					</div>
					<ul id="tag-list" name="placeTag"></ul>
					<div class="clear"></div>
					<input type="hidden" name="placeTag" value="" id="place_tag">
				</div>
				<!--카테고리 등록.-->
				<h3>카테고리 등록하기</h3>
				<p>대분류</p>
				<div class="choose-category">
					<select class="form-select form-select-lg mb-3"
						style="width: 100%; min-height: 40px; margin-bottom: 10px;"
						name="placeMaincate" id="place_maincate">
						<option selected>지역을 선택하세요</option>
						<option value="가정집">가정집</option>
						<option value="스튜디오">스튜디오</option>
						<option value="상업공간">상업 공간</option>
						<option value="편의시설">편의 시설</option>
						<option value="문화공간">문화공간</option>
						<option value="특수공간">특수공간</option>
						<option value="대형공간/야외">대형공간/야외</option>
						
					</select>
					<p>소분류</p>
					<select class="form-select form-select-lg mb-3"
						style="width: 100%; min-height: 40px;" name="placeCate"
						id="place_cate">
						<option selected>지역을 선택하세요</option>
					</select>
				</div>
				<hr>
				<!--제목-->
				<h3>제목</h3>
				<div>
					<input type="text" style="width: 100%; min-height: 40px;font-size: 16px; 
										border:1px solid black; border-radius:10px;padding-left:10px;" 
					name="placeName"
						id="place_name" placeholder="장소 제목을 입력하세요">
				</div>
				<hr>
				<!--소개-->
				<h3>소개</h3>
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding: 7px">
						<p>회원님의 개인정보 보호를 위해 등록 및 수정 과정에서 개인정보 또는 연락처 입력 시, 자동으로 편집되며
							향후 서비스 이용에 제약이 있을 수 있습니다.</p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 300px; padding: 10px">
						<textarea name="placeIntro" id="place_intro" cols="10" rows="15"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;"></textarea>
					</div>
				</div>
				<label for="" style="font-size: 14px; margin-left: 10px;"
					id="contentLen">0</label>
				<hr>
				<!--면적 | 전용면적-->
				<h3>면적</h3>
				<div style="text-align: center;">
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 49%; min-height: 50px; border-radius: 8px;">
						<input type="text"
							style="width: 80%; min-height: 50px; border: 0px; font-size: 16px;"
							placeholder="전용 면적" id="place_da_1"><b
							style="font-size: 15px;">평</b>
					</div>
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 49%; min-height: 30px; border-radius: 8px;">
						<input type="text"
							style="width: 80%; min-height: 50px; border: 0px; font-size: 16px;"
							placeholder="전용 면적" id="place_da_2"> <b
							style="font-size: 15px;">㎡</b>
					</div>
				</div>
				<input type="hidden" value="" name="placeDa" id="place_da">
				<hr>
				<!--해당 층-->
				<h3>해당 층</h3>
				<div class="choose-floor">
					<select class="form-select form-select-lg mb-3"
						style="width: 100%; min-height: 40px; margin-bottom: 10px; padding-left: 10px; border-radius: 8px;"
						id="place_floor">
						<option selected>지상/지하를 선택하세요</option>
						<option value="지상">지상</option>
						<option value="지하">지하</option>
					</select>
					<p>소분류</p>
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
						<input type="text"
							style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
							placeholder="층수를 입력하세요" id="place_floor_detail"> <b
							style="font-size: 15px; min-height: 40px;">층</b>
					</div>
					<!-- 해당 인풋 태그에 최종 결과가 들어감 : 예) 지상 1층, 지하 2층...등 -->
					<input type="hidden" value="" name="placeFloor"
						id="place_floor_rst">
				</div>
				<hr>
				<h3>장소 이용 규칙</h3>
				<!--장소이용규칙-->
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding-left: 14px; line-height: 30px;">
						<p style="vertical-align: middle;">아래 예시를 참고하여 장소 이용 규칙을 입력하세요</p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 300px; padding: 10px">
						<textarea name="placeRule" id="place_rule" cols="10" rows="15"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;">
[시간 엄수]
- 계약된 시간을 꼭 준수하여 주시기 바랍니다.  
- 이용요금은 [시작시간] 및 [종료시간]으로 계약됩니다.
- 준비 및 세팅, 장비 철수 및 장소 원상복구 시간은 계약시간에 포함 되어있습니다.
- 계약된 예약시간을 초과할 경우 호스트가 추가결제를 요청할 수 있습니다.

[파손주의]
삼각대, 조명, 달리, 레일, 철제박스, 기타 장비로 인한 나무바닥과 벽지 파손에 꼭 주의 해주세요. (가정집 내부에서 진행하신다면 달리와 레일 설치는 금지되어 있습니다.)
- 준비물: 간단한 돗자리나 모포, 테니스 공을 준비해서 장비 밑에 꼭 깔아 공간을 보호해 주세요.
- 파손시: 현장에서 함께 확인 > 사진 촬영 > 견적 확인 후, 배상 요청을 진행하게 됩니다.

[총인원]
설정한 총인원이 지켜지지 않을 경우, 호스트가 예약을 취소하거나 추가결제를 요청할 수 있습니다.

[취식금지]
공간에서 취식은 항상 금지 되어있습니다. 부득이한 경우 호스트에게 먼저 양해를 꼭 구해주세요.

[에티켓]
- 주변 주민들을 위해 기본 에티켓을 지켜주세요.
- 주변 야외 이용은 불가능합니다.
- 현장에서 발생한 쓰레기는 모두 정리해주셔야 합니다.
- 주차는 안내된 주차대수에 한해 제공됩니다.
- 기존의 가구 세팅 및 구조를 필요에 의해 변경하신 경우 마감시간 전에 원상복구 해주셔야 합니다.
        </textarea>
					</div>
				</div>
				<hr>
				<h3>주변 정보</h3>
				<!--주변정보-->
				<div>
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px;">
						<p>게스트에게 호스트님의 장소 주변 정보를 알려주세요. 교통, 식당, 주차, 숙박 등 주변 정보를 알려주면
							많은 도움이 됩니다.</p>
					</div>
					<div
						style="border-radius: 15px; border: 1px solid lightgrey; min-height: 200px; padding: 10px">
						<textarea name="placeSurinfo" id="place_surinfo" cols="10"
							rows="13"
							style="border: 0px; width: 100%; height: 100%; outline: none; resize: none;"
							placeholder="주변 정보를 입력하세요"></textarea>
					</div>
				</div>
				<hr>
				<h3>세부 방 등록하기</h3>
				<p>
					세부 방 정보가 있을 시 방 정보를 등록해 주세요.<br>추가금액은 기본정보로 등록하신 금액에 추가되는 1인당
					금액 입니다.
				</p>
				<div class="add-extra-room">

					<table class="table table-added-item">
						<colgroup>
							<col width="50" scope="col" />
							<col width="100" scope="col" />
							<col width="100" scope="col" />
							<col width="100" scope="col" />
							<col width="100" scope="col" />
						</colgroup>
						<thead>
							<tr>
								<th>번 호</th>
								<th>세부 이름</th>
								<th>기본 인원</th>
								<th>추가 금액</th>
								<th>삭 제</th>
							</tr>
						</thead>
						<tbody class="detail_tbody"></tbody>
					</table>
					<table class="table table-input-item">
						<colgroup>
							<col width="80" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
						</colgroup>
						<tbody>
							<tr style="vertical-align: middle;" id="inputRoom">
								<td style="vertical-align: middle;">방 이름</td>
								<td style="vertical-align: middle;"><input type="text"
									class="room_title" size="10" /></td>
								<td style="vertical-align: middle;">기본 인원</td>
								<td style="vertical-align: middle;"><input type="text"
									class="base_num" size="5" /> 명</td>
								<td style="vertical-align: middle;">추가 금액</td>
								<td style="vertical-align: middle;"><input type="text"
									class="extra_chrg" size="5" /> 원</td>
								<td style="vertical-align: middle; text-align: center;">
									<!-- 장소 추가 버튼 -->
									<button type="button" class="btn btn-primary btn-add" id="btn1">
										추가</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
				<!-- 파일전송 시작. -->
				<div class="file">
					<h3>이미지 등록</h3>
					<p>사진은 최대 10장 등록 가능합니다.</p>
					<div class="file-name-div">
						<ul id="file-name" class="file-name"></ul>
					</div>
					<div class="form-group2" style="display: inline; width: 30px;">
						<label for="input-file" class="input-file-button">업로드</label> <input
							type="file" class="form-control-file" id="input-file"
							accept="image/*" multiple onchange="processSelectedFiles(this)"
							name="file" style="display: none;" />
					</div>
				</div>
				<hr>
				<!--시간당 대여 금액-->
				<h3>시간당 대여 금액</h3>
				<div clsaa="price-per-hour">
					<div
						style="width: 100%; border-radius: 8px; background-color: lightgray; margin-bottom: 5px; padding-left: 14px; line-height: 30px;">
						<p>유어플레이스의 시간당 금액은 호스트가 설정한 시간당 디여 금액과 게스트 수수료, PG 수수료,
							부가세(VAT)를 바탕으로 산정되어 설정하신 금액보다 높게 노출됩니다.</p>
					</div>
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
						<input type="text"
							style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
							placeholder="최소 10,000원 이상 입력하세요." id="place_price"
							name="placePrice"> <b
							style="font-size: 15px; min-height: 40px;">원</b>
					</div>
				</div>
				<hr>
				<!--최소 대여 시간-->
				<!--placeMinTime-->
				<div>
					<h3>최소 대여 시간</h3>
					<div clsaa="price-minTime">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								placeholder="최소 대여 시간을 입력하세요." id="place_min_time"
								name="placeMinTime"> <b
								style="font-size: 15px; min-height: 40px;">시간</b>
						</div>
					</div>
				</div>
				<hr>
				<!--주차 가능 대수-->
				<!--placeCapaCar-->
				<div>
					<h3>주차 가능 대수</h3>
					<div clsaa="place-capacar">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								placeholder="주차 가능 대수를 입력하세요" id="place_capa_car"
								name="placeCapaCar"> <b
								style="font-size: 15px; min-height: 40px;">대</b>
						</div>
					</div>

				</div>
				<hr>
				<!--기본 인원-->
				<!--placeCapa-->
				<div>
					<h3>기본 인원</h3>
					<div clsaa="place-capa">
						<div
							style="border: 1px solid lightgrey; display: inline-block; width: 100%; min-height: 30px; border-radius: 8px; text-align: center;">
							<input type="text"
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;"
								placeholder="기본 인원을 입력하세요" id="place_capa" name="placeCapa">
							<b style="font-size: 15px; min-height: 40px;">명</b>
						</div>
					</div>

				</div>
				<hr>
				<!--인원할증유형-->
				<!--placeExtrachrg-->
				<h3 style="margin-bottom: 10px;">할증 선택하기</h3>
				<p>할증 유형을 선택해주세요</p>
				<div class="extra-fee" id="extra-fee">

					<div class="extra-fee-title">인원 할증 유형</div>
					<div class="form-check default-fee">
						<input class="form-check-input" type="radio" name="placeExtrachrg"
							id="flexRadioDefault1" checked value="0" />
						<div class="fee-content">
							<label class="form-check-label extra-fee-sub-title"
								for="flexRadioDefault1"> 기본 할증 </label> <label
								class="form-check-label extra-fee-content"
								for="flexRadioDefault1"> 인원 초과 시 : 50% 할증 자동 적용 (예: 10명
								기준 11~19명) </br> 인원 2배부터 : 100% 할증 자동 적용 (예: 10명 기준 20명~29명) </br> 인원 3배부터
								: 150% 할증 자동 적용 (예: 10명 기준 30명~)
							</label>
						</div>
					</div>
					<div class="form-check add-one">
					<input class="form-check-input" type="radio"
								name="placeExtrachrg" id="flexRadioDefault2" value="1" /> 
						<div class="fee-content">
							
								<label
								class="form-check-label extra-fee-sub-title"
								for="flexRadioDefault2"> 1인 추가 시 시간당 5,500원 </label> 
								<label
								class="form-check-label extra-fee-content"
								for="flexRadioDefault2"> 설정 인원 초과 시 : 1인 추가 시 시간당 5,500원
								할증 자동 적용(부가세 포함) </label>
						</div>
					</div>
					<div class="form-check add-one-double">
					<input class="form-check-input" type="radio"
								name="placeExtrachrg" id="flexRadioDefault3" value="2" />
						<div class="fee-content">
							 <label
								class="form-check-label extra-fee-sub-title"
								for="flexRadioDefault3"> 1인 추가 시 시간당 11,000원 </label> <label
								class="form-check-label extra-fee-content"
								for="flexRadioDefault3"> 설정 인원 초과 시 : 1인 추가 시 시간당
								11,000원 할증 자동 적용(부가세 포함) </label>
						</div>
					</div>
				</div>
				<hr>
				<input type="button" class="btn btn-primary" id="submit-btn"
					value="장소 등록하기" style="width: 100%; height: 50px;"
					onclick="submitForm()">
				<div style="min-height: 100px;"></div>
			</form>

		</main>
	</div>

	<%-- <%@include file="../hostFooter.jsp"%> --%>

</body>
<script>
	$(document).ready(function() {
		$.ajax({
		//문서가 준비되면 서버에서 카테고리 소분류를 받아온다.

		});
	});
	//카테고리 클릭시 소분류 제공.
	$(document).on(
			'change',
			'#place_maincate',
			function() {
				var maincate = $("#place_maincate").val();
				const select = document.getElementById('place_cate');
				var smallcate = "";
				var home = [ '아파트', '주택', '빌라', '원룸', '한옥', '홈오피스' ];
				var studio = [ '자연광', '호리존', '유튜브', '단독주택형', '빈티지', '키친',
						'무대형', '세트장', '무인', '녹음실', '연습실', '파티룸', '스튜디오 기타' ];
				var commercial = [ '카페', '식당', '바/술집', '헬스장', '요가/필라테스',
						'기타 상업 공간' ];
				var facilities = [ '편의점', '빨래방', '헤어샵', 'PC방', '노래방', '오락실',
						'스포츠' ];
				var culture = [ '복합문화공간', '갤러리', '공방/작업실', '책방', '공연장', '강당',
						'강의실' ];
				var special = [ '사무실', '병원/약국', '교회', '경찰서', '학교', '학원', '클럽',
						'웨딩', '호텔/펜션', '기타 특수 공간' ];
				var large = [ '공장', '창고', '지하실', '빈 공간', '폐차장', '기타 대형 공간' ];
				var outdoor = [ '옥상', '정원', '공터', '캠핑장', '기타 야외 장소' ];
				switch (maincate) {
				case '가정집':
					addOptions(select, maincate, home);
					break;
				case '스튜디오':
					addOptions(select, maincate, studio);
					break;
				case '상업공간':
					addOptions(select, maincate, commercial);
					break;
				case '편의시설':
					addOptions(select, maincate, facilities);
					break;
				case '문화공간':
					addOptions(select, maincate, culture);
					break;
				case '특수공간':
					addOptions(select, maincate, special);
					break;
				case '대형공간/야외':
					addOptions(select, maincate, large);
					break;
				

				}
			});
	function addOptions(select, maincate, cate) {
		select.innerHTML = "";
		for (var i = 0; i < cate.length; i++) {
			var opt = document.createElement('option');
			opt.value = cate[i];
			opt.innerHTML = cate[i];
			select.appendChild(opt);
		}
	}

	function makeFloor() {
		let pf = $("#place_floor").val();
		let pfd = $("#place_floor_detail").val();
		let rst = pf + " " + pfd + '층';
		if (pf === '지상/지하를 선택하세요') {
			document.getElementById('place_floor').focus();
		}
		$("#place_floor_rst").val(rst);
		console.log(rst);
	}

	function makeHashTagStr() {
		var rst2 = '';
		$("#tag-list").children().each(
				function(index, element) {
					var rst1 = element.textContent.substring(0,
							element.textContent.lastIndexOf("| x") - 1);
					rst2 = rst1 + rst2;
					console.log(rst2);
				});
		$('#place_tag').val(rst2);
	}

	/* $(document).on('click','#submit-btn',function(){
	 // makeFloor();
	 makeHashTagStr();
	 var placeDa = $('#place_da_1').val()+"평/"+$('#place_da_2').val()+"㎡";
	 console.log($("input[name='placeExtrachrg']:checked").val());
	 $("#place_da").val(placeDa);
	 $("#submit-btn").submit();
	}); */
	function submitForm() {
		makeFloor();
		makeHashTagStr();
		var placeDa = $('#place_da_1').val() + "평/" + $('#place_da_2').val()
				+ "㎡";
		console.log($("input[name='placeExtrachrg']:checked").val());
		$("#place_da").val(placeDa);
		if ($('select[name=placeArea]').val() === '지역을 선택하세요') {
			$('select[name=placeArea]').focus();
			return;
		}
		if ($('input[name=placeAddr]').val() === '') {
			$('input[name=placeAddr]').focus();
			$("input[name=placeAddr]").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("input[name=placeAddr]").css({
				"border" : "1px solid black"
			});
		}

		if ($('select[name=placeMaincate]').val() === '지역을 선택하세요') {
			$('select[name=placeMaincate]').focus();
			return;
		}
		if ($('input[name=placeName]').val() === '') {
			$('input[name=placeName]').focus();
			$("input[name=placeName]").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("input[name=placeName]").css({
				"border" : "1px solid black"
			});
		}
		if ($('textarea[name=placeIntro]').val().length == 0) {
			$('textarea[name=placeIntro]').focus();
			return;
		}
		if ($('#place_da_1').val() === '') {
			$('#place_da_1').focus();
			$("#place_da_1").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("#place_da_1").css({
				"border" : "0px solid black"
			});
		}
		if ($("#place_floor") === '지상/지하를 선택하세요'
				|| $("#place_floor_detail").val() === '') {
			$("#place_floor_detail").focus();
			return;
		}
		if ($("#place_rule").val().length == 0) {
			$("#place_rule").focus();
			return;
		}
		if ($("#place_surinfo").val().length == 0) {
			$("#place_surinfo").focus();
			return;
		}

		if (!$("#input-file").val()) {
			alert("파일을 최소 1장이상 첨부하세요");
			return;
		}
		if ($("input[name=placePrice]").val() < 10000) {
			$("input[name=placePrice]").focus();
			$("input[name=placePrice]").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("input[name=placePrice]").css({
				"border" : "0px solid red"
			});
		}

		if ($("input[name=placeMinTime]").val() == 0) {
			$("input[name=placeMinTime]").focus();
			$("input[name=placeMinTime]").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("input[name=placeMinTime]").css({
				"border" : "0px solid red"
			});
		}

		if ($("input[name=placeCapa]").val() < 1) {
			$("input[name=placeCapa]").focus();
			$("input[name=placeCapa]").css({
				"border" : "1px solid red"
			});
			return;
		} else {
			$("input[name=placeCapa]").css({
				"border" : "0px solid red"
			});
		}
		$("#regist_form").submit();
	}
</script>

<script>
	$("#place_da_1").keyup(function() {
		var temp = $("#place_da_1").val() * 3.305;
		console.log(temp);
		$("#place_da_2").val(Math.floor(temp));
	});
	$("#place_da_2").keyup(function() {
		var temp = $("#place_da_2").val() * 0.3025;
		console.log(temp);
		$("#place_da_1").val(Math.floor(temp));
	});
</script>
<script>
	$("textarea[name=placeIntro]").keyup(function() {
		var content = $("textarea[name=placeIntro]").val();
		$("#contentLen").text(content.length);
	});
</script>

</html>
