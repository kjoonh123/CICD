<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
<c:import url="/boardheader"/> 
<!-- Header End -->

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Review</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<br>
<section>  
<div class="container" align="center">

	<c:choose>
		<c:when test="${empty sessionScope.id }">
			<script>
				alert('로그인을 먼저 해주세요.');
				window.location='/boardLogin';
			</script>
  		</c:when>
		<c:when test="${empty boards }">
			<h1>등록된 데이터가 존재하지 않습니다.</h1>
		</c:when>
		<c:otherwise>
			<div class="container my-1">
				<div class="row">
				<table class="table">
					<tr>
						<th width="50">No.</th>
						<th width="250">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
						<th width="60">조회수</th>
					</tr>
					
					<c:forEach var="board" items="${boards}">
						<tr class="tr">
							<td>${board.no }</td>
							<td class="td" onclick="location.href='boardContent?no=${board.no }'">
								${board.title }
							</td>
							<td>${board.id }</td>
							<td>${board.writeDate }</td>
							<td>${board.hits }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" align="center"> ${result}</td>
						<td><button type="button" class="btn btn-outline-light" onclick="location.href='boardWrite'">글쓰기</button></td>
					</tr>
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
