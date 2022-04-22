<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  bootstrap DropDown CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!--  bootstrap DropDown JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--  CSS -->
<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<div class="page-header">
			<a href="javascript:self.location='/product/listProduct'">
			<span class="glyphicon glyphicon-arrow-left">&nbsp;리스트로</span>
			</a>
			<h3 class="text-info">구매 내역</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>구매자 아이디</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>구매방법</strong>
			</div>
			<div class="col-xs-8 col-md-4">${! empty purchase.paymentOption=='1' ? "카카오페이" : "무통장입금"}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>받으시는 분</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>연락처</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>받으시는 주소</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>고객 요청사항</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>

	</div>
</body>
</html>