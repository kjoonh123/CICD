<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
rel="stylesheet">

<!-- Css Styles -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<!-- Header Section Begin -->
	<header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/index">
                            <img src="img/logo.png" alt=""> <!-- 로고 수정 -->
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="/index"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                                <li><a href="#">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="movie">- Movie</a></li>
                                        <li><a href="drama">- Drama</a></li>
                                        <li><a href="animation">- Animation</a></li>
                                    </ul>
                                </li>
                                <li><a href="/boardForm">Review</a></li>
                                <li><a href="/boardForm2">Q & A</a></li>
                                <li></li>
                                <li></li>
	                        	<c:choose>
	                        		<c:when test="${empty sessionScope.id }">
	                       				<a href="login"><span class="icon_profile"></span> Login</a>
	                       			</c:when>
		                        	<c:when test="${sessionScope.id == 'admin' }">
		                                <li><a href="#">${sessionScope.id }<span class="arrow_carrot-down"></span></a>
		                                    <ul class="dropdown">
		                                        <li><a href="update">- 내정보수정</a></li>
		                                        <li><a href="delete">- 회원탈퇴</a></li>
		                                        <li><a href="list">- 회원목록</a></li>
		                                    </ul>
		                                </li>
	                                	<li><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li>
		                            </c:when>
		                            <c:otherwise>
		                                <li><a href="#">${sessionScope.id}<span class="arrow_carrot-down"></span></a>
		                                    <ul class="dropdown">
		                                        <li><a href="update">- 내정보수정</a></li>
		                                        <li><a href="delete">- 회원탈퇴</a></li>
		                                    </ul>
		                                </li>
	                                	<li><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li>
		                            </c:otherwise>
	                            </c:choose>
	                            <li><a href="#" class="search-switch"><span class="icon_search"></span></a></li>                                	
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
   
	   <!-- Search model Begin -->
	   <div class="search-model">
	     <div class="h-100 d-flex align-items-center justify-content-center">
	         <div class="search-close-switch"><i class="icon_close"></i></div>
	         <form class="search-model-form">
	             <input type="text" id="search-input" placeholder="Search here.....">
	         </form>
	   	  </div>
	   	              
	    </div>
	    <!-- Search model end -->

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	
</header>