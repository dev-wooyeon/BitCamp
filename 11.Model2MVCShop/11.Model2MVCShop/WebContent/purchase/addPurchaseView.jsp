<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!--  bootstrap Dropdown CSS & JS  -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!--  post CDN -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!--  kakao CDN -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--  CSS -->
<style>
     body {
            padding-top : 50px;
     }
     
   	#footer{
		position:relative;
		bottom : 0;
		background: black; 
		color:white; 
		width: 100%; 
		height: 100px;
	}
	
	label{
		margin-top: 40px;
	}

</style>

<title>결제페이지</title>

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">
	
	$(function(){
		
		$("#kakaoPay").on("click",function(){
			
			$.ajax({
				url : "https://kapi.kakao.com/v1/payment/ready" ,
				method : "POST",
				dataType : "json",
				data :  convertSearch ,
				contentType: "application/x-www-form-urlencoded; charset=euc-kr",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json;charset=euc_kr"
				},
				success : function(JSONData, status){				
					$("#searchKeyword").autocomplete({
						source : JSONData
					});
				}
			});
		});
	});
	function sample4_execDaumPostcode() {
	new daum.Postcode({
    	oncomplete: function(data) {
    		 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            // document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample").value = roadAddr;
            //data.jibunAddress
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//             if(roadAddr !== ''){
//                 document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//             } else {
//                 document.getElementById("sample4_extraAddress").value = '';
//             }

//             var guideTextBox = document.getElementById("guide");
//             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//             if(data.autoRoadAddress) {
//                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                 guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//                 guideTextBox.style.display = 'block';

//             } else if(data.autoJibunAddress) {
//                 var expJibunAddr = data.autoJibunAddress;
//                 guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//                 guideTextBox.style.display = 'block';
//             } else {
//                 guideTextBox.innerHTML = '';
//                 guideTextBox.style.display = 'none';
//             }
    	}
	}).open();
	}
	
	function fncAddPurchase() {
		
		$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
	}
	
	$(function(){
		
		$("#reset").on("click", function(){
			$("form")[0].reset();
		});
		
		$("button.btn.btn-primary").on("click", function(){
			fncAddPurchase();
			
// 					Kakao.API.request({
// 				        url: '/v1/payment/ready',
// 				    	Authorization: 'fb37f365e82d4a3b62d2464496fd49a2',
// 				    	cid: "TC0ONETIME",
// 						partner_order_id: 'partner_order_id',
// 						partner_user_id: 'partner_user_id',
// 						item_name: '라이언',
// 						quantity: 1,
// 						total_amount: 1000,
// 						vat_amount: 200,
// 						tax_free_amount: 0,
// 						approval_url: '//developers.kakao.com/success',
// 						fail_url: '//developers.kakao.com/fail',
// 						cancel_url: '//developers.kakao.com/cancel',
// 				        success: function(res) {
// 				          	alert('성공');
// 				        },
// 				        fail: function(error) {
// 				          	alert('실패');
// 				        }
// 				      })    
			      
			    
		});
	});
	
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
		<div class="page-header">
			<a href="javascript:self.location=document.referrer;">
				<span class="glyphicon glyphicon-arrow-left">&nbsp;뒤로</span>
			</a>
			<hr>
			<h5 class="text-info">
				<span class="glyphicon glyphicon-lock"> <b>회원주문</b></span>
			</h5>
		</div>
				
		<form class="form-horizontal" name="addPurchase" enctype="multipart/form-data">
			
			<!-- 해당 상품 결제를 위한 상품 번호 -->
			<input type="hidden" name="prodNo" value="${product.prodNo}" />
			
			<div class="row">
				<div class="col-xs-6 com-md-8">
					<div>
						<strong>받으시는 분</strong><br/>
	  					<input type="text" name="receiverName" style="width: 200px; height: 25px; border: 1px solid #000000;" maxLength="20" value="${user.userName}" />
	  					<br/>
	  					<br/>
	  					<strong>연락처</strong><br/>
	  					<input type="text" name="receiverPhone" style="width: 200px; height: 25px; border: 1px solid #000000;" maxLength="20" value="${user.phone}" />
	  					<br/>
	  				</div>
	  				
	  				<hr/>
	  				
	  				<div>
	  					<strong>수령받으실 주소</strong>&nbsp;
<<<<<<< HEAD
	  					<input type="button" style="font-size: 12px;height: 30px; width: 90px; border: 1px solid #000000; background-color: #000000; color: #FFFFFF;" onclick="sample4_execDaumPostcode()" value="주소찾기">
=======
	  					<input type="button" style="font-size: 12px;height: 30px; width: 90px; border: 1px solid #000000; background-color: #000000; color: #FFFFFF;" onclick="sample4_execDaumPostcode()" value="주소찾기"/>
>>>>>>> refs/remotes/origin/master
	  					<br/>
	  					<input type="text" id="sample" name="divyAddr" style="width: 200px; height: 25px; border: 1px solid #000000;" maxLength="20" value="${user.addr}" />
	  					<br/>
	  				</div>
	  				
	  				<hr/>
	  				
	  				<div>
	  					<strong>요청사항</strong><br>
	  					<input type="text" name="divyRequest" style="width: 200px; height: 25px; border: 1px solid #000000;" maxLength="20" />
	  				</div>
	  				
	  				<hr/>
	  				
	  				<div>
	  					<strong>결제방식</strong><br>
	  					<select name="paymentOption" class="form-control" style="width: 200px; height: 32px; border: 1px solid #000000;"> 
	  						<option value="1" selected="selected">카카오페이</option>
							<option value="2">무통장입금</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6 com-md-4" align="center">
					<img src="/images/uploadFiles/${product.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" width="250px" height="250px"/>
					<h4><b>${product.prodName}</b></h4>
					<h4>&#8361;${product.price}<small>&nbsp;배송비 제외</small></h4>
					<h4><b> 수량 : ${amount}</b></h4>
					<input type="hidden" name="amount" value="${amount}"/>
					<h5>가격 : ${amount * product.price} </h5>
				</div>
			</div>
			
			
<!-- 			<div class="row"> -->
<%-- 				<div class="col-xs-4 col-md-2" align="right"><img src="/images/uploadFiles/${product.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" width="250px" height="250px"/></div>			 --%>
<!-- 			</div> -->
		
			<hr/>
			
			<div class="row">
	  			<div class="col-md-12 text-center">
	  				<img alt="" src="/images/openApi-Images/payment_icon_yellow_medium.png" id="kakaoPay"/>
	  				<button type="button" class="btn btn-primary">구매</button>
	  				<a id="reset" class="btn btn-primary btn" role="button">재입력</a>
	  			</div>
			</div>
	
		</form>
	</div>
	
	<p>
	
	<div id=footer align="center">
		<label>Copyright.</label>
	</div>
</body>
</html>