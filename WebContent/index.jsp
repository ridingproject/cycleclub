<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Main</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/cleanBoot/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/cleanBoot/css/clean-blog.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>


<style type="text/css">
@font-face {
	font-family: "HU미드나잇120";
	src:
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.eot');
	src:
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.eot?#iefix')
		format('embedded-opentype'),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.woff) format('
		woff '),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.ttf')
		format('truetype');
	src: local(※),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.woff')
		format('woff');
}

.tayoheader {
	font-family: "HU미드나잇120";
}

.notmember {
	font-family: "HU미드나잇120";
}
</style>
<script>
      var dd = document.getElementById("message").value;
      if (dd != '') {
         alert("" + dd + "");
         }
</script>
</head>

<body>
	<input id="message" value="${message}" type="hidden">

	<div class=tayoheader>
		<%@ include file="/Header.jsp"%>
	</div>
	

<c:if test="${empty sessionScope.mid}">
<div style="margin-left: 60px">
			<br>
			<br>
			<br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/CycleClub/cycleclub/member/member.do?action=login"> 여 기
			</a>]를 클릭하여 로그인후 이용하실 수 있습니다. <br><br><br><br><br><br>
</div>
</c:if>

	
<!-- 	
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Man must explore, and this is
							exploration at its greatest</h2>
						<h3 class="post-subtitle">Problems look mighty small from 150
							miles up</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on September 24, 2014
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">I believe every human has a finite
							number of heartbeats. I don't intend to waste any of mine.</h2>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on September 18, 2014
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Science has not yet mastered prophecy
						</h2>
						<h3 class="post-subtitle">We predict too much for the next
							year and yet far too little for the next ten.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on August 24, 2014
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Failure is not an option</h2>
						<h3 class="post-subtitle">Many say exploration is part of our
							destiny, but it’s actually our duty to future generations.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on July 8, 2014
					</p>
				</div>
				<hr>
				Pager
				<ul class="pager">
					<li class="next"><a href="#">Older Posts &rarr;</a></li>
				</ul>
			</div>
		</div>
	</div>

	<hr> -->


	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/cleanBoot/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/cleanBoot/js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/cleanBoot/js/clean-blog.min.js"></script>

</body>

</html>
