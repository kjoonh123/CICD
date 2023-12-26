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
    <!-- 오류 -->
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="web.js"></script>
    
    <script>
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById('id').focus();
	    });
	    
    	function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>

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
                        <h2>Sign Up</h2>
                        <p>Welcome to the NAVIE world</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container" id="signup">
            <div class="regist_row">
                <div>
                    <div class="regist__form">
                        <h3>Information</h3>
                        <font color="red" >${msg}</font>
                        <form action="registProc" method="post" id="f">
                            <div class="input__item">
                                <input type="text" name="id" id="id" placeholder="아이디 (*필수 항목)">
                                <span class="icon_id"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="pw" id="pw" placeholder="비밀번호">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="confirm" id="confirm" placeholder="비밀번호 재입력">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" name="userName" id="userName" placeholder="이름">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" name="mobile" id="mobile" placeholder="전화번호" >
                                <span class="icon_mobile"></span>
                            </div>
                            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm"><br>
                 		    <div class="input__item">
								<input type="text" name="postcode" id="postcode" placeholder="우편번호">
								<span class="icon_map_alt"></span>
								<input type="text" name="address" id="address" placeholder="주소"><br>
								<span class="icon_map_alt"></span>
								<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
								<span class="icon_map_alt"></span>
							</div>
                            <input type="button" class="site-btn" value="Register Now" onclick="allCheck()">
                        </form>
                        <h5>Already have an account? <a href="/login">Log In!</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->




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