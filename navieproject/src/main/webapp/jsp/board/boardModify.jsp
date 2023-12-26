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
<c:import url="/boardheader"/> 
<!-- Header End -->

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>글 수정</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<br>
<section>  
<div class="container" align="center">

<form action="boardModifyProc" method="post">
	<input type="hidden" name="no" value="${board.no }" />
	<h3 style="color: red;" >${msg}</h3>
	<div class="container my-1">
		<div class="row">
			<table class="table">
				<tr>
					<th width="100">작성자</th>
					<td width="200">${board.id }</td>
					<th width="100">조회수</th>
					<td width="200">${board.hits }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${board.writeDate }</td>
					<th>다운로드</th>
					<td>${board.fileName }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
						<input style="width:100%;" type="text" name="title" value="${board.title }" />
					</td>
				</tr>
				<tr>
					<th>문서내용 수정</th>
					<td colspan="3">
						<textarea rows="10" cols="30" style="width:100%" name="content">${board.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="button" class="btn btn-outline-light" onclick="location.href='boardForm'">목록</button>&nbsp;&nbsp;
						<input type="submit" class="btn btn-outline-light" value="수정">&nbsp;&nbsp;
						<button type="button" class="btn btn-outline-light" onclick="history.back()">이전</button> 
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
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
