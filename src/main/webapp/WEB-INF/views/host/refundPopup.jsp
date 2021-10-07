<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body style="overflow-x:hidden; overflow-y:hidden;">
	<div id="riview">
		<div
			style="position: relative; width: 420px; border-radius: 12px; box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 8px 0px; border: 1px solid rgb(239, 243, 245); background-color: rgb(255, 255, 255);"
			, class="riview">
			<p
				style="margin-top: 30px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31); width: 100%; text-align: center;">
				환불 신청</p>
		
				
				<input type="hidden" name="type" value="direct">
				<div
					style="padding: 12px 14px; border-radius: 8px; background-color: var(- -grey-010);">
					<p
						style="font-size: 14px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: var(- -grey-060); text-align: center;">
					
					</p>
				</div>
			




				<p
					style="margin-top: 20px; font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-040);">
					내용</p>
				<div
					style="margin-top: 8px; height: 192px; padding: 14px; border-radius: 4px; border: solid 1px var(- -grey-025);">
					<textarea placeholder="환불사유를 남겨주세요" id="contents" name="contents"
						style="width: 100%; height: 100%; border-width: 0px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: var(- -grey-080);"></textarea>
				</div>
				<div class="riview" style="margin-top: 30px; text-align: center;">
					<p>
						<button type="button" class="btn btn-primary" onClick="a();"
							style="font-size: 10px; margin-left: 10px;">확인</button>
					</p>

				</div>
			
		</div>
	</div>


</body>

<script>


function a()
{
	var arr1 = new Array();
	var contentV = $('#contents').val();
	
	console.log(contentV);
	arr1.push(contentV);
	
	console.log(arr1);
	

	
	$.ajax(

	{
			url : '/refundReason.hdo',
			dataType : 'text',
			async    : false,
			type : 'POST',
			 async: false,
			 data: {
				 RefundReason: arr1,	      	
		      },
		      
		      success: function(data){
		      	 	window.close();
		          	 	  	 	 
		             
		      }
		})
	};

</script>
</html>