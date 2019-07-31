<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
html, body { width: 100%; height: 100%; }
/* body{
	background: url('image/main_background.jpg') no-repeat center center fixed ;
  	-webkit-background-size: cover;
  	-moz-background-size: cover;
  	-o-background-size: cover;
  	background-size: cover;
  	background-position: 100% 100%;
} */
/* .container {
  width: 30%;
  height: 30%;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
} */

div#background_img {
	/* background: url('image/main_background.jpg') no-repeat ;
	background-position: center;
  	width:100%;
  	height:100%;
  	
    -webkit-transition: background-image .2s;
    -moz-transition: background-image .2s;
    -o-transition: background-image .2s;
    transition: background-image .2s; */
}
div#background_img img {
	width: 100%;
	height: 100%;
  	/* background-position: 100% 100%;  */
	position: fixed;
	opacity: 0;
    -webkit-transition: opacity 1s;
    -moz-transition: opacity 1s;
    -o-transition: opacity 1s;
    transition: opacity 1s;
    z-index: -1;
}
div#background_img img.show {
	opacity: 1;
}
.container {
  width: 80%;
  height: 80%;
  margin: 40px auto;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.centered {
  position: relative;
  display: inline-block;
  width: 100%;
  padding: 1em;
}

</style>
<script type="text/javascript">
/* var images = [
 "image/1.jpg",
 "image/2.jpg",
 "image/3.jpg",
 "image/main_background.jpg"]; */
    $(function () {
        var i = 0;
        /* $("#background_img").css("background-image", "url(" + images[i] + ")"); */
        setInterval(function () {
            i++;
            if (i == 5) {
                i = 0;
            }
            $("#background_img img").removeClass('show')
            $("#background_img img:eq("+i+")").addClass('show');
            /* $("#background_img").fadeOut("slow", function () {
                $(this).css("background-image", "url(" + images[i] + ")");
                $(this).fadeIn("slow");
            }); */
        }, 3000);
    });
</script>
</head> 
<body>
<div id="background_img">
		<img src="image/main_background2.jpg">
		<img src="image/main_background3.jpg">
		<img src="image/main_background4.jpg">
		<img src="image/main_background5.jpg">
		<img class="show" src="image/main_background1.jpg">
	</div>
	<c:import url="/header.do"/>
	
	<div class="container">
    <div class="outer">
        <div class="inner">
            <div class="centered">
                <p><c:import url="/main/main1.do" charEncoding="utf-8"/></p>
            </div>
        </div>
    </div>
    <%-- <c:if test="${sessionScope.login_id != null }">
		<div>
			<a href="qna/qna_list.do?id=${sessionScope.login_id}">QnA</a>
		</div>
	</c:if> --%>
</div>
</body>
</html>