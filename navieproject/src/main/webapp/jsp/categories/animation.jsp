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
	
	<c:import url="/categoriesheader"/>
	
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Categories</a>
                        <span>Animation</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

	<c:if test="${empty sessionScope.id }">
		<script>
			alert('로그인을 먼저 해주세요.');
			window.location='/aniLogin';
		</script>
 	</c:if>

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>Animation</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_your_name.jpg">
                                    <%-- <div class="comment"><i class="fa fa-comments"></i> 11</div>
									     <span><i class="fa fa-eye"></i> 19.141 Viewes</span> --%>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Fantasy</li>
                                            <li>Romance</li>
                                        </ul>
                                        <h5><a href="animation_1">너의이름은</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Frozen_II.jpg">
                                        <!-- <div class="comment"><i class="fa fa-comments"></i> 11</div> -->
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Musical</li>
                                            <li>Family</li>
                                        </ul>
                                        <h5><a href="animation_2">겨울왕국2</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Detective_Conan.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Crime</li>
                                            <li>Mystery</li>
                                        </ul>
                                        <h5><a href="animation_3">명탐정코난</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Toy_Story_3.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Adventure</li>
                                            <li>Family</li>
                                        </ul>
                                        <h5><a href="#">토이스토리3</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Suzume.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Fantasy</li>
                                            <li>Adventure</li>
                                        </ul>
                                        <h5><a href="#">스즈메의 문단속</a></h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Frozen.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Musical</li>
                                            <li>Family</li>
                                        </ul>
                                        <h5><a href="#">겨울왕국</a></h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Puss_in_Boots.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Adventure</li>
                                            <li>Comedy</li>
                                        </ul>
                                        <h5><a href="#">장화신은 고양이</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Spider_Man.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Action</li>
                                            <li>Sci-Fi</li>
                                        </ul>
                                        <h5><a href="#">스파이더맨</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Elemental.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Family</li>
                                            <li>Drama</li>
                                        </ul>
                                        <h5><a href="#">엘리멘탈</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="product__pagination">
                        <a href="#" class="current-page">1</a>
                        <a href="#">2</a>
                        <a href="#"><i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__comment">
                            <div class="section-title">
                                <h5>New Comment</h5>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_your_name_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Fantasy</li>
                                        <li>Romance</li>
                                    </ul>
                                    <h5><a href="animation_1">너의이름은</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Toy_Story_3_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Adventure</li>
                                        <li>Family</li>
                                    </ul>
                                    <h5><a href="#">토이스토리3</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Suzume_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Fantasy</li>
                                        <li>Adventure</li>
                                    </ul>
                                    <h5><a href="#">스즈메의 문단속</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Frozen_II_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Musical</li>
                                        <li>Family</li>
                                    </ul>
                                    <h5><a href="animation_2">겨울왕국2</a></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</section>
<!-- Product Section End -->

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