<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
<!DOCTYPE html>
<html lang="ko">
<head>
<<<<<<< HEAD
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
=======
>>>>>>> refs/remotes/origin/master

<<<<<<< HEAD
=======
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!--  bootstrap DropDown CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!--  bootstrap DropDown JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- jQuery CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

>>>>>>> refs/remotes/origin/master
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	
	$(function(){
<<<<<<< HEAD
		$("td:nth-child(1)").on("click",function(){
=======
		$(".list td:nth-child(1)").on("click",function(){
			self.location="/product/getProduct?prodNo="+$(this).children("input").val()+"&menu=search";
		});
		
		$(".list td:nth-child(2)").on("click",function(){
>>>>>>> refs/remotes/origin/master
			self.location="/purchase/getPurchase?tranNo="+$(this).children("input").val();
		});
		
<<<<<<< HEAD
		$("td:nth-child(2)").on("click",function(){
=======
		$(".list td:nth-child(3)").on("click",function(){
>>>>>>> refs/remotes/origin/master
			self.location="/user/getUser?userId="+$(this).children("input").val();
		});
		
<<<<<<< HEAD
		$("td:nth-child(1)").css("color","red");
=======
		$(".list td:nth-child(2)").css("color","red");
>>>>>>> refs/remotes/origin/master
		$("h7").css("color","red");
		
<<<<<<< HEAD
		$("td:nth-child(2)").css("color","blue");
=======
		$(".list td:nth-child(3)").css("color","blue");
>>>>>>> refs/remotes/origin/master
		
<<<<<<< HEAD
		//$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		$("#state").on("click",function(){
			//alert($(this).children("#tranNo").val())
=======
		$("#state").on("click",function(){
			//alert($(this).children("#tranNo").val());
>>>>>>> refs/remotes/origin/master
			//alert($(this).children("#userId").val())
<<<<<<< HEAD
			$(self.location).attr("href","/purchase/updateTranCodeByTranNo?tranNo="+$(this).children("#tranNo").val()+"&tranCode="+$(this).children("#tranCode").val()+"&test=1");
=======
			$(self.location).attr("href","/purchase/updateTranCodeByTranNo?tranNo="+$(this).children("#tranNo").val()+"&userId="+$(this).children("#userId").val());
>>>>>>> refs/remotes/origin/master
			alert('���ɿϷ�ó�� �Ǿ����ϴ�.')
		});
		
	});
</script>

<!-- CSS -->
<style type="text/css">
	body{
		padding-top: 50px;
		height: 100%;
	}
</style>
</head>

<body>
<<<<<<< HEAD
	
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<form>
	<input type="hidden" id="menu" value="${param.menu}">
	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	<div class="container">
	
		<div class="page-header text-info">
			<h3>���Ÿ����ȸ</h3>
		</div>
	
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
				</p>
			</div>
		</div>
		
		<table class="table table-hover table-striped">
=======

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
	
	<div class="container">
		
		<div class="page-header text-info">
			<a href="javascript:self.location=document.referrer;">
				<span class="glyphicon glyphicon-arrow-left">&nbsp;�ڷ�</span>
			</a>
			<h3>���� ���</h3>
		</div>
<%-- 		<c:forEach var="purchase" items="${list}"> --%>
<!-- 		<div class="col-md-2"> -->
<%-- 			<img src="/images/uploadFiles/${purchase.purchaseProd.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" style="width: 250px; height: 250px;"/> --%>
<!-- 		</div> -->
		
<!-- 		<div class="col-md-10"> -->
			
<!-- 		</div> -->
<%-- 		</c:forEach> --%>
		<div class="row">
	    	<div class="col-md-12 text-left">
	    		<p class="text-primary">
	    			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
	 			</p>
	    	</div>
	    </div>
	    
	    <h7>�̹��� Ŭ���� �ش� ��ǰ���� �̵��մϴ�.</h7>
	    <hr/>
	    
	    <div class="row">
	    	<div class="col-md-6 col-sm-5 col-xm-12">
	    		
	    	</div>
	    </div>
		
		<table class="table table-hover table-striped">
		
>>>>>>> refs/remotes/origin/master
			<thead>
				<tr>
<<<<<<< HEAD
					<th>�ŷ���ȣ</th>
					<th>ȸ��ID</th>
					<th>ȸ����</th>
					<th>��ȭ��ȣ</th>
					<th>����ּ�</th>
					<th>��ǰ��Ȳ</th>
=======
					<th align="center">��ǰ�̹���</th>
					<th align="left">�ŷ���ȣ</th>					
					<th align="left">ȸ��ID</th>
					<th align="left">ȸ����</th>
					<th align="left">��ȭ��ȣ</th>
					<th align="left">����ּ�</th>
					<th align="left">�����Ȳ</th>
>>>>>>> refs/remotes/origin/master
				</tr>
			</thead>
			
<<<<<<< HEAD
			<tbody>
=======
			<tbody style="vertical-align: middle;" class="list">
				<c:set var="i" value="0"/>
>>>>>>> refs/remotes/origin/master
				<c:forEach var="purchase" items="${list}">
<<<<<<< HEAD
					<c:set var="i" value="${ i+1 }" />
				<tr>
				<td align="center">
					<input type="hidden" id="tranNo" value="${purchase.tranNo}">
					${ i }
					</td>
					
					<td align="left">
					<input type="hidden" id="userId" value="${user.userId}">
					${user.userId}
					</td>
					
					<td align="left">${purchase.receiverName}</td>
					
					<td align="left">${purchase.receiverPhone}</td>
					
					<td align="left">
					${purchase.divyAddr}</td>
					
					<td align="left">
=======
					<c:set var="i" value="${i+1}"/>
					<tr>
						<td align="center">
							<input type="hidden" id="prodNo" value="${purchase.purchaseProd.prodNo}">
							<img src="/images/uploadFiles/${purchase.purchaseProd.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" style="width: 50px; height: auto;"/>
						</td>
						<td align="center">
							<input type="hidden" id="tranNo" value="${purchase.tranNo}">
							${ i }
						</td>
						<td align="left">
							<input type="hidden" id="userId" value="${user.userId}">
							${user.userId}
						</td>
						<td align="left">
							${purchase.receiverName}
						</td>
						<td align="left">
							${purchase.receiverPhone}
						</td>
						<td align="left">
							${purchase.divyAddr}
						</td>
					
						<td align="left">
>>>>>>> refs/remotes/origin/master
						<c:if test="${purchase.tranCode=='000'}">
							���ſϷ�	
						</c:if>
						<c:if test="${purchase.tranCode=='001'}">
							�����
<<<<<<< HEAD
							<a id="state">�����ϱ�
								<input type="hidden" id="tranCode" value="002">
								<input type="hidden" id="tranNo" value="${purchase.tranNo}">
								<input type="hidden" id="userId" value="${user.userId}">
=======
							<a id="state">
								<input type="hidden" id="tranNo" value="${purchase.tranNo}">
								<input type="hidden" id="userId" value="${user.userId}">
								�����ϱ�
>>>>>>> refs/remotes/origin/master
							</a>
						</c:if>
						<c:if test="${purchase.tranCode=='002'}">
							��ۿϷ�	
						</c:if>
<<<<<<< HEAD
					</td>
				<tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

	<jsp:include page="../common/pageNavigator_new.jsp"/>	
	</form>		

=======
						</td>
					<tr>
				</c:forEach>
			</tbody>
		</table>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	
	</div>
>>>>>>> refs/remotes/origin/master
</body>
</html>