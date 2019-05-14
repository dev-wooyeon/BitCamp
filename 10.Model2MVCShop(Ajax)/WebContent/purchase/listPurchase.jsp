<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?&menu="+$("#menu").val()).submit();
	}
	
	$(function(){
		$(".ct_list_pop td:nth-child(1)").on("click",function(){
			self.location="/purchase/getPurchase?tranNo="+$(this).children("input").val();
		});
		
		$(".ct_list_pop td:nth-child(3)").on("click",function(){
			self.location="/user/getUser?userId="+$(this).children("input").val();
		});
		
		$(".ct_list_pop td:nth-child(1)").css("color","red");
		$("h7").css("color","red");
		
		$(".ct_list_pop td:nth-child(3)").css("color","blue");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		$(".ct_list_pop td:nth-child(11)").on("click",function(){
			//alert($(this).children("#tranNo").val())
			//alert($(this).children("#userId").val())
			$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/updateTranCodeByTranNo?tranNo="+$(this).children("#tranNo").val()+"&userId="+$(this).children("#userId").val());
			alert('수령완료처리 되었습니다.')
		});
		
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">구매 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재
						${resultPage.currentPage} 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">
					거래번호<br>
					<h7> (click : 주문정보) </h7>
					</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">
					회원ID<br>
					<h7> (click : 회원정보) </h7> 
					</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">회원명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">전화번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">배송주소</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b"width="125">물품현황</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">
					<input type="hidden" id="tranNo" value="${purchase.tranNo}">
					${ i }
					</td>
					<td></td>
					<td align="left">
					<input type="hidden" id="userId" value="${user.userId}">
					${user.userId}
					</td>
					<td></td>
					<td align="left">${purchase.receiverName}</td>
					<td></td>
					<td align="left">${purchase.receiverPhone}</td>
					<td></td>
					<td align="left">
					${purchase.divyAddr}</td>
					<td></td>
					<td align="left">
						<input type="hidden" id="tranNo" value="${purchase.tranNo}">
						<input type="hidden" id="userId" value="${user.userId}">
						<c:if test="${purchase.tranCode=='000'}">
							구매완료	
						</c:if>
						<c:if test="${purchase.tranCode=='001'}">
							배송중
							<a id="state">수령하기</a>
						</c:if>
						<c:if test="${purchase.tranCode=='002'}">
							배송완료	
						</c:if>
					</td>
					<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					<td align="left">
					</td>
			<td></td>
				</c:forEach>
			</table>
					
			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /><jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>