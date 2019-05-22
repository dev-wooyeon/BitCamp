<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
/*              padding-top : 50px; */
        }
        .carousel-inner>.item>img {
			top: 0;
			left: 0;
			min-width: 100%;
			min-height: 50px;
			max-height: 600px;
		}
		.navbar.navbar-inverse.navbar-fixed-top {
    		border-width: 0px;    		
   			box-shadow: 0px 0px;
   			background-color: rgba(0,0,0,0.0);			 
   			background-image: linear-gradient(180deg,rgba(0,0,0,0.00) 0%,rgba(0,0,0,0.00) 100%);
		}
		
		.carousel-indicators li {	
   			border-radius: 10px;
   			margin: 1px 8px;
   			height: 10px;
    		max-width: 10px;
    		border: 1px solid #FFF;
    		background-color: transparent;
		}
		.carousel-indicators .active {
    		background-color: #fff;
    		max-width: 12px;
    		margin: 0 8px;
    		height: 12px;
		}
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/images/main/Main1.jpg">
				</div>
				<div class="item">
					<img src="/images/main/Main2.jpg">
				</div>
				<div class="item">
					<img src="/images/main/Main3.jpg">
				</div>
				<div class="item">
					<img src="/images/main/Main4.jpg">
				</div>
				<div class="item">
					<img src="/images/main/Main5.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	
	<p>
	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>�湮 �� �ּż� �����մϴ�.</p>
     </div>
   </div>
   
	<div class="container">	
        <h3>���������� �̷��� ���ߴ�.</h3>
        <p>"���� ���� ������ ������ ���� �߸� ���� �ð��� �����̴�."</p>
  	 	<h3>"... �庮�� �����ϰ� ������ �ʴ� ������� �ɷ������� �����մϴ�. �庮��. ����� �ƴ϶� '�ٸ�' ������� ���߰� �Ϸ��� �ű� �ִ� ��������."</h3>
         <h3>��������</h3>
         <p>�ູ�� ���� �����.</p>
         <p>�����ϴ� ���� �ϴ� ���� �Ƹ���,</p>
         <p>���� �ϴ� ���� �����ϴ� ���Դϴ�.</p>
  	</div>
	
	<p>
	
	<hr>
	
	<div id=footer style="background: #aeaeaf; width: 100%; height: 100px; vertical-align: middle" align="center">
		<label>Copyright.</label>
	</div>
	
</body>

</html>