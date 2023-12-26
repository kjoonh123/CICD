<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="kor">

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

<body>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
    
<!-- Header Section Begin -->
<c:import url="/header"/> 
<!-- Header End -->

<c:if test="${empty sessionScope.id}">
	<script>
		alert('로그인 후 이용해주세요.');
		window.location.href = '/login';
	</script>
</c:if>

	<script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById('pw').focus();
        });
    </script>
    
<section class="signup spad">
 <div class="container" id="signup">
  <div class="regist_row">     
	<div class="regist__form">
	<h3 align="center">Withdrawal from membership</h3><br>
 	      <font color="red" >${msg }</font>
	      <form action="delete" method="post" id="f">
	          <div class="input__item">
	              <input type="text" name="id" readonly="readonly" value="${sessionScope.id }" style="background-color: #696969">
	              <span class="icon_id"></span>
	          </div>
	          <div class="input__item">
	              <input type="text" id="userName" name="userName" readonly="readonly" value="${sessionScope.userName }" style="background-color: #696969">
	              <span class="icon_profile"></span>
	          </div>
	          <div class="input__item">
	              <input type="password" id="pw" name="pw" placeholder="비밀번호">
	              <span class="icon_lock"></span>
	          </div>
	          <div class="input__item">
	              <input type="password" id="confirm" name="confirm" placeholder="Password재입력">
	              <span class="icon_lock"></span>
	          </div>

	          <div align="center">
	          <input type="submit" class="site-btn" value="Delete" > &nbsp;&nbsp; 
	          <input type="button" class="site-btn" value="Cancel" onclick="javascript:location.href='index'"/>
	      	  </div>
	      </form>
    	</div>
	</div>
  </div>
</section>

	<!-- Footer Section Begin -->
	<c:import url="/footer"/>
	<!-- Footer End -->

    <!-- Js Plugins -->
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