<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>

</head>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Knewave" rel="stylesheet">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery.bpopup.min.js"></script>
<!-- bootstrap script-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="resources/js/pwdcheck.js"></script>
<!-- main page script-->
<script>
  $(document).ready(function(){
    var prevScroll=0;
    var curScroll=0;

    $(document).on('scroll', function(){
      prevScroll=$(document).scrollTop();

      if(prevScroll>200){
        $('#topMenu').css('position', 'fixed');
        $('#topMenu').css('z-index', '1');
        $('#topMenu').css('background', '#fff');
        $('#topMenu').find('h1').css('color', 'black');
        $('#topMenu').find('i').css('color', 'black');
        $('#topMenu').find('a').css('color', 'black');
      }else if(prevScroll==0){
        $('#topMenu').css('position', 'absolute');
        $('#topMenu').find('h1').css('color', 'white');
        $('#topMenu').find('h1').css('color', 'white');
        $('#topMenu').find('a').css('color', 'white');
      }else{
        $('#topMenu').css('position', 'fixed');
        $('#topMenu').css('z-index', '1');
        $('#topMenu').css('background', 'rgba(0,0,0,0)');
        $('#topMenu').find('h1').css('color', '#fff');
        $('#topMenu').find('i').css('color', 'white');
        $('#topMenu').find('a').css('color', 'white');
      }
    })

    var innerHeight = $(window).innerHeight();

    $('#my-slider').css('height', innerHeight);

  })
  $(document).ready(function(){
    $('.sub-menu').hide();

    $('.top-menu li').click(function(){
      $('.sub-menu', this).slideToggle('fast');
    })
  })
</script>
<!--login popup-->
<script>
  $(document).ready(function(){
    var bpopup='';

    $('.sign-in').find('a').on('click', function(e){
    	e.preventDefault();

    	bpopup=$('#signInContainer').bPopup({
   		speed: 650,
        transition: 'slideBack',
	    transitionClose: 'slideIn'
    	})
    })

    $('.login').find('a').on('click', function(e){
    	e.preventDefault();

    	bpopup=$('#loginContainer').bPopup({
   		speed: 650,
        transition: 'slideIn',
	    transitionClose: 'slideBack'
    	})
    })

    $('.another-button').find('a').on('click', function(e){
    	e.preventDefault();

    	bpopup=$('.write').bPopup({
    		speed: 800,
            transition: 'slideIn',
    	    transitionClose: 'slideBack'
    	})
    })
    $('.MyInfo').find('a').on('click', function(e){
    	e.preventDefault();

    	bpopup=$('#MyInfoContainer').bPopup({
        fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
              followSpeed: 1000, //can be a string ('slow'/'fast') or int
              modalColor: 'rgba(0,0,0,0.5)'
    	})
    })
  })
  
  $(document).ready(function(){
    $('.sub-menu').hide();

    $('.top-menu li').click(function(){
      $('.sub-menu', this).slideToggle('fast');
    })
  })
  function gologout() {
	  location.href="logout";
  }
