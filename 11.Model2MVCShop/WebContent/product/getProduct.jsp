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
<!--  bootstrap DropDown CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!--  bootstrap DropDown JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  CSS -->
<style>
     body {
            padding-top : 50px;
        }
</style>

<script type="text/javascript">
$(function () {
	$("td.ct_btn01:contains('����')").on("click", function(){
		$(self.location).attr("href","/purchase/addPurchaseView?prod_no="+$("#prodNo").text().trim());
	});
	$("td.ct_btn01:contains('����')").on("click", function(){
		history.go(-1);
	});
	$("#commentGo").on("click",function(){
		$("form").attr("action","/comment/addComment?prod_no="+${product.prodNo}).attr("method","POST").submit();
	});
	
});
</script>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">		
		<div class="page-header text-info">
			<a href="javascript:self.location=document.referrer;">
			<span class="glyphicon glyphicon-arrow-left">&nbsp;�ڷ�</span>
			</a>
			<h3>��ǰ����ȸ</h3>
			<c:if test="${param.menu == manage}">
			<h5 class="text-muted">��ǰ ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
			</c:if>	
	    </div>
	    
	    <div class="row">
			<div class="col-xs-12 col-md-6"><img src="/images/uploadFiles/${product.fileName}" width="auto" height="500px"/></div>
			<div class="col-xs-12 col-md-3"><h4><b>${product.prodName}</b></h4></div>
			<hr>
			<div class="col-xs-12 col-md-3"><h4>&#8361;${product.price}<small>&nbsp;��ۺ� ����</small></h4></div>
			<p>
		</div>
		
<!-- 	    <div class="row"> -->
<%-- 			<div class="col-xs-12 col-md-12"><h4><b>${product.prodName}</b></h4></div> --%>
<!-- 		</div> -->
		
<!-- 		<div class="row"> -->
<%-- 			<div class="col-xs-12 col-md-12"><h4>&#8361;${product.price}<small>&nbsp;��ۺ� ����</small></h4></div> --%>
<!-- 		</div> -->
		
		<div class="row">
			&nbsp;<p>
			&nbsp;<p>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-list-alt">��ǰ����</span></h3></div>
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-calendar">��������</span></h3></div>
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-calendar">�������</span></h3></div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-4" align="center">${product.prodDetail}</div>
			<div class="col-xs-4 col-md-4" align="center">${product.manuDate}</div>
			<div class="col-xs-4 col-md-4" align="center">${product.regDate}</div>
		</div>
		
		<div class="row">
			&nbsp;<p>
			&nbsp;<p>
			&nbsp;<p>
		</div>
		<hr>
		
		<div class="row">
			<button style="background-color: black; color: white; width: 100%; height: 40px;">
				<h6><span class="glyphicon glyphicon-shopping-cart">�����ϱ�</span></h6>
			</button>
		</div>
		
		<p>
		
	</div>
	
<!-- 	<form name="detailForm" method="post"> -->

<!-- 		<table width="100%" border="0" cellspacing="0" cellpadding="0" -->
<!-- 			style="margin-top: 13px;"> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">��ǰ��ȣ <img -->
<!-- 					src="/images/ct_icon_red.gif" width="3" height="3" -->
<!-- 					align="absmiddle" /> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 				<td class="ct_write01"> -->
<!-- 					<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 						<tr> -->
<%-- 							<td width="105" id="prodNo">${ product.prodNo }</td> --%>
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">��ǰ�� <img -->
<!-- 					src="/images/ct_icon_red.gif" width="3" height="3" -->
<!-- 					align="absmiddle" /> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01">${ product.prodName }</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">��ǰ�̹��� <img -->
<!-- 					src="/images/ct_icon_red.gif" width="3" height="3" -->
<!-- 					align="absmiddle" /> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01"><img src="/images/uploadFiles/${product.fileName}" width="auto" height="300px"/> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">��ǰ������ <img -->
<!-- 					src="/images/ct_icon_red.gif" width="3" height="3" -->
<!-- 					align="absmiddle" /> -->
<!-- 				</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01">${product.prodDetail}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">��������</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01">${product.manuDate}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">����</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01">${product.price}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td width="104" class="ct_write">�������</td> -->
<!-- 				<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 				<td class="ct_write01">${product.regDate}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
	
<!-- 		<br> -->
<!-- 		<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0"> -->
<!-- 			<tr> -->
<!-- 				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" -->
<!-- 					width="15" height="37"></td> -->
<!-- 				<td background="/images/ct_ttl_img02.gif" width="100%" -->
<!-- 					style="padding-left: 10px;"> -->
<!-- 					<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 						<tr> -->
<!-- 							<td width="93%" class="ct_ttl01">������</td> -->
<!-- 							<td width="20%" align="right">&nbsp;</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" -->
<!-- 					width="12" height="37" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
		
<!-- 		<table width="100%" border="0" cellspacing="0" cellpadding="0" -->
<!-- 				style="margin-top: 10px;"> -->
<!-- 				<tr> -->
<!-- 					<td class="ct_list_b" width="70%">����</td> -->
<!-- 					<td class="ct_line02"></td> -->
<!-- 					<td class="ct_list_b" width="30%">�������</td> -->
<!-- 					<td class="ct_line02"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="11" bgcolor="808285" height="1"></td> -->
<!-- 				</tr> -->
<%-- 				<c:set var="i" value="0"/> --%>
<%-- 				<c:forEach var="comment" items="${list}">  --%>
<%-- 					<c:set var="i" value="${i+1}"/> --%>
<!-- 				<tr class="ct_list_pop"> -->
<!-- 					<td align="center"> -->
<%-- 					${comment.reply}</td> --%>
<!-- 					<td></td> -->
<!-- 					<td align="center"> -->
<%-- 					${comment.inputDate}</td> --%>
<!-- 					<td></td> -->
<!-- 				</tr> -->
<%-- 				</c:forEach> --%>
<!-- 		</table> -->

<!-- 		<hr/> -->
									
<!-- 		<input type="text" name="reply" id="reply" class="ct_input_g" style="width: 100%; height: 30px"/> -->
								
<!-- 		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;"> -->
<!-- 			<tr> -->
<!-- 				<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td> -->
<!-- 				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"> -->
<%-- <%-- 					<a href="/comment/addComment?prod_No=${product.prodNo}">��۴ޱ�</a> --%>
<!-- 					<a href="#" id="commentGo">��۴ޱ�</a> -->
<!-- 				</td> -->
<!-- 				<td width="53%"></td> -->
<!-- 				<td align="right"> -->

<!-- 					<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 						<tr> -->
<%-- 							<c:if test="${product.proTranCode==null}">						 --%>
<!-- 							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" -->
<!-- 								width="17" height="23" /></td> -->
<!-- 							<td background="/images/ct_btnbg02.gif" class="ct_btn01" -->
<!-- 								style="padding-top: 3px;"> -->
<!-- 								����</td> -->
<!-- 							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" -->
<!-- 								width="14" height="23"></td> -->
<!-- 							<td width="30"></td> -->
<%-- 							</c:if> --%>
<!-- 							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" -->
<!-- 								width="17" height="23" /></td> -->
<!-- 							<td background="/images/ct_btnbg02.gif" class="ct_btn01" -->
<!-- 								style="padding-top: 3px;"> -->
<!-- 								����</td> -->
<!-- 							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" -->
<!-- 								width="14" height="23"></td> -->
<!-- 						</tr> -->
<!-- 					</table> -->

<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->

</body>
</html>