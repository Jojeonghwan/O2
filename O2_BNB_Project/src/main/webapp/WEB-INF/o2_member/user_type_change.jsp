<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">

<style>
html, body { width: 100%; height: 100%; }
font{
	font-family: 'Noto Sans KR', sans-serif;
}
body{
/* 	background: url('image/main_background.jpg') no-repeat center center fixed ; */
  	-webkit-background-size: cover;
  	-moz-background-size: cover;
  	-o-background-size: cover;
  	background-size: cover;
  	background-position: 100% 100%;
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
.icon{
width: 50px;
height: 50px;
}

</style>
</head>
<body>
<div class="container">
    <div class="outer">
        <div class="inner">
            <div class="centered">
	            <form action="change.do" method="post">
	                <div class="row">
	                	<div class="col-12 form-group">
	                		<h4 class="font">본인의 계정을 게스트에서 호스트로 전환하시겠습니까?</h4>
	                	</div>
	                </div>
	                <div class="row">
	                	<div class="col-12 form-group">
	                		<h4 class="font">계정을 호스트로 전환시 제약이 있을수 있습니다.</h4>
	                	</div>
	                </div>
	                <div class="row">
	                	<div class="col-12 form-group">
	                		<input type="image" name="submit" src="../image/transformM1.png" class="icon" value="" />
	                	</div>
	                </div>
	            </form>
            </div>
        </div>
    </div>
</div>







</body>
</html>