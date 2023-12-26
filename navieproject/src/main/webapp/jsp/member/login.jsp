<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>NAVIE</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

	<script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById('id').focus();
        });
    </script>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Header Section Begin -->
	<c:import url="/header"/> 
    <!-- Header End -->
    
    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Login</h2>
                        <p></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->
        
    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form login__fomr1">
                        <h3>Login</h3>
                        <font color="red">${msg}</font>
                        
                        <form action="loginProc" method="post" id="f">
                            <div class="input__item">
                                <input type="text" name="id" placeholder="아이디" id="id">
                                <span class="icon_id"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="pw" placeholder="비밀번호" id="pw">
                                <span class="icon_lock"></span>
                            </div>
                            <div>
	                            <button type="submit" class="site-btn" onclick="loginCheck()">Login Now</button><br><br>
	                            <a href="/regist" class="site-btn">Register Now</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>Login With:</h3>
                          <ul><%-- SNS 로그인 배너 추가 --%>
                            <li><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d188a169fcc06291e00b3da19fbac7ed&redirect_uri=http://www.navie.world/kakaoLogin"><img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"/></a></li>
                          </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- Footer Section Begin -->
	<c:import url="/footer"/>
	<!-- Footer End -->
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>