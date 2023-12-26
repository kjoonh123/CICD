<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
	    <div class="loader"></div>
	</div>
	
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_STOVE_LEAGUE_main.jpg" onclick="window.location.href='drama_1';">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Drama</div>
                                <h2>스토브 리그 Season.1</h2>
                                <p>룰도 심판도 없다!</p>
                                <a href="drama_1"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/M_The_Roundup2_main.jpg" onclick="window.location.href='movie_1';">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Movie</div>
                                <h2>범죄도시 2</h2>
                                <p>나쁜 놈들 싹 쓸어버린다!</p>
                                <a href="movie_1"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_your_name_main.jpg" onclick="window.location.href='animation_1';">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Animation</div>
                                <h2>너의 이름은</h2>
                                <p>꿈 속에서 시작된 기적같은 사랑 이야기</p>
                                <a href="animation_1"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                    
                    <!-- 영화 시작 -->
                       <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Movie</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="movie" class="primary-btn">Movie All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/M_The_Roundup2.jpg">
	                                </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Action</li>
                                            <li>Crime</li>
                                        </ul>
                                        <h5><a href="movie_1">범죄도시2</a></h5>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/M_The_Roundup3.jpeg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Action</li>
                                            <li>Crime</li>
                                        </ul>
                                        <h5><a href="movie_2">범죄도시3</a></h5>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/M_Our_Season.jpeg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Comedy</li>
                                            <li>Fantasy</li>
                                        </ul>
                                        <h5><a href="movie_3">3일의 휴가</a></h5>
                                    </div>
                                </div>
                            </div>   
                                                     
                        <!-- 드라마 시작 -->    
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Drama</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="drama" class="primary-btn">Drama All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_STOVE_LEAGUE.jpg">
                                        <div class="ep">10 / 10</div>
                                    </div>
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
                                    </div>
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
                        </div>
                          
                        <!-- 애니메이션 시작 -->
                        <div class="row">
                           <div class="col-lg-8 col-md-8 col-sm-8">
                               <div class="section-title">
                                   <h4>Animation</h4>
                               </div>
                           </div>
                           <div class="col-lg-4 col-md-4 col-sm-4">
                               <div class="btn__all">
                                   <a href="animation" class="primary-btn">Animation All <span class="arrow_right"></span></a>
                               </div>
                           </div>
                    	</div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_your_name.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Fantasy</li>
                                            <li>Romance</li>
                                        </ul>
                                        <h5><a href="animation_1">너의 이름은</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Frozen_II.jpg">
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
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Crime</li>
                                            <li>Mystery</li>
                                        </ul>
                                        <h5><a href="animation_3">명탐정코난:흑철의어영</a></h5>
                                    </div>
                               	</div>
							</div>
						</div>
						
						
						</div>
					</div>
        		</div>
        		
		        <div class="col-lg-4 col-md-6 col-sm-8">
		            <div class="product__sidebar">
		                <div class="product__sidebar__view">
		                    <div class="section-title">
		                        <h5>Top Views</h5>
		                    </div>
		                    <ul class="filter__controls">
		                        <li class="active" data-filter="*">Day</li>
		                        <li data-filter=".week">Week</li>
		                        <li data-filter=".month">Month</li>
		                        <li data-filter=".years">Years</li>
		                    </ul>
		                    <div class="filter__gallery">
		                        <div class="product__sidebar__view__item set-bg mix day years"
		                        data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_My_Dearest.jpeg">
		                        <div class="ep">10 / 10</div>
		                        <h5><a href="drama_2">연인</a></h5>
		                    	</div>
			                    <div class="product__sidebar__view__item set-bg mix month week"
			                        data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_your_name.jpg">
			                        <h5><a href="animation_1">너의 이름은</a></h5>
			                    </div>
			                    <div class="product__sidebar__view__item set-bg mix week years"
			                        data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/A_Toy_Story_3.jpg">
			                        <h5><a href="#">토이스토리3</a></h5>
			                    </div>
			                    <div class="product__sidebar__view__item set-bg mix years month"
			                   		data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/M_Our_Season.jpeg">
			                    <h5><a href="movie_3">3일의 휴가</a></h5>
			                	</div>
				                <div class="product__sidebar__view__item set-bg mix day"
				                	data-setbg="https://navie-bucket-images-save-web.s3.ap-northeast-2.amazonaws.com/D_Taxi_Driver_2.jpg">
				                <h5><a href="#">모범택시2</a></h5>
			           			</div>
	     		 			</div>
	   					</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>