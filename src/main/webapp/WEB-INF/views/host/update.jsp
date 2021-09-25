<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Reserve</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />
    <link href="<c:url value="/resources/host/css/style-coupon.css" />"
	rel="stylesheet" />
    <link href="<c:url value="/resources/host/css/styles.css" />"
	rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
  

  <script>
  
  $(document).ready(function () {
      var tag = {};
      var counter = 0;

      // 입력한 값을 태그로 생성한다.
      function addTag (value) {
          tag[counter] = value;
          counter++; // del-btn 의 고유 id 가 된다.
      }

      // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
      function marginTag () {
          return Object.values(tag).filter(function (word) {
              return word !== "";
          });
      }
  
      // 서버에 제공
      $("#tag-form").on("submit", function (e) {
          var value = marginTag(); // return array
          $("#rdTag").val(value); 

          $(this).submit();
      });

      $("#tag").on("keypress", function (e) {
          var self = $(this);

          //엔터나 스페이스바 눌렀을때 실행
          if (e.key === "Enter" || e.keyCode == 32) {

              var tagValue = "#"+ self.val(); // 값 가져오기

              // 해시태그 값 없으면 실행X
              if (tagValue !== "") {

                  // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                  var result = Object.values(tag).filter(function (word) {
                      return word === tagValue;
                  })
              
                  // 해시태그가 중복되었는지 확인
                  if (result.length == 0) { 
                      $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                      addTag(tagValue);
                      self.val("");
                  } else {
                      alert("같은 태그는 입력하실 수 없습니다.");
                  }
              }
              e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
          }
      });

      // 삭제 버튼 
      // 인덱스 검사 후 삭제
      $(document).on("click", ".del-btn", function (e) {
          var index = $(this).attr("idx");
          tag[index] = "";
          $(this).parent().remove();
      });
})

  
  </script>
  
  </head>
  <body class="sb-nav-fixed">
   <%@include file="hostnav.jsp" %>
        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">장소 수정</h1>
              <div class="card mb-4">
        
              </div>
              <c:forEach var="update" items="${updatePlace}">
           

  			 <p style="font-size: large;">${ update.placeMainCategory} / ${update.placeCategory}<p>
   		
   			<input type="text" name="placeName" id="placeName" style="width:700px; height:50px; poition:relative; top:400px; right:90px" value="${update.placeName}"/>
<br>
		<p style="font-size: large;"> 지역 :	${update.placeLocation } <br>상세 주소 : ${update.placeAddress}</p>
		
					<div class="tr_hashTag_area">
						<p>
							<strong>해시태그 등록</strong>
						</p>
						<div class="form-group">
							<input type="hidden" value="" name="tag" id="rdTag" />
						</div>

						<ul id="tag-list"></ul>

						<div class="form-group">
							<input type="text" id="tag" size="7"
								placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;" />
								
							<li class='tag-item'>${update.placeTag}<span class='del-btn' idx='"+counter+"'> x </span></li>
						</div>
					</div>
					<br><br>
					
					<p style="font-size: large;">장소 소개 </p>
					<textarea rows="10" cols="100">${update.placeIntro}</textarea>

				<h3>면적</h3>
				<div style="text-align: center;">
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 49%; min-height: 50px; border-radius: 8px;">
						<input type="text"
							style="width: 50%; min-height: 50px; border: 0px; font-size: 16px;"
							placeholder="전용 면적" id="place_da_1"><b
							style="font-size: 15px;">평</b>
					</div>
					<div
						style="border: 1px solid lightgrey; display: inline-block; width: 49%; min-height: 30px; border-radius: 8px;">
						<input type="text"
							style="width: 50%; min-height: 50px; border: 0px; font-size: 16px;"
							placeholder="전용 면적" id="place_da_2"> <b
							style="font-size: 15px;">㎡</b>
					</div>
				</div>
				<input type="hidden" value="" name="placeArea" id="placeArea">
				<br><br>
				<input type="text" value="${update.placeFloor }"/>
						
						<br><br>
						<p style="font-size: large;">장소 규칙 </p>
					<textarea rows="10" cols="100">${update.placeRule}</textarea>
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
							placeholder="최소 10,000원 이상 입력하세요." id="place_price" value="${update.placePrice}"
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
								placeholder="최소 대여 시간을 입력하세요." id="place_min_time" value="${update.placeMinTime }"
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
								placeholder="주차 가능 대수를 입력하세요" id="place_capa_car" value="${update.placeCarNum }"
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
								style="width: 90%; min-height: 40px; border: 0px; font-size: 16px;" value="${update.placePersonNum }"
								placeholder="기본 인원을 입력하세요" id="place_capa" name="placeCapa">
							<b style="font-size: 15px; min-height: 40px;">명</b>
						</div>
					</div>
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
							placeholder="주변 정보를 입력하세요">${update.placeSubInfo }</textarea>
					</div>
				</div>
					

				</c:forEach>    

						
          </div>
        </div>
    
		<button type="button" class="btn btn-primary" 
										style="font-size: 20px; margin-left: 10px;" id="insert" name="insert">등록</button>
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
	<script
		src="<c:url value="/resources/host/js/scripts.js" />"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
  crossorigin="anonymous"
></script>

<script
  src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
  crossorigin="anonymous"
></script>
	<script
		src="<c:url value="/resources/host/js/datatables-simple-demo.js" />"></script>
  </body>
</html>
<!-- 


  toggle : toggleReview
 -->
    