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

</style>
</head>
<body>
<div class="container">
    <div class="outer">
        <div class="inner">
            <div class="centered">
                <div class="row">
                	<div class="col-12 form-group">
                		<h1 class="font">결제 완료</h1>
                	</div>
                </div>
                <div class="row">
                	<div class="col-6 form-group">
                		<a href="/O2_BNB_Project" class="font">홈으로 가기</a>
                	</div>
                	<div class="col-6 form-group">
                		<a href="/O2_BNB_Project/board/pay_list.do" class="font">예약리스트로가기</a>
                	</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>