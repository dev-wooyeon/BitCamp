<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		function history(){
			popWin = window.open("/history.jsp",
								"popWin",
								"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	
		//==> jQuery ���� �߰��� �κ�
		 $(function() {
			 
			var personalInfo = ".Depth03:contains('����������ȸ')";
			//==> ����������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( personalInfo ).on("mousedown" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
				$( personalInfo ).css("color","red");
				$( personalInfo ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
					$( personalInfo ).css("color","black");
				});
			});
			
			var userInfo = ".Depth03:contains('ȸ��������ȸ')";
			//==> ȸ��������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( userInfo ).on("mousedown" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
				$( userInfo ).css("color","red");
				$( userInfo ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
					$( userInfo ).css("color","black");
				});	 		
			}); 
			
			var productAdd = ".Depth03:contains('�ǸŻ�ǰ���')";
			$(productAdd).on("mousedown" , function(){
				
				$( productAdd ).css("color","red");
				$( productAdd ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp;");
					$( productAdd ).css("color","black");
				});
			});
			
			var productManage = ".Depth03:contains('�ǸŻ�ǰ����')";
			$(productManage).on("mousedown" , function(){
				
				$( productManage ).css("color","red");
				$( productManage ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage")
					$( productManage ).css("color","black");
				});				
			});
			
			var productSearch = ".Depth03:contains('�� ǰ �� ��')";
			$(productSearch).on("mousedown" , function(){
				
				$( productSearch ).css("color","red");
				$( productSearch ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search");
					$( productSearch ).css("color","black");
				});						
			});
			
			var purchaseInfo = ".Depth03:contains('�����̷���ȸ')";
			$(purchaseInfo).on("mousedown" , function(){
				
				$( purchaseInfo ).css("color","red");
				$( purchaseInfo ).on("mouseup" , function() {
					$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
					$( purchaseInfo ).css("color","black");
				});						
			});
			
			var productCookies = ".Depth03:contains('�ֱ� �� ��ǰ')";
			$(productCookies).on("mousedown" , function(){
				
				$( productCookies ).css("color","red");
				$( productCookies ).on("mouseup" , function() {
					history();
					$( productCookies ).css("color","black");
				});		
			});
		});	
		 
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
				<c:if test="${ !empty user }">
					<tr>
						<td class="Depth03">
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">����������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							����������ȸ
						</td>
					</tr>
				</c:if>
				<c:if test="${user.role == 'admin'}">
					<tr>
						<td class="Depth03" >
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							ȸ��������ȸ
						</td>
					</tr>
				</c:if>
			
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
		</table>
	</td>
</tr>

<!--menu 02 line-->
<c:if test="${user.role == 'admin'}">
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						�ǸŻ�ǰ���
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						�ǸŻ�ǰ����
					</td>
				</tr>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</c:if>

<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					�� ǰ �� ��
				</td>
			</tr>
			
			<c:if test="${ !empty user && user.role == 'user'}">
			<tr>
				<td class="Depth03">
					�����̷���ȸ
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">�ֱ� �� ��ǰ</td>
			</tr>
		</table>
	</td>
</tr>

</table>

</body>

</html>