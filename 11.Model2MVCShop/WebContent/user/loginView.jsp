<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
input {
	border: 1px solid black;
}

hr {
	border: 0.5px solid black;
}

button {
	background-color: black;
	color: white;
	border: 1px solid black;
	width: 175px;
	height: 30px;
	font-size: 10px;
	font-weight: bold;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "�α���"  Event ���� =============
	$(function() {

		$("#userId").focus();

		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button:contains('�α���')").on(
				"click",
				function() {
					
					//alert($("input:text").val() + " \n " + $("input:password").val())
					
					var id = $("input:text").val();
					var pw = $("input:password").val();

					if (id == null || id.length < 1) {
						alert('ID �� �Է����� �����̽��ϴ�.');
						$("#userId").focus();
						return;
					}

					if (pw == null || pw.length < 1) {
						alert('�н����带 �Է����� �����̽��ϴ�.');
						$("#password").focus();
						return;
					}

					$("form").attr("method", "POST").attr("action","/user/login").attr("target", "_parent").submit();
				});
	});

	//============= ȸ��������ȭ���̵� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser"
		});
	});
	
	//<![CDATA[
	// ����� ���� JavaScript Ű�� ������ �ּ���.
// 	Kakao.init('3712344ba7ced84f343e902022c6334f');

// 	function loginWithKakao() {
// 		// �α��� â�� ���ϴ�.
// 		// 										Kakao.Auth.setAccessToken(
// 		// 												Btw0KYr3D9Ymq0Ismx-CkYbWKMljwpIrg2jMKQo9dRsAAAFrBpHTQQ
// 		// 										);

// 		Kakao.Auth.login({

// 			success : function(authObj) {
// 				alert(JSON.stringify(authObj));
// 			},
// 			fail : function(err) {
// 				alert(JSON.stringify(err));
// 			}
// 		});
// 	};

	//]]>
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar navbar-inverse">
		<div class="container" align="center">
			<a class="navbar-brand" href="/index.jsp">Eunwoo Shop</a>
		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
			<form>
			<div class="col-md-12">
					�α���
					<hr />
					���̵�� ��й�ȣ�� �Է��Ͽ� �α����Ͻñ� �ٶ��ϴ�. 
					<br /> 
					<input type="text" name="userId" id="userId" placeholder="Id">
					<br/>
					<p>
					<input type="password" name="password" id="password"
						placeholder="Password"> <br />
					<p>
					<button type="button">�α���</button><br/>
					<p>
					
					<button type="button">ȸ������</button>
					
					<a href="#"><h6>��й�ȣã��</h6></a>
					<hr/>
					<a id="custom-login-btn"
						href="javascript:loginWithKakao()"> <img
						src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
						width="200" />
					</a>
			</div>
			</form>
		</div>

	</div>

</body>

</html>