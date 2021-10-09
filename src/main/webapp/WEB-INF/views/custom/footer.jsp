<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sample.css" />">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<footer>
   <!--footer-->
    <div style="flex-direction: row;display: flex;justify-content: center;background-color: #fafbfb;">
        <div class="h_row_center" style="width: 1160px; height: 310px">

            <div style="position:relative;min-width: 300px;padding-top: 40px;height: 100%;">
                <p style="font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="location.href='/footerbs.do'">
                    사업자정보확인
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="location.href='/footerpv.do'">
                    개인정보처리방침
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="location.href='/footertos.do'">
                    이용약관
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="location.href='/quesForm.do'"> <!-- hourplace_v2.userLog('W', '/place/29464', 'click', 'service');window.location.href='/service' -->
                    고객센터
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="location.href='/footertr.do'">
                    인재채용
                </p>

                <div style="position:absolute; bottom: 50px;">
                    <p
                        style="font-size: 15px;font-weight: normal;font-stretch: normal;font-style: normal;line-height: 1.47;letter-spacing: -0.1px;color: #454b50;">
                        team@hourplace.co.kr</p>
                </div>
            </div>

            <div style="position:relative; width: 860px;padding-top: 40px; height: 100%">

                <p
                    style="font-size: 15px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.33;letter-spacing: -0.1px;color: #9ea4aa;">
                    (주)Connect 사업자 정보
                </p>
                <p
                    style="margin-top: 16px;font-size: 12px;font-weight: normal;font-stretch: normal;font-style: normal;line-height: 1.67;letter-spacing: normal;color: #9ea4aa;">
                    대표 BYLA<br>
                    주소 서울특별시 강남구 ***로*길 ** **빌딩 ***호<br>
                    사업자 등록번호 132-234-123456<br>
                    통신판매업신고번호 1111-1234-1234<br>
                    (주)Connect는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
                </p>

                <p
                    style="position:absolute; bottom: 50px;font-size: 11px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.36;letter-spacing: normal;color: #9ea4aa;">
                    © Connect Inc.
                </p>

                <div class="h_row_center" style="position:absolute; bottom: 50px; right: 0;">
                    <div class="h_column_center" style="width: 32px;height: 32px;cursor: pointer;"
                        onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'sns', 'instagram');window.open('http://instagram.com/hourplace/?hl=ko')">

                    </div>
                </div>
            </div>
        </div>
        <!--footer 끝-->
</footer>
</body>
</html>