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
                    onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'business');window.open('http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018322016230204057&amp;pageUnit=10&amp;searchCnd=wrkr_no&amp;searchKrwd=4948100558&amp;pageIndex=1')">
                    사업자정보확인
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'personal');window.location.href='/policy/personal'">
                    개인정보처리방침
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'service');window.location.href='/policy/service'">
                    이용약관
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="window.location.href='/service.html'"> <!-- hourplace_v2.userLog('W', '/place/29464', 'click', 'service');window.location.href='/service' -->
                    고객센터
                </p>
                <p style="margin-top: 12px; font-size: 12px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.17;letter-spacing: normal;color: #454b50;cursor: pointer;"
                    onclick="hourplace_v2.userLog('W', '/place/29464', 'click', 'policy', 'hr');window.open('https://www.notion.so/hourplace/fae9ceaf4a174479bf52a44305283045')">
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
                    (주)먼치팩토리 사업자 정보
                </p>
                <p
                    style="margin-top: 16px;font-size: 12px;font-weight: normal;font-stretch: normal;font-style: normal;line-height: 1.67;letter-spacing: normal;color: #9ea4aa;">
                    대표 서영석<br>
                    주소 서울특별시 강남구 압구정로2길 62 대성빌딩 202호<br>
                    사업자 등록번호 494-81-00558<br>
                    통신판매업신고번호 2018-서울강남-04057<br>
                    (주)먼치팩토리는 통신판매중개자로서, 통신판매의 당사자가 아니라는 사실을 고지하며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
                </p>

                <p
                    style="position:absolute; bottom: 50px;font-size: 11px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.36;letter-spacing: normal;color: #9ea4aa;">
                    © munchfactory Inc.
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