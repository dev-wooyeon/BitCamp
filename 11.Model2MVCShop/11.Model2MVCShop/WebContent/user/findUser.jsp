<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>비밀번호찾기</title>

<style type="text/css">
input {
	border: 1px solid black;
	width: 200px;
	height: 30px;
}

hr {
	border: 0.5px solid black;
}

button {
	background-color: black;
	color: white;
	border: 1px solid black;
	width: 200px;
	height: 40px;
	font-size: 14px;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	$(function(){
		
		$("button:contains('로그인')").on("click", function(){
			$(self.location).attr("href","/user/loginView.jsp");
		});
	});
</script>
</head>

<body>

<div class="navbar navbar-inverse" style="background: black;">
		<div class="container">
			<div class="col-md-12 col-sm-12" align="center" style="margin-left: 42%; margin-right: 42%;">
				<a class="navbar-brand" href="/index.jsp" style="color: white;">Eunwoo</a>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 30px">
		<!--  row Start /////////////////////////////////////-->

		<div class="row">
			<form>
				<div class="col-sm-12 col-md-12" align="center">

					<b>비밀번호찾기</b> <br />

					<hr />
					<small> 입력하신 정보로 찾은 정보입니다. </small>
					<p />
					<p />
					<br /> 아이디 :  ${user.userId} <br />
					<br /> 이름 :  ${user.userName} <br />
					<br /> 비밀번호 :  ${user.password} <br />
					<br /> 가입일자 :  ${user.regDate} <br />
					<p/>
					<p/>
					<br/>
						<button type="button">로그인</button>
						<br />
					<p>
					<hr />
				</div>
			</form>
		</div>
	</div>

</body>
</html>
