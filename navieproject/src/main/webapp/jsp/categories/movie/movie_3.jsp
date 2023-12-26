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
            episodeDiv.textContent = episodeNumber;
            
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
                        <a href="categories">Categories</a>
                        <a href="movie">Movie</a>
                        <span>3일의 휴가</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
	<c:if test="${empty sessionScope.id }">
		<script>
			alert('로그인을 먼저 해주세요.');
			window.location='/movieLogin';
		</script>
 	</c:if>

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
        	<div class="episode_count section-title">3일의 휴가</div>
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
                        <button onclick="changeVideoSource('https://navie-bucket-video-save-web.s3.ap-northeast-2.amazonaws.com/M_Our_Season_main_trailer.mp4', '3일의 휴가')">3일의 휴가</button>
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