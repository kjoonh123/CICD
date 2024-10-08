<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<script>
        // Function to change the video source
        function changeVideoSource(newSource, episodeNumber) {
            var videoPlayer = document.getElementById('player');
            var source = document.getElementById('videoSource');
    
            // Change the source URL
            source.src = newSource;
    
            // Load and play the new video
            videoPlayer.load();
            videoPlayer.play();
            
            var episodeDiv = document.querySelector('.episode_count');
            episodeDiv.textContent = episodeNumber + '화';
            
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
    
	<c:import url="/categoriesheader"/>
	
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Categories</a>
                        <a href="drama">Drama</a>
                        <span>연인</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

	<c:if test="${empty sessionScope.id }">
		<script>
			alert('로그인을 먼저 해주세요.');
			window.location='/dramaLogin';
		</script>
	</c:if>

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
        	<div class="episode_count section-title">연인</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="anime__video__player">
                        <video id="player" data-poster="#">
                            <source src="#" id="videoSource">
                            <!-- Captions are optional -->
                            <track kind="captions" label="English captions" src="#" srclang="en" default />
                        </video>                  
                    </div>

                    <div class="anime__details__episodes">
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_01.mp4', '1')">1화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_02.mp4', '2')">2화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_03.mp4', '3')">3화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_04.mp4', '4')">4화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_05.mp4', '5')">5화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_06.mp4', '6')">6화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_07.mp4', '7')">7화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_08.mp4', '8')">8화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_09.mp4', '9')">9화</button>
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_trailer_10.mp4', '10')">10화</button>
                    </div>
                </div>
            </div>
         </div>
    </section>
    <!-- Anime Section End -->	

	<c:import url="/footer"/>
	
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