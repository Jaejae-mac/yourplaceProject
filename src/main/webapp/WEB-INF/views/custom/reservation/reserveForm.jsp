<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/custom/css/detail-place.css" />" />
    <title>yourplace - 결제 하기</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    />
    
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <!--jquery 밑에.-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
      
    <style>
      .flipsnap_sub_list .next{
        top:50%;
        right:30px;
        font-size:2em;
        color:gray;
        cursor: pointer;
      }
      .flipsnap_sub_list .prev{
        top:50%;
        left:30px;
        font-size:2em;
        color:gray;
        cursor: pointer;
      }
</style>
<style type="text/css">
  #d1{
   width:770px;
   margin:0 auto;
  }
  
 </style>
  </head>
  <body style="min-height: 1000px">
	<%@ include file="../header.jsp" %>

    <div id="main_vue" class="h_column_center" style="min-height: 1000px;">
      <div style="width: 1160px;margin-top:60px">
        <p
        class="h_center"
          style="
            margin-top: 50px;
            font-size: 32px;
            font-weight: bold;
            font-stretch: normal;
            font-style: normal;
            line-height: 1.31;
            letter-spacing: -0.3px;
            color: rgb(27, 29, 31);
          "
        >
          예약하기
        </p>
        <div
              style="
                margin-top: 30px;
                width: 100%;
                height: 1px;
                background-color: rgb(149, 183, 227);
              "
            ></div>
        <div class="h_row_center" style="margin-top: 19px; height: 24px">
          <div
            class="h_row_center"
            style="cursor: pointer"
          >
            
          </div>
        </div>
        <div class="h_row" style="width: 100%">
          <div style="position: relative; width: 720px">
            <div
              class="h_row_center"
              style="position: absolute; top: -10px; right: 0px;"
            >
              
            </div>
            
            
            <div
              class="flipsnap_container"
              style="
                margin-top: 20px;
                overflow: hidden;
                
                width: 100%;
                height: 220px;
                border-radius: 6px;
                border: 1px solid rgb(223, 226, 231);
                background-color: rgb(255, 255, 255);
              "
            >
            <!--상단 큰 이미지 리스트 영역.-->
            <!--상단과 하단에 같은 이미지를 같은 순서대로 나열해야 한다.-->
              <div
                class="reserve_info"
                style="
                  
                  width: 100%;
                  min-width: 100%;
                  transition-property: transform;
                  transition-timing-function: cubic-bezier(0, 0, 0.25, 1);
                  transition-duration: 350ms;
                  transform: translate3d(0px, 0px, 0px);
                "
              >
              <h4 style="
              margin-left:20px;
              font-size: 16px;
              font-weight: bold;
              font-stretch: normal;
              font-style: normal;
              line-height: 1.44;
              letter-spacing: -0.1px;
              color: rgb(27, 29, 31);

              ">예약 공간</h4>
              <div
              style="
                margin-top: 10px;
                margin-left: 20px;
                margin-right: 20px;
                width: 94%;
                height: 1px;
                background-color: rgb(149, 183, 227);
              "></div>
              <div
              class="h_row_center"
              style="
                position: absolute;
                margin-top: 30px;
                height: 60px;
                width: 100%;
              "
            >
            
              <div
                class="h_row_center"
                style="
                  max-width: 583px;
                  height: 60px;
                  width: fit-content;
                  cursor: pointer;
                "
              >
              
              <!--프로필 이미지.-->
                <div 
                  style="
                    width: 200px; height: 150px; 
                    margin-top:50px;
                    margin-left:20px;
                    margin-right:20px;
                    ">
                  <img
                    src="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/${placeInfo.placeThumb }"
                    style="
                      width: 100%;
                      height: 100%;
                      border-radius: 6px;
                      border: 1px solid rgb(223, 226, 231);
                      object-fit: cover;
                    "
                  />
                </div>
                <!--프로필 이미지 끝.-->
                <div
                  style="
                    max-width: 513px;
                    margin-right: 20px;
                    width: fit-content;
                    margin-top:30px;
                  "
                >
                  <div style="width: fit-content">
                    <p
                      style="
                        font-size: 19px;
                        font-weight: 500;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.43;
                        letter-spacing: normal;
                        color: rgb(114, 120, 127);
                      "
                    >
                     장소명
                    </p>
                    <!--호스트 닉네임 시작.-->
                    <p
                      style="
                        margin-top: 1px;
                        font-size: 19px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      ${placeInfo.placeName }
                    </p>
                    <div
                      class="h_center"
                      style="
                        margin-top: 8px;
                        border-radius: 5px;
                        border: 1px solid rgb(36, 111, 248);
                        width: 200px;
                        height: 28px;
                  "
                >
                  <p
                    style="
                      font-size: 12px;
                      font-weight: bold;
                      font-stretch: normal;
                      font-style: normal;
                      line-height: 1.17;
                      letter-spacing: -0.1px;
                      margin-bottom: 0px;
                      color: rgb(36, 111, 248);
                    "
                  >
                    호스트 닉네임
                  </p>
                  &nbsp;&middot;&nbsp;
                  <p
                  style="
                    font-size: 12px;
                    font-weight: bold;
                    font-stretch: normal;
                    font-style: normal;
                    line-height: 1.17;
                    letter-spacing: -0.1px;
                    margin-bottom: 0px;
                    color: rgb(36, 111, 248);
                  "
                >
                  ${placeInfo.hostNickName }
                </p>
                </div>
				
                  </div>
                  
                </div>
                  
              </div>
              
            </div>
            
            </div>
            
            </div>
            <input type="hidden" value="${placeInfo.hostNickName}" id="nick_name"/>
            <!---->
            <div style="width: 100%; margin-top: 50px">
              <div
                style="
                  border-radius: 10px;
                  border: 1px solid rgb(223, 226, 231);
                  background-color: rgb(255, 255, 255);
                "
              >
                <div style="margin: 30px">
                  
                  <div
                    class="h_row_center"
                    style="margin-top: 8px; flex-wrap: wrap"
                  >
                    
                    
                  </div>
                  <div
                  
                    style="
                      margin-top: 8px;
                      display: flex;
                      flex-direction: row;
                      align-items: flex-end;
                    "
                  >
                  <p
                      style="
                         font-size: 16px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.44;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      예약자 정보
                    </p>
                 
                    
                  </div>
                  <div
                  style="
                    margin-top: 10px;
                    width: 100%;
                    height: 1px;
                    background-color: rgb(149, 183, 227);
                  "></div>

                  <!--세부 방 항목 선택 라디오버튼.-->
                 
                 
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      예약자 <label style="color: blue;font-size: 17px;">*</label>
                    </p>
                  </div>
                  <div style=" position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        height: 45px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                    >
                      <input type="text" id="user_name" name="userName" placeholder="예약자 성함" style="width: 100%;height: 90%;outline: none;border: 0px;font-size: 13px;padding-left: 10px;">
                      
                    </div>
                    <!--booking calendar toggle start-->
                     <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      연락처 <label style="color: blue;font-size: 17px;">*</label>
                    </p>
                  </div>
                  <div style=" position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        height: 45px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                    >
                      <input type="text" id="user_tel" name="userTel" placeholder="전화 번호 ' - 빼고 입력' (010XXXXXXXX)" 
                      style="width: 100%;height: 90%;outline: none;border: 0px;font-size: 13px;padding-left: 10px;">
                      
                    </div>
                    </div>
                  </div>
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      이메일 <label style="color: blue;font-size: 17px;">*</label>
                    </p>
                  </div>
                  <div style=" position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        height: 45px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                    <input type="text" id="user_email" name="userEmail" placeholder="이메일 (example@example.com)" 
                      style="width: 100%;height: 90%;outline: none;border: 0px;font-size: 13px;padding-left: 10px;">
                      
                    </div>
                  </div>
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      사용목적 <label style="color: blue;font-size: 17px;">*</label>
                    </p>
                  </div>
                  <div style=" position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        height: 45px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                    <input type="text" id="rsv_purpose" name="rsvPurpose" placeholder="사용 목적을 기입해주세요." 
                      style="width: 100%;height: 90%;outline: none;border: 0px;font-size: 13px;padding-left: 10px;">
                      
                    </div>
                  </div>
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      요청사항 <label style="color: blue;font-size: 17px;">*</label>
                    </p>
                  </div>
                  <div style=" position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        height: 150px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                    <textarea id="rsv_request" name="rsvRequest" placeholder="요청 사항을 기입해주세요." 
                    cols="10" rows="10" maxlength="100" 
                    style="width: 100%;height: 90%;resize:none;outline: none;border: 0px;font-size: 13px;padding-left: 10px;padding-top:10px"></textarea>
                    </div>
                    <div style="float: right;"><label id="word_cnt">0</label>/100</div>
                  </div>
              </div>
          </div>
        </div>
            <!---->
            <div style="
              margin-top: 20px;
              margin-left: 10px;
              display: flex;
              flex-direction: row;
              align-items: flex-end;
            "
          >
          <p
              style="
                 font-size: 16px;
                font-weight: bold;
                font-stretch: normal;
                font-style: normal;
                line-height: 1.44;
                letter-spacing: -0.1px;
                color: rgb(27, 29, 31);
              "
            >
              예약시 주의사항
            </p>
          </div>
          <div
              style="
                margin-top: 5px;
                width: 100%;
                height: 1px;
                background-color: rgb(40, 121, 227);
              "
            ></div>
          <p>
            7.5(가로) x 6.5(세로) x 3m(높이), 촬영 거리 최대 10m 호리존 특성상 음식물 및 액체류 반입 금지 입니다.<br>
            촬영에 필요한 신발 외에 외부 신발을 신고 입장을 금합니다 ( 슬리퍼 or 일회용 커버 제공 )<br>
            호리존 훼손 및 파손시 원상복구를 원칙으로 합니다<br>

          </p>
            
            <!--프로필 영역 시작.-->
            <div style="
            margin-top: 20px;
            margin-left: 10px;
            display: flex;
            flex-direction: row;
            align-items: flex-end;
          "
        >
        <p
            style="
               font-size: 16px;
              font-weight: bold;
              font-stretch: normal;
              font-style: normal;
              line-height: 1.44;
              letter-spacing: -0.1px;
              color: rgb(27, 29, 31);
            "
          >
            이용 약관 동의
          </p>
        </div>
            <div
              style="
                width: 100%;
                height: 1px;
                background-color: rgb(40, 121, 227);
              "
            ></div>
            <div class="h_center" >
              <div action="" method="get" id="form1">
            <div id="d1" >
              <div style="margin-left:30px;margin-top:20px;margin-bottom: 10px;">
                <font size="3">모두 동의</font>
                <input type="checkbox" name="all" id="all" style="width: 15px;height:15px;">
              </div>
              <div id="accordionArea" style="margin-left: 20px;">
               
                <h3><font size="2">유어플레이스 이용약관 동의(필수)</font><input type="checkbox" name="c1" id="c1" style="width: 15px;height:15px;margin-left: 5px;"/></h3>
                <textarea readonly="readonly" rows="5" cols="66" style="width:100%;resize:none;min-height:200px;">
