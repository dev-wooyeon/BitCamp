<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/purchase/listPurchase" method="post">

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
					<td class="ct_list_b" width="100">거래번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">회원ID</td>
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
					<td align="center"><a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${ i }</a>
					</td>
					<td></td>
					<td align="left"><a href="/purchase/getUser?userId=${user.userId}">${user.userId}</a>
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
						<c:if test="${purchase.tranCode=='000'}">
							구매완료	
						</c:if>
						<c:if test="${purchase.tranCode=='001'}">
							배송중
							<a href="/purchase/updateTranCodeByTranNo?tranNo=${purchase.tranNo}&userId=${user.userId}" onclick="alert('수령완료처리 되었습니다.')">수령하기</a>	
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