<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->
 <script>


function cancelPay() {
      jQuery.ajax({
        "url": "", // 예: http://www.myservice.com/payments/cancel
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": " merchant_1632760138528", // 예: ORD20180131-0000011
          "cancel_request_amount": 100, // 환불금액
          "reason": "테스트 결제 환불" // 환불사유
        }),
        "dataType": "json"
      });
    }
</script>

  <script>

    var mongoose = require('mongoose');
    var Schema = mongoose.Schema;
    var PaymentsSchema = new Schema({
    imp_uid: String, // 아임포트 `unique key`(환불 요청시 `unique key`로 사용)
    merchant_uid: String, // 주문번호(결제정보 조회시 사용)
    amount: { type: Number, default: 0 }, // 결제 금액(환불 가능 금액 계산시 사용)
    cancel_amount: { type: Number, default: 0 }, // 환불 된 총 금액(환불 가능 금액 계산시 사용)

  });

  module.exports = mongoose.model('Payments', PaymentsSchema);
  var Payments = require('./models/payments');
  app.post('/payments/cancel', async (req, res, next) => {
    try {
      /* 액세스 토큰(access token) 발급 */
      /* ... 중략 ... */
      /* 결제정보 조회 */
      const { body } = req;
      const { merchant_uid } = body; // 클라이언트로부터 전달받은 주문번호
      Payments.find({ merchant_uid }, async function(err, payment) { 
        const paymentData = payment[0]; // 조회된 결제정보
        const { imp_uid, amount, cancel_amount } = paymentData; // 조회한 결제정보로부터 imp_uid, amount(결제금액), cancel_amount(환불된 총 금액) 추출
        const cancelableAmount = amount - cancel_amount; // 환불 가능 금액(= 결제금액 - 환불 된 총 금액) 계산
        if (cancelableAmount <= 0) { // 이미 전액 환불된 경우
          return res.status(400).json({ message: "이미 전액환불된 주문입니다." });
        }
      
        /* 아임포트 REST API로 결제환불 요청 */
        const getCancelData = await axios({
          url: "", // 예: http://www.myservice.com/payments/cancel
          method: "post",
          headers: {
            "Content-Type": "application/json",
            "Authorization": "514c157838f531b12e8f0fa1eea042da33e1bf6c",
            "now": "1632759586",
   		 "expired_at": "1632761386"
            
            // 아임포트 서버로부터 발급받은 엑세스 토큰
          },
          data: {
            reason, // 가맹점 클라이언트로부터 받은 환불사유
            imp_uid : 'unique key'
            , // imp_uid를 환불 `unique key`로 입력
            amount: 100, // 가맹점 클라이언트로부터 받은 환불금액
            checksum: 100 // [권장] 환불 가능 금액 입력
          }
        });
        const { response } = getCancelData.data; // 환불 결과
        /* 환불 결과 동기화 */

      });
    } catch (error) {


    }
    
  });
        if (err) {
      
        }
        
        const paymentData = payment[0]; // 조회된 결제정보
        /* 아임포트 REST API로 결제환불 요청 */
        const { response } = getCancelData.data; // 환불 결과
        /* 환불 결과 동기화 */
        const { merchant_uid } = response; // 환불 결과에서 주문정보 추출
        Payments.findOneAndUpdate({ merchant_uid }, response, { new: true }, function(err, payment) { // 주문정보가 일치하는 결제정보를 추출해 동기화
          if (err) {
            return res.json(err);
          }
          res.json(payment); // 가맹점 클라이언트로 환불 결과 반환
        
      });
   
    

  </script>
</head>
<body>
  <input type="button" onclick="cancelPay()" value="환불">

</body>
</html>