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
<c:import url="/boardheader2"/> 
<!-- Header End -->
    
<script>
	function deleteCheck(){
		result = confirm('정말로 삭제하시겠습니까?');
		if(result == true){
			location.href='boardDeleteProc2?no=${board.no}'
		}
	}
</script>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Q&A Content</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<br>
<section>  
<div class="container" align="center">
	<h3 style="color: red;">${msg}</h3>
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
			<c:choose>
				<c:when test="${empty board.fileName }">
					<td></td>
				</c:when>
				<c:otherwise>
				<%--<td onclick="location.href='boardDownload2?no=${board.no }'">  --%>
					<td onclick="location.href='https://navie-bucket-board-save-web.s3.ap-northeast-2.amazonaws.com/${board.fileName}'">
						${board.fileName }
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${board.title }</td>
		</tr>
		<tr>
			<th>문서내용</th>
			<td colspan="3">${board.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" class="btn btn-outline-light" onclick="location.href='boardForm2'">목록</button>&nbsp;
				<c:choose>
					<c:when test="${sessionScope.id eq board.id}">
						<button type="button" class="btn btn-outline-light" onclick="location.href='boardModify2?no=${board.no }'">수정</button>&nbsp;
						<button type="button" class="btn btn-outline-light" onclick="deleteCheck()">삭제</button> 
					</c:when>
					<c:when test="${sessionScope.id == 'admin'}">
						<button type="button" class="btn btn-outline-light" onclick="deleteCheck()">삭제</button> 				
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

			</td>
		</tr>
	</table>
	</div>
	</div>
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