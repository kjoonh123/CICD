<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Members Information</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<c:if test="${sessionScope.id ne 'admin'}">
	<script>
		alert('관리자만 접근가능한 페이지입니다.');
		window.history.back();
	</script>
</c:if>

<br>
<section>  
<div class="container" align="center">
	<c:choose>
		<c:when test="${members.isEmpty() }">
			<h3 style="color: white;">등록된 정보가 없습니다.</h3>
		</c:when>
		<c:otherwise>
		<div class="container my-1">
			<div class="row">
			<table class="table">
				<tr>
					<th width="50">아이디</th>
					<th width="90">이름</th>
					<th width="50">우편번호</th>
					<th width="200">주소</th>
					<th width="200">상세주소</th>
					<th width="100">핸드폰</th>
				<!--<th width="20"></th>-->
				<!--<th width="20"></th>-->
				</tr>
				<c:forEach var="member" items="${members}">
					<tr>
						<td>${member.id}</td>
						<td>${member.userName}</td>
						<td>${member.postcode}</td>
						<td>${member.address}</td>
						<td>${member.detailAddress}</td>
						<td>${member.mobile}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
	</div>
</section>
<br><br><br>

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