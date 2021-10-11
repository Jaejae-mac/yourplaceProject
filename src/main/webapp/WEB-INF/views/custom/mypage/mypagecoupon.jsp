<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage Coupon</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user-register.css" />" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 페이지 이동시 해당 날짜 계산 -->
	<c:set var="ToDay" value="<%=new java.util.Date()%>" />
	<fmt:parseNumber value="${ToDay.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
	<!-- 날짜 계산 끝 -->
	<!-- Header -->
	<%@ include file="../header.jsp" %>
	<!-- Header End -->
	<div class="h_column_center" id="main_vue" style="min-height: 1000px; margin-top: 100px">
        <div style="width: 1160px;">
            <div>
                <p style="font-size: 32px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.31;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
                    쿠폰
                </p>
            </div>
        </div>
		<!-- 쿠폰이 없다면 출력 -->
        <div style="width: 1160px;">
            <c:if test="${fn:length(couponList) == 0 }">
            	<div style="margin-top: 20px; width: 100%; height: 1px;background: #E7EAEE;"></div>
	            <div class="h_center" style="width: 1160px; height: 1000px;">
	            
	                <div class="h_column_center">
	                    <div class="h_center" style="width: 80px;height: 80px;background-color: #eff3f5;border-radius: 40px;">
	                        <img src="<c:url value="/resources/img/icon/register/nocoupon.PNG"/>" style="width: 60px;height: 60px;" />
	                    </div>
	                    <p style="margin-top: 20px;font-size: 24px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.33;letter-spacing: -0.3px;text-align: center;color: #1b1d1f;">
	                       	 보유중인 쿠폰이 없어요
	                    </p>
	                </div>
	            </div>
            </c:if>
            <!-- 끝 -->
            <c:if test="${fn:length(couponList) != 0 }">
            <div class="h_column_center" style="width: 100%; margin-top: 50px;">
                <div style="width: 100%; height: 1px;background: #E7EAEE;"></div>

                <div style="width: 1176px;">

                    <div class="h_row_center" style="margin-bottom: 24px;margin-top: 64px;margin-left: 10px;">
                        <p style="font-style: normal;font-weight: bold;font-size: 16px;line-height: 22px;letter-spacing: -0.1px;color: #1B1D1F;">
                            	전체
                        </p>
                        <p style="margin-left: 6px; font-style: normal;font-weight: bold;font-size: 15px;line-height: 14px;letter-spacing: -0.5px;color: #246FF8;">
                           ${fn:length(couponList)}
                        </p>
                    </div>

                    <div class="h_row" style="flex-wrap: wrap; margin-bottom: 40px;">
                        <c:forEach var="couponList" items="${couponList}">
                        <!-- 쿠폰 종료일 계산 -->
                        <fmt:parseNumber value="${couponList.coupEndD.time / (1000*60*60*24)}" integerOnly="true" var="endday"/>
                        <!-- 계산 끝 -->
                        <div style="padding: 5px;">
                            <div style="width: 274px; border: 1px solid #DFE2E7;border-radius: 10px; overflow: hidden;">
                                <div class="h_center" id="coup" style="background-color: #246FF8; width: 100%; height: 100px;">
                                    <input type="hidden" name="userCoupUseYn" id="userCoupUseYn" value="${userCoupUseYn}">
                                    <p style="font-style: normal;font-weight: 300;font-size: 32px;line-height: 38px;display: flex;align-items: center;text-align: center;letter-spacing: -0.1px;color: #FFFFFF;">
                                        ${couponList.coupDisRate}%
                                    </p>
                                </div>
                                <div style="width: 100%; background-color: #FFF; padding: 16px 0 20px 20px;">
                                    <p style="font-style: normal;font-weight: bold;font-size: 18px;line-height: 26px;letter-spacing: -0.1px;color: #1B1D1F;">
                                        	${couponList.coupName}
                                    </p>
                                    <div class="h_row" style="margin-top: 6px;">
                                        <p style="font-style: normal;font-weight: bold;font-size: 15px;line-height: 24px;color: #246FF8;">
                                            D - ${endday - today} 
                                        </p>
                                        <p style="margin-left: 15px; font-style: normal;font-weight: 400;font-size: 15px;line-height: 24px;color: #72787F;">
                                            (<fmt:formatDate value="${couponList.coupStartD}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${couponList.coupEndD}" pattern="yyyy-MM-dd"/>)
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>
    <!-- Footer -->
	<%@ include file="../footer.jsp" %>
	<!-- Footer 끝 -->
    <script>
    //사용한 쿠폰일경우 색깔 회색으로
        $(document).ready(function(){
            if($(document).getElementById('userCoupUseYn').value == "N"){
                $(document).getElementById('coup').style.backgroundColor = '#72787F';
            }else{
                $(document).getElementById('coup').style.backgroundColor = '#246FF8';
            }
        });
    </script>
</body>
</html>