제 1 조 (목적)
이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버 및 네이버 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
             
             
제 2 조 (정의)
             
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
                </textarea>
                <h3><a href="#"><font size="2">환불규정 안내에 대한 동의(필수) - 내용보기</font><input type="checkbox" name="c2" id="c2" style="width: 15px;height:15px;margin-left: 5px;"/></a></h3>
                <div style="padding:0px;border:0px;min-height:200px">
                  <textarea readonly="readonly" rows="5" cols="66" style="width:100%;resize:none;min-height:200px;padding-left: 30px;">             
1. 개인정보를 제공받는 자: 해당 공간의 호스트
2. 제공하는 개인정보 항목
  - 필수항목: 네이버 아이디, 이름, 연락처, 결제정보(결제방식 및 결제금액)
  - 선택항목: 이메일 주소
3. 개인정보의 제공목적: 공간예약 및 이용 서비스 제공, 환불처리
4. 개인정보의 제공기간: 서비스 제공기간(단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우에는 해당 기간 동안 보관합니다.)
5. 개인정보의 제공을 거부할 권리: 개인정보 주체는 개인정보의 제공을 거부할 권리가 있으나, 공간 예약을 위해 반드시 필요한 개인정보의 제공으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.
</textarea>
                </div>
                <h3><font size="2">개인정보 수집 및 이용 동의 (필수) - 내용보기</font><input type="checkbox" name="c3" id="c3" style="width: 15px;height:15px;margin-left: 5px;"/></h3>
                <div style="padding:0px;border:0px;min-height:200px">
                  <textarea readonly="readonly" rows="5" cols="66" style="width:100%;resize:none;min-height:200px;padding-left: 30px;">
1. 수집하는 개인정보의 항목
  - 예약정보(성명, 이메일주소, 휴대전화번호), 결제정보(신용카드 번호 및 은행계좌정보 일부 등)

2. 개인정보의 이용목적
  - 공간 예약 및 이용
                    
3. 개인정보의 보관기간
  - 예약 완료 후 관련 법령에 따라 5년간 개인정보를 보관합니다.
                    
4. 개인정보의 수집 및 이용을 거부할 권리
  - 개인정보 주체는 개인정보의 수집 및 이용을 거부할 권리가 있으나, 공간 예약을 위한 최소한의 개인정보 수집으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.
              </textarea>
                </div>
              </div>
               
              
             </div>
             </div>
             <!-- check Box 이벤트처리를 위한 Script -->
             </div>
            <div
              style="
                margin-top: 100px;
                width: 100%;
                display: flex;
                flex-wrap: wrap;
              "
            ></div>
            
            
          </div>
          <div style="width: 400px; margin-left: 40px; position: relative">
            <div style="width: 100%; margin-top: 20px">
              <div
                style="
                  border-radius: 10px;
                  border: 1px solid rgb(223, 226, 231);
                  background-color: rgb(255, 255, 255);
                "
              >
                <div style="margin: 30px">
                  
                  <div
                    class="h_row_center"
                    style="margin-top: 8px; flex-wrap: wrap"
                  >
                    
                    
                  </div>
                  <div
                  
                    style="
                      margin-top: 8px;
                      display: flex;
                      flex-direction: row;
                      align-items: flex-end;
                    "
                  >
                  <p
                      style="
                         font-size: 16px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.44;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      결제 예정 정보
                    </p>
                 
                    
                  </div>
                              <div
                class="h_center"
                style="
                  margin-top: 8px;
                  border-radius: 5px;
                  border: 1px solid rgb(36, 111, 248);
                  width: 200px;
                  height: 28px;
                  
            "
          >
            <p
              style="
                font-size: 12px;
                font-weight: bold;
                font-stretch: normal;
                font-style: normal;
                line-height: 1.17;
                letter-spacing: -0.1px;
                margin-bottom: 0px;
                color: rgb(36, 111, 248);
              "
            >
              선택된 세부 장소
            </p>
            &nbsp;&middot;&nbsp;
            <p
            style="
              font-size: 12px;
              font-weight: bold;
              font-stretch: normal;s
              font-style: normal;
              line-height: 1.17;
              letter-spacing: -0.1px;
              margin-bottom: 0px;
              color: rgb(36, 111, 248);
            "
          >
            ${placeInfo.detailTitle }
          </p>
          </div>
    
                  <div
                  style="
                    margin-top: 10px;
                    width: 100%;
                    height: 1px;
                    background-color: rgb(149, 183, 227);
                  "></div>

                  <!--세부 방 항목 선택 라디오버튼.-->
                 
                 
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      예약 날짜
                    </p>
                  </div>
                  <div style="margin-top: 10px; position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        margin-top: 8px;
                        height: 52px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                      <p
                        style="
                          padding: 0px 14px;
                          font-size: 15px;
                          font-weight: normal;
                          font-stretch: normal;
                          font-style: normal;
                          line-height: 1.6;
                          letter-spacing: normal;
                          margin-bottom: 0px;
                          color: black;
                        "
                      >
                        ${placeInfo.rsvYear}/${placeInfo.rsvMonth }/${placeInfo.rsvDate}
                      </p>
                      
                    </div>
                    <!--booking calendar toggle start-->
                    <div
                      class="booking_calendar"
                      style="
                        display: none;
                        position: absolute;
                        z-index: 2;
                        top: 74px;
                        right: 0px;
                        width: 540px;
                        border-radius: 8px;
                        box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px;
                        border: 1px solid rgb(239, 243, 245);
                        background-color: rgb(255, 255, 255);
                      "
                    >
                    </div>
                  </div>
                  <div style="position: relative">
                    <div class="h_row_center" style="margin-top: 20px">
                      <p
                        style="
                          font-size: 14px;
                          font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                        "
                      >
                        예약 시간
                      </p>
                    </div>
                    <div style="margin-top: 10px; position: relative" id="bookingPeople">
                      <div
                        class="h_row_center"
                        style="
                          margin-top: 8px;
                          height: 52px;
                          border-radius: 4px;
                          border: 1px solid rgb(223, 226, 231);
                          cursor: pointer;
                        "
                      >
                        <p
                          style="
                            padding: 0px 14px;
                            font-size: 15px;
                            font-weight: normal;
                            font-stretch: normal;
                            font-style: normal;
                            line-height: 1.6;
                            letter-spacing: normal;
                            margin-bottom: 0px;
                            color:black;
                          "
                          id="people_cnt"
                        >
                          ${placeInfo.rsvStartT }:00 ~ ${placeInfo.rsvEndT }:00 (${placeInfo.rsvEndT-placeInfo.rsvStartT }시간)
                        </p>
                      </div>
                    </div>
                    <!-- 시작시간 종료시간. -->
                	<input type="hidden" name="rsvStartT" value="${placeInfo.rsvStartT }" id="rsv_start_t"/>
                	<input type="hidden" name="rsvEndT" value="${placeInfo.rsvEndT }" id="rsv_end_t"/>
                  </div>
                  <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      예약 인원
                    </p>
                  </div>
                  <div style="margin-top: 10px; position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        margin-top: 8px;
                        height: 52px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                      <p
                        style="
                          padding: 0px 14px;
                          font-size: 15px;
                          font-weight: normal;
                          font-stretch: normal;
                          font-style: normal;
                          line-height: 1.6;
                          letter-spacing: normal;
                          margin-bottom: 0px;
                          color: black;
                        "
                      >
                        <label style="font-weight:normal;">${placeInfo.headCount }</label> 명
                      </p>
                      
                    </div>
                    </div>
                     <div class="h_row_center" style="margin-top: 20px">
                    <p
                      style="
                        font-size: 14px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.38;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      쿠폰 선택
                    </p>
                  </div>
                  <div style="margin-top: 10px; position: relative">
                  
                    <div
                      class="h_row_center"
                      style="
                        margin-top: 8px;
                        height: 52px;
                        border-radius: 4px;
                        border: 1px solid rgb(223, 226, 231);
                        cursor: pointer;
                      "
                      id="bookingCalendar"
                    >
                     <select name="couponList" id="coupon_list" style="width:100%;min-height:30px;outline:none;border:0px;margin-left:5px;margin-right:5px">
                     	<option value="none" selected>[ 쿠폰 선택 ]</option>
                     <c:forEach var="coupon" items="${myCouponList }">
                     	<option value="${coupon.coupNum}#${coupon.coupDisRate}#${coupon.coupName}">[ ${coupon.coupName} ] ${coupon.coupDisRate}%할인</option>	
                     </c:forEach>
                     	
                     </select>
                      
                    </div>
                  <div
                  style="
                    margin-top: 30px;
                    width: 100%;
                    height: 1px;
                    background-color: rgb(40, 121, 227);
                  "
                ></div>
                <!--예상 금액-->
                  <div
                  class="h_center"
                    style="
                      margin-top: 20px;
                      display: flex;
                      flex-direction: row;
                      align-items: flex-end;
                    "
                  >
                  <p
                      style="
                         font-size: 16px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.44;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      예상 금액 :
                    </p>
                    &nbsp;
                    <p
                      style="
                        font-size: 16px;
                        font-weight: bold;
                        font-stretch: normal;
                        font-style: normal;
                        line-height: 1.44;
                        letter-spacing: -0.1px;
                        color: rgb(27, 29, 31);
                      "
                    >
                      <label for="" style="margin-bottom: 0px;" id="place_price">${placeInfo.placePrice }</label>원
                    </p>
                    
                  </div>
                  <!---->
                  <div style="position: relative;margin:0 auto;">
                    <div class="request on" style="min-height: 30px;width:48%;display:inline-block">
                      <div class="btn btn-primary" style="width: 100%; vertical-align: middle;" id="reserve_btn">
                      <p style="width:100%;margin-bottom: 0px;min-height: 30px;line-height:30px">결제 하기</p>
                      </div>  
                    </div>
                    <div class="request on" style="min-height: 30px;width:48%;display:inline-block;margin-left:9px">
                    <div class="btn btn-danger" style="width: 100%; vertical-align: middle;" id="cancel_btn">
                      <p style="width:100%;margin-bottom: 0px;min-height: 30px;line-height:30px">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</p>
                      </div>  
                      </div>
                  </div>
                  
                
              </div>
              
          </div>
          
        </div>
        
      </div>
      </div>
      </div>
      </div>
      <%@ include file="../footer.jsp" %>
  </body>
  
  <script>
    $(document).ready(function(){
      $(function() {
        $( "#accordionArea" ).accordion();
        $('#accordionArea input[type="checkbox"]').click(function(e) {
        e.stopPropagation();
    });
    var doc = document; 
               var form1 = doc.getElementById('form1'); 
               var inputs = form1.getElementsByTagName('INPUT'); 
               var form1_data = {
                "c1": false,  //전체 선택
                "c2": false,  //필수 선택 1
                "c3": false   //필수 선택 2
               }; 
              
               var c1 = doc.getElementById('c1'); 
               var c2 = doc.getElementById('c2'); 
               var c3 = doc.getElementById('c3'); 
              
               function checkboxListener() {
                form1_data[this.name] = this.checked; //각각 자신의 checkBox를 Checked 상태로 바꿈 
               }
              
              
                c1.onclick = c2.onclick = c3.onclick = checkboxListener;   //c1, C2, C3를 checkBoxListenner를 호출하여
                                                                                //Checked로 바꿈
                var all = doc.getElementById('all');  //전체 체크를 위한 체크박스 선언
              
                all.onclick = function() {  //전체 체크를 누를 시
                 if (this.checked) {
                  setCheckbox(form1_data, true);   //form1_data(c1,c2,c3)의 값을 모두 Checked로 바꿈
                 } else {
                  setCheckbox(form1_data, false);  ////form1_data(c1,c2,c3)의 값을 모두 no checked로 바꿈
                 }
                }; 
              
              
                function setCheckbox(obj, state) { //checkbox상태 변경하는 함수
                 for (var x in obj) {
                  obj[x] = state; 
              
                  for(var i = 0; i < inputs.length; i++) {
                   if(inputs[i].type == "checkbox") {
                    inputs[i].checked = state; 
                   }
                  }
              
                 }
                } 
	});
    });
    $("#user_tel").keyup(function(){
      $("#user_tel").val( $("#user_tel").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });
    $("#rsv_request").keyup(function(){
      var txt = $("#rsv_request").val();
      var cnt = txt.length;
      $("#word_cnt").text(cnt);
    });
     
  </script>
  <script>
  	$("#coupon_list").change(function(){
  		
  		console.log($(this).val());
  		//var placePrice = parseInt($("#place_price").text());
  		
  		if($(this).val() === 'none'){
  			placePrice = "${placeInfo.placePrice}";
  			$("#place_price").text(placePrice);
  		}else{
  			 //const cn = placePrice.toLocaleString('ko-KR');
  			var couponValue = $(this).val().split("#");
  			console.log(couponValue);
  			var originalPrice = "${placeInfo.placePrice}";
  			console.log(originalPrice);
  			//할인률을 가져온다.
  			var disRate = parseInt(couponValue[1]);
  			console.log(disRate);
  			var rstPrice = parseInt(originalPrice.replace(",","")) * ((100-disRate)/100);
  			console.log(rstPrice);  			
  			const cn = rstPrice.toLocaleString('ko-KR');
  			console.log(cn);
  			$("#place_price").text(cn); 
  			
  		}
  		
  		
  		
  	});
  </script>
  <!-- 결제 모듈. -->
  <script type="text/javascript">
  //결제하기 버튼 클릭시.
  $("#reserve_btn").click(function(){
	  console.log("결제하기 클릭.");
	  var teltest = /^\d{3}-\d{3,4}-\d{4}$/; //전화번호 정규식
	  var emailtest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
	  var code = '';
	  var name = $("#user_name").val().trim();
	  var agree = $("#all").is(':checked')
	  if(name == ""){
		  Swal.fire({
         		icon: 'error',
          		title: '예약을 하실수 없습니다.',
         		text: '예약자 성함을 입력해주세요.'
         	});
		  return false;
	  }else if(!teltest.test($("#user_tel").val())){
		  Swal.fire({
			  icon: 'error',
			  title: '예약을 하실수 없습니다.',
			  text: '전화번호을 제대로 입력해주세요.'
			  });
		  return false;
	  }else if(!emailtest.test($("#user_email").val())){
		  Swal.fire({
			  icon: 'error',
			  title: '예약을 하실수 없습니다.',
			  text: '이메일을 제대로 입력해주세요.'
			  });
		  return false;
	  }else if(!agree){
		  Swal.fire({
			  icon: 'error',
			  title: '예약을 하실수 없습니다.',
			  text: '약관에 동의해 주시기 바랍니다.'
			  });
		  return false;
	  }else{
	  $.ajax({
		  type:"post",
		  url:"/importnum.do"
	  }).done(function(data){
		  var arr = {};
		  console.log('port Number : ' + data);
		  var couponNum=$("#coupon_list").val().split("#");
		  code = data;
		  arr.placeNum = ${placeInfo.placeNum};
		  arr.placeName = "${placeInfo.placeName}";
		  arr.rsvName = $("#user_name").val();
		  arr.rsvEmail = $("#user_email").val();
		  arr.rsvTel = $("#user_tel").val();
		  arr.invBfTax = $("#place_price").text().replace(",","");
		  arr.rsvPurpose = $("#rsv_purpose").val();
		  arr.rsvRequest = $("#rsv_request").val();
		  arr.userNum = "${userVO.userNum}";
		  arr.rsvStartT= $("#rsv_start_t").val();
		  arr.rsvEndT =$("#rsv_end_t").val();
		  arr.rsvYear="${placeInfo.rsvYear}";
		  arr.rsvMonth="${placeInfo.rsvMonth}";
		  arr.rsvDate ="${placeInfo.rsvDate}";
		  arr.headCount = "${placeInfo.headCount}";
		  arr.placeDetailNum = "${detailNum}";
		  arr.payCoupNum=couponNum[0];
		  arr.coupDisRate = couponNum[1];
		  arr.userId = "${userVO.userId}";
		  arr.placeMaincate = "${placeMaincate}";
		  arr.placeCate = "${placeCate}";
		  var userEmail =$("#user_email").val();
		  var placeName  = "${placeInfo.placeName}";
		  var userName=$("#user_name").val();
		  var userTel =$("#user_tel").val();
		  var placePrice= $("#place_price").text().replace(",","");
		  arr.hostNickName=$("#nick_name").val();
		  iamport(code,placeName,userEmail,userName,userTel,placePrice,arr);	
  		});
	  }
  });
  
  $("#cancel_btn").click(function(){
	 swal({
			title : "취소",
			text : "결제를 취소 하시겠습니까?",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : false,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				swal({
					title:'', 
					text:'홈화면으로 돌아갑니다.', 
					type:"success"	
				}, function(){
					location.href="/home.do";	
				});
				
			}

		});
	
  });
  
  
  function iamport(code,placeName,userEmail,userName,userTel,placePrice,arr){//code : 가맹점 식별 코드. 
		//가맹점 식별코드
		IMP.init(code);
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'yourplace_' + new Date().getTime(),
		    name : '[ yourplace ] '+placeName , //결제창에서 보여질 이름
		    amount : placePrice, //실제 결제되는 가격
		    buyer_email : userEmail,
		    buyer_name : userName,
		    buyer_tel : userTel,
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport.do?imp_uid=" + rsp.imp_uid
			}).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
	        		//예약번호
	        		//결제승인번호
	        		//결제금액
	        		//할인율
	        		//
	        		arr.payNum = rsp.imp_uid;
		        	arr.orderNum = rsp.merchant_uid;
	        		$.ajax({
					 type:"POST",
					 url:"/registReserve.do",
					 dataType:"json",
					 async:false,
				     data: arr,
				     success:function(data){
				    	if(data == '0'){
				    	/* 	var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num; */
					        var valueList = "?placeName=${placeInfo.placeName}&placeNum=${placeInfo.placeNum}";
					        var couponInfo=$("#coupon_list").val().split("#");//쿠폰정보.
					        var coupName = couponInfo[2];//쿠폰 이름.
					        var pp = $("#place_price").text(); //현재 적용되어있는 가격. 
					        console.log("coupName = " + coupName);
	    					valueList += ("&coupName="+coupName);    			
					        valueList+=("&rsvName="+$("#user_name").val());
					        valueList+=("&rsvEmail="+$("#user_email").val());
					        valueList+=("&rsvTel="+$("#user_tel").val());
					        valueList+=("&rsvPurpose="+$("#rsv_purpose").val());
					        valueList+=("&rsvRequest="+$("#rsv_request").val());
					        valueList+=("&reservationTime=${placeInfo.rsvStartT }:00 ~ ${placeInfo.rsvEndT }:00 (${placeInfo.rsvEndT-placeInfo.rsvStartT }시간)");
					        valueList+=("&reservationDate=${placeInfo.rsvYear}년 ${placeInfo.rsvMonth }월 ${placeInfo.rsvDate}일");
					        valueList+=("&headCount=${placeInfo.headCount }");
					        valueList+=("&placePrice="+pp);
					        
					        location.href="/rsvResult.do"+valueList;
				    	}
				     }
					});
	        	} else {
	        		Swal.fire({
	           			icon: 'error',
	            		title: '결제 실패',
	            		text: '결제를 실패하였습니다.',
	            	})
	        	}
	        });
		    /* if ( rsp.success ) {
		        arr.payNum = rsp.apply_num;
		        arr.orderNum = rsp.merchant_uid;
		        
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    } */
		    alert(msg); 
		}); 
  }
  </script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</html>