</script>
<body>
  <div id="wrap">
    <div id="header">
      <div id="topMenu" style="margin : -10px">
        <div class="teamlogo">
          <a href="#"><h1>HotPublace</h1></a>
        </div>
        <div class="center-menu">
        	<a href="list_view.jsp">HOT PLACE</a>
        	<a href="list_view">PLACE</a>
        	<a href="list?pageInfo=list1">RECEIPE</a>
        	<a href="list?pageInfo=list1">FESTIVAL</a>
        </div>
        <div class="headerMenu">
        	<c:if test="${sessionID == null }">
            <div class="login">
              <a href="#"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
            <div class="sign-in">
              <a href="#"><i class="far fa-address-card"></i></a>
            </div>
            </c:if>
            <c:if test="${sessionID != null }">
            <div class="logout">
              <a href="#"><i class="fas fa-sign-out-alt" onclick="gologout()"></i></a>
            </div>
            <div class="MyInfo">
              <a href="#"><i class="fas fa-users-cog"></i></a>
            </div>
            </c:if>
        </div>
      </div>
    </div>
    <div id="content">
    <!-- My Slider -->
      <div id="my-slider" class="carousel slide" data-ride="carousel">
					<!-- indicators dot nav-->
          <ol class="carousel-indicators carousel-indicators-numbers">
          <li data-target="#my-slider" data-slide-to="0" class="active"></li>
          <li data-target="#my-slider" data-slide-to="1"></li>
          <li data-target="#my-slider" data-slide-to="2"></li>
        </ol>
					<!-- wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<!-- each of this divs are picture -->
						<div class="item active">
							<img src="resources/img/pub1.jpg" width=100% height=844px alt="0" />
						</div>
						<div class="item active2">
							<img src="resources/img/pub2.jpg" width=100% height=844px alt="1" />
						</div>
						<div class="item active3">
							<img src="resources/img/pub3.jpg" width=100% height=844px alt="2" />
						</div>
						<!-- nav left/right -->
            
					</div>
			</div>
			<!-- squareContent; starting of contents -->
			<c:if test="${pageInfo == list}">
				<jsp:include page="list.jsp"/> 
			</c:if>
			<c:if test="${pageInfo == index}">
				<div class="squareContent">
          <div class="square"><img src="resources/img/square1.jpg" alt="">
            <div class="img-cover"></div>
            <h1>HOT PLACE</h1>
            <h4>INVITE YOU TO BEST PLACE</h4>
          </div>
          <div class="square"><img src="resources/img/pic1.png" alt=""></div>
          <div class="square"><img src="resources/img/pic2.jpg" alt=""></div>
          <div class="square"><img src="resources/img/square3.jpg" alt="">
            <div class="img-cover"></div>
            <h1>FESTIVAL</h1>
            <h4>TASTE, WATCH, TOUCH</h4>
          </div>
          <div class="square"><img src="resources/img/pic3.jpg" alt=""></div>
          <div class="square"><img src="resources/img/square2.jpg" alt="">
            <div class="img-cover"></div>
            <h1>PLACES</h1>
            <h4>LET US KNOW WHERE HAD U BEEN</h4>
          </div>
          <div class="square"><img src="resources/img/square4.jpg" alt="">
            <div class="img-cover"></div>
            <h1>RECIPE</h1>
            <h4>GREAT DRINK WITH GREAT FOOD</h4>
          </div>
          <div class="square">
            <img src="resources/img/pic4.jpg" alt="">
          </div>
        </div>
			</c:if>
        
        
        <!-- squareContent; end of contents -->
    <!-- My Slider -->
        <div id="footer">
          <div class="container1">
            <div class="teamInfo">
              <br>
              <h1 class="logo">HotPublace</h1>
              <h2>TEAM DWI</h2><br>
              <p class="footerfont" style="color:#ccc">서울특별시 강남구 역삼동 역삼역 3번출구에서 왼쪽으로 돌면 바로 보이는 문구점을지나 무거운 문을 열고 화난 경비아저씨를 피해 엘리베이터 탑승하시고 4층</p>
              <p class="footerfont" style="color:#ccc">TEL: 02-1234-5678</p>
              <p class="footerfont" style="color:#ccc">Email: solmin0302@naver.com</p>
              <p class="footerfont" style="color:#ccc">Copyright © 2018 정헌철, 박석현, 정승우, 이유진, 서솔민 Co., Ltd. All rights reserved.</p>
            </div>
            <div class="icons">
              <a href="#"><i class="fas fa-film"></i></a>
              <a href="#"><i class="fas fa-tshirt"></i></a>
              <a href="#"><i class="fas fa-utensils"></i></a>
            </div>
          </div>

        </div>
      </div>
  </div>

  <!--login section-->
 
  <section>
     <div id="loginContainer" style="display: none;">
	<div class="login-left-col">
		<img src="resources/img/login.jpg" width="100%" height="100%">
	</div>
	<div class="login-right-col">
		<h1>ACCOUNT LOGIN</h1>
		<div class="login-area">
			<form method="post" action="login">
			<input type="hidden" name="actionName" value="loginaction">
				<div class="id-bar">
					<input type="text" placeholder="ID" name="loginId" maxlength="30;">
				</div>
				<div class="password-bar">
					<input type="password" placeholder="Password" name="loginPwd"
						maxlength="30">
				</div>
				<div class="login-button">
					<input type=submit value="LOGIN">
				</div>
				</form>
			<div class="signUp-button">
				<a href="#">SIGN UP</a>
			</div>
		</div>
	</div>
</div>
</section>
<!--signIn-->
<section>
  		<div id="signInContainer" style="display: none;">
          <div class="signIn-left-col">
            <h1>SIGN UP</h1>
            <div class="signIn-area">
            <form method="post" action="regi">
            <input type="hidden" name="actionName" value="signUp">
              <div class="name-bar">
                <input type="text" placeholder="Name" name= "name" maxlength="30">
              </div>
              <div class="id-bar">
                <input type="text" placeholder="ID" name= "id" maxlength="30">
              </div>
              <div class="password-bar">
                <input type="password" id='pwd' placeholder="Password"name="pwd" maxlength="30">
              </div>
              <div class="password-bar">
                <input type="Password" id="repwd" placeholder="re-password" name="pwd2" maxlength="30">
                <p id="check-result"></p>
              </div>
              <div class="email-bar">
                <input type="email" placeholder="xxxx@xxx.xxx"name="email" maxlength="30">
              </div>
              <div class="gender-bar">
                <label class="Gender">
                  <input type="radio" name="gender"  value="남자" checked>MALE
                </label>
                <label class="Gender">
                  <input type="radio" name="gender"  value="여자">FEMALE
                </label>
              </div>
              <div class="signUp-button">
                <input type=submit value="SIGN UP" disabled="disabled">
              </div>
            </form>
            </div>
          </div>
          <div class="signIn-right-col">
            <img src="resources/img/login2.jpg" width="100%" height="100%">
          </div>
        </div>
  	</section>
<!-- myInfo pwd check-->
<section>
  <div id="MyInfoContainer" style="display: none;">
      <div class="MyInfo-left-col">
        <h1>My Account</h1>
        <div class="MyInfo-area">
        <form method="post" action="MyInfo">
        <input type="hidden" name="actionName" value="MyInfo">
        <div class="id-bar">
           <label>${sessionID }</label>
          </div>
          <div class="name-bar">
            <input type="text" placeholder="name" name= "mName" maxlength="30">
          </div>
          <div class="password-bar">
            <input type="password" placeholder="Password"name="mPwd" maxlength="30">
          </div>
          <div class="email-bar">
            <input type="email" placeholder="email"name="mEmail" maxlength="30">
          </div>
          <div class="MyInfo-button">
            <input type=submit value="UPDATE">
          </div>
        </form>
        </div>
      </div>
      <div class="MyInfo-right-col">
        <img src="resources/img/myInfo.jpg" width="100%" height="100%">
      </div>
    </div>
</section>
</body>
</html>
