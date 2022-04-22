<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp" style="color: white;">Eunwoo Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
	                         <span >내 정보</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">내 정보조회</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>
	                         
<!-- 	                         <li class="divider"></li> 구분선을 위한 태그-->
	                         
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
		                         <span >상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li><a href="#">판매상품관리</a></li>
		                         <li><a href="#">상품주문관리</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상 품 검 색</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">구매이력조회</a></li>
	                         </c:if>
	                         
	                         <li><a href="../history.jsp">최근본상품</a></li>
	                     </ul>
	                 </li>
	                 
<<<<<<< HEAD
<!-- 	                 <li><a href="#">etc...</a></li> -->
=======
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>채팅방</span>
	                         <span class="caret"></span>
	                     </a>
	                 </li>
	                 <li><a href="#">etc...</a></li>
>>>>>>> refs/remotes/origin/master
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${ empty sessionScope.user}">
	                	<li><a href="#" style="color: white;">비회원</a></li>
	                </c:if>
	                <c:if test="${ !empty sessionScope.user}">
	                	<li><a href="#" style="color: white;">로그아웃</a></li>
	                </c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			});
		 	$("a:contains('비회원')").on("click" , function() {
				$(self.location).attr("href","/user/loginView.jsp");
				//self.location = "/user/logout"
			});
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	function history(){
			popWin = window.open("/history.jsp",
								"popWin",
								"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	 	
		$("a:contains('판매상품등록')").on("click" , function(){			
			$(self.location).attr("href","../product/addProductView.jsp;");
		});
		
		$("a:contains('판매상품관리')").on("click" , function(){			
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
		
		$("a:contains('상품주문관리')").on("click" , function(){			
			$(self.location).attr("href","/purchase/listPurchase");
		});
		
		$("a:contains('상 품 검 색')").on("click" , function(){			
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
		$("a:contains('구매이력조회')").on("click" , function(){			
			$(self.location).attr("href","/purchase/listPurchase");				
		});
		
		$("a:contains('채팅방')").on("click" , function(){			
			$(self.location).attr("href","/roomchat.jsp");				
		});
		
		$("a:contains('최근 본 상품')").on("click" , function(){			
			history();			
		});
		
		
		
	</script>  