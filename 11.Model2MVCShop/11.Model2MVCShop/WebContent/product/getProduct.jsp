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
	
	$(".like").on("click",function(){
		
		var commentNo = $(this).children("input").val();
		var likeCnt = $(this).children("span");
		
		$.ajax({
			url : "/comment/json/commentLike/"+commentNo ,
			method : "POST",
			dataType : "json",
// 			data :  convertSearch ,
			contentType: "application/x-www-form-urlencoded; charset=euc-kr",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json;charset=euc_kr"
			},
			success : function(JSONData, status){				
				
// 				alert($(this).children().children("i").text());
// 				alert($(this).children().children("i").val());
				//$(".like").text();
				likeCnt.text(" "+JSONData.likeCnt);
			}
		});
		//alert($(this).children("input").val());
		//self.location = "/comment/commentLike?commentNo="+$(this).children("input").val()+"&prod_no=${product.prodNo}";
		//self.location ="/product/getProduct?prodNo="+$(this).children("input").val()+"&menu="+$("#menu").val();
		//$("form").attr("method" , "GET").attr("action" , "/comment/commentLike?commentNo="+$("#commentNo").val()+"&prod_no=${product.prodNo}").submit();
	});
	
	$("#request").on("click",function(){
		alert("준비중인 기능입니다.\n이용에 불편을드려 죄송합니다.");	
	});
	
	$("#purchase").on("click", function(){
		
		var amount = $("input").val();
		
		//alert(${product.amount});
		//alert(amount);
		
		if ( ${ ! empty sessionScope.user}  ){
			if(${product.amount} >= amount){
				$(self.location).attr("href","/purchase/addPurchaseView?prod_no="+${product.prodNo}+"&amount="+amount);
			} else {
				alert("판매하는 개수보다 많습니다.\n수량을 확인해주세요.")
			}
		} else {
			alert("로그인 후 이용해주세요.");
		}
		
	});
	
	$("#commentGo").on("click",function(){
		
		if ( ${ ! empty sessionScope.user}  ){
			$("form").attr("action","/comment/addComment?prod_no="+${product.prodNo}).attr("method","POST").submit();
		} else {
			alert("비회원은 댓글을 달 수 없습니다.\n로그인 후 이용해 주시길 바랍니다.");
			
			return false;
		}

	});
	
//	퀵메뉴바
// 	var currentPosition = parseInt($(".quick").css("top")); 
//     $(window).scroll(function() { 
//             var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
//             $(".quick").stop().animate({"top":position+currentPosition+"px"},500); 
//     });
});
</script>
</head>

<body>
 
	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">		
		<div class="page-header text-info">
			
			<c:if test="${param.menu == manage}">
			<h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
			</c:if>	
	    </div>
	    
	    <div class="row">
			<div class="col-xs-12 col-sm-12 col-md-7" align="center"><img src="/images/uploadFiles/${product.fileName}" onerror="this.src='/images/uploadFiles/ImageTemp.png'" width="600px" height="500px"/></div>
			<div class="col-xs-12 col-sm-12 col-md-5">
				
				<h4><b>${product.prodName}</b></h4>
				
				<h4>&#8361;${product.price}<small>&nbsp;배송비 제외</small></h4>
				
<<<<<<< HEAD
				<div>				
					<h5>모델번호: ${product.prodNo}</h5><br>
					<h5>남은개수: ${product.amount}</h5><br>
					<h5>수량 : <input type="text" name="amount" value="1" maxlength="3" style="width: 30px; text-align: right"></h5><br>
					<c:if test="${product.amount > 0 }">
						<button id="purchase" style="background-color: black; color: white; width: 100%; height: 40px;">
						<h6><span class="glyphicon glyphicon-shopping-cart"> <b> 구매하기</b></span></h6>
						</button>
					</c:if>
					<c:if test="${product.amount <= 0}">				
						<button id="request" style="background-color: black; color: white; width: 100%; height: 40px;">
						<h6><span class="glyphicon glyphicon-shopping-cart"> <b> 재입고요청</b></span></h6>
						</button>
					</c:if>
=======
				<div style="vertical-align: bottom;">
					<h5>모델번호: ${product.prodNo}</h5><br>
						<c:if test="${product.proTranCode == null}">
							<button id="purchase" style="background-color: black; color: white; width: 100%; height: 40px;">
								<h6><span class="glyphicon glyphicon-shopping-cart"><b> 구매하기</b></span></h6>
							</button>
 						</c:if>
 						<c:if test="${product.proTranCode != null}">	
							<button id="request" style="background-color: black; color: white; width: 100%; height: 40px;">
								<h6><b>품절 된 상품입니다.</b></h6>
							</button>
						</c:if>
>>>>>>> refs/remotes/origin/master
				</div>
				
			</div>			
		</div>
		
		<div class="row">
			&nbsp;<p>
			&nbsp;<p>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-list-alt">상품설명</span></h3></div>
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-calendar">제조일자</span></h3></div>
			<div class="col-xs-4 col-md-4" align="center"><h3><span class="glyphicon glyphicon-calendar">등록일자</span></h3></div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-4" align="center">${product.prodDetail}</div>
			<div class="col-xs-4 col-md-4" align="center">${product.manuDate}</div>
			<div class="col-xs-4 col-md-4" align="center">${product.regDate}</div>
		</div>

	
		<div class="row">
			&nbsp;<p>
			&nbsp;<p>
		</div>
		<hr>
		
		<form>
		<div class="row">
			<div class="col-xs-4 col-md-12" align="left"><h3><b>한줄평</b></h3></div>
		</div>
		
		<c:set var="i" value="0" />	
		<c:forEach var="comment" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
		<div class="row">
			<div class="col-sm-9 col-md-10" align="left">
			<h4>
				<b>${comment.userId}</b>&nbsp;
				<small>${comment.inputDate}</small>&nbsp;
				<c:if test="${i <= 3}">
				<b>BEST ${i}</b>
				</c:if>
			</h4>
			<h5>${comment.reply}</h5>
			</div>
			<div class="col-sm-3 col-md-2 like" align="right">
				
				<input type="hidden" id="commentNo" value="${comment.commentNo}"/>
      				<span class="glyphicon glyphicon-thumbs-up" id="like">
      				${comment.likeCnt}
      				</span>
      			
<!-- 				<button class="btn btn-default"> -->
<%-- 					<input type="hidden" id="commentNo" name="commentNo" value='${comment.commentNo}'/> --%>
<!-- 					<span class="glyphicon glyphicon-thumbs-up" id="like"> -->
<%-- 						${comment.likeCnt} --%>
<!-- 					</span> -->
<!-- 				</button> -->
<!-- 				<button class="btn btn-default"> -->
<!-- 				<span class="glyphicon glyphicon-thumbs-down">0</span> -->
<!-- 				</button> -->
<!-- 				<span class="glyphicon glyphicon-refresh"></span> -->
<!-- 				<span class="glyphicon glyphicon-remove"></span> -->
			</div>
		</div>
		
		</c:forEach>
		<br>
		
		<div class="row">
			<div class="col-sm-9 col-md-10" align="center">
				<input type="text" name="reply" class="form-control" style="width: 100%; height: 40px" placeholder="댓글입력" />
			</div>
			<div class="col-sm-3 col-md-2" align="center">
				<button id="commentGo" style="background-color: black; color: white; width: 100%; height: 40px;">
				<h6><b>댓글달기</b></h6>
				</button>
			</div>
		</div>
		
		</form>
		
		<div class="row">
			&nbsp;<p>
			&nbsp;<p>
		</div>
		
	</div>

<jsp:include page="/layout/bottom.jsp"></jsp:include>

</body>
</html>