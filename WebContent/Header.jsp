<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
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
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/CycleClub/">타요타요</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/CycleClub/cycleclub/club/club.do?action=clublist">ClubList</a></li>
					<li><a href=${sessionScope.mid==null?"/CycleClub/cycleclub/member/member.do?action=login":"/CycleClub/cycleclub/club/club.do?action=logout"}>
								${sessionScope.mid==null?"Login":"Logout"}</a></li>
					<li><a href="/CycleClub/cycleclub/member/member.do?action=join">Join</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('${pageContext.request.contextPath}/resources/cleanBoot/img/home-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<h1>TaYo TaYo</h1>
						<hr class="small">
						<span class="subheading">Let's ride together!</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/cleanBoot/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/cleanBoot/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/cleanBoot/js/clean-blog.min.js"></script>
</body>
</html>