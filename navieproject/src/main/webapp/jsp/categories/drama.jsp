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
                        <span>Drama</span>
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
                                        <h4>Drama</h4>
                                    </div>
                                </div>
                                <!-- <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_STOVE_LEAGUE.jpg">
                                        <div class="ep">10 / 10</div>
                                        <!-- <div class="comment"><i class="fa fa-comments"></i> 11</div> -->
									<%-- 나중에 hit 올리는 쿼리와 적용할 수 있으면 하기
                                     <span><i class="fa fa-eye"></i> 19.141 Viewes</span> --%>                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Office</li>
                                            <li>Sports</li>
                                        </ul>
                                        <h5><a href="drama_1">스토브리그</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest.jpeg">
                                        <div class="ep">10 / 10</div>
									<%-- <div class="comment"><i class="fa fa-comments"></i> 11</div>
									     <span><i class="fa fa-eye"></i> 19.141 Viewes</span> --%>                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Historical</li>
                                            <li>Romance</li>
                                        </ul>
                                        <h5><a href="drama_2">연인</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Our_Beloved_Summer.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Highteen</li>
                                            <li>Romance</li>
                                        </ul>
                                        <h5><a href="drama_3">그해우리는</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Extraordinary_Attorney_Woo.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Comedy</li>
                                            <li>Office</li>
                                        </ul>
                                        <h5><a href="#">이상한 변호사 우영우</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Beyond_Evil.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Thriller</li>
                                            <li>Mystery</li>
                                        </ul>
                                        <h5><a href="#">괴물</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_MOTHER.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Mystery</li>
                                            <li>Crime</li>
                                        </ul>
                                        <h5><a href="#">마더</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_The_Killing_Vote.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Thriller</li>
                                            <li>Noir</li>
                                        </ul>
                                        <h5><a href="#">국민사형투표</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Taxi_Driver_2.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Action</li>
                                            <li>Crime</li>
                                        </ul>
                                        <h5><a href="#">모범택시2</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_The_Penthouse_ll.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Crime</li>
                                            <li>Mystery</li>
                                        </ul>
                                        <h5><a href="#">펜트하우스2</a></h5>
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
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_STOVE_LEAGUE_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Office</li>
                                        <li>Sports</li>
                                    </ul>
                                    <h5><a href="drama_1">스토브리그</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest_min.jpeg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Historical</li>
                                        <li>Romance</li>
                                    </ul>
                                    <h5><a href="drama_2">연인</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Our_Beloved_Summer_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Highteen</li>
                                        <li>Romance</li>
                                    </ul>
                                    <h5><a href="drama_3">그해우리는</a></h5>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Extraordinary_Attorney_Woo_min.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>Comedy</li>
                                        <li>Office</li>
                                    </ul>
                                    <h5><a href="#">이상한 변호사 우영우</a></h5>
                                </div>
                            </div>
                        </div>
                    </div>
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