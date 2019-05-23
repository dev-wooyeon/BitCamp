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

<!--  CSS -->
<style>
     body {
            padding-top : 50px;
        }
</style>

<title>����������</title>

<script type="text/javascript" src="../javascript/calendar.js">
	
</script>

<script type="text/javascript">

	function fncAddPurchase() {
		
		$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
	}
	
	$(function(){
		
		$("#reset").on("click", function(){
			$("form")[0].reset();
		});
		
		$("button.btn.btn-primary").on("click", function(){
			fncAddPurchase();
		});
	});
	
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
		<div class="page-header">
			<a href="javascript:self.location=document.referrer;">
				<span class="glyphicon glyphicon-arrow-left">&nbsp;�ڷ�</span>
			</a>
			<hr>
			<h5 class="text-info">
				<span class="glyphicon glyphicon-lock"> <b>ȸ���ֹ�</b></span>
			</h5>
		</div>
				
		<form class="form-horizontal" name="addPurchase" enctype="multipart/form-data">
			
			<!-- �ش� ��ǰ ������ ���� ��ǰ ��ȣ -->
			<input type="hidden" name="prodNo" value="${product.prodNo}" />
		
			<div class="row">
	  				<div class="col-xs-2 col-md-1" align="right"><strong>�̸�: </strong></div>
	  				<div class="col-xs-2 col-md-1"><input type="text" name="receiverName" class="form-control" style="width: 200px; height: 19px" maxLength="20" value="${user.userName}" /></div>
			</div>
			
			<div class="row">
	  				<div class="col-xs-2 col-md-1" align="right"><strong>����ó: </strong></div>
	  				<div class="col-xs-2 col-md-1"><input type="text" name="receiverPhone" class="form-control" style="width: 200px; height: 19px" maxLength="20" value="${user.phone}" /></div>
			</div>
			
			<div class="row">
	  				<div class="col-xs-2 col-md-1" align="right"><strong>�ּ�: </strong></div>
	  				<div class="col-xs-2 col-md-1"><input type="text" name="divyAddr" class="form-control" style="width: 200px; height: 19px" maxLength="20" value="${user.addr}" /></div>
			</div>
			
			<div class="row">
	  				<div class="col-xs-2 col-md-1" align="right"><strong>��û����: </strong></div>
	  				<div class="col-xs-2 col-md-1"><input type="text" name="divyRequest" class="form-control" style="width: 200px; height: 19px" maxLength="20" /></div>
			</div>
			
			<div class="row">
	  				<div class="col-xs-2 col-md-1" align="right"><strong>���Ź��: </strong></div>
	  				<div class="col-xs-2 col-md-1">
	  					<select name="paymentOption" class="ct_input_g" style="width: 200px; height: 19px"> 
	  						<option value="1" selected="selected">���ݱ���</option>
							<option value="2">�ſ뱸��</option>
						</select>
					</div>
			</div>
			
			
<!-- 			<div class="row"> -->
<%-- 				<div class="col-xs-4 col-md-2" align="right"><img src="/images/uploadFiles/${product.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" width="250px" height="250px"/></div>			 --%>
<!-- 			</div> -->
		
			<hr/>
			
			<div class="row">
	  			<div class="col-md-12 text-center ">
	  				<button type="button" class="btn btn-primary">����</button>
	  				<a id="reset" class="btn btn-primary btn" role="button">���Է�</a>
	  			</div>
			</div>
	
		</form>
	</div>

	<jsp:include page="/layout/bottom.jsp"></jsp:include>
	
</body>
</html>