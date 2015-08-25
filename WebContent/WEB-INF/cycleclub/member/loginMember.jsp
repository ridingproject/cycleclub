<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/landing-page.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input id="mm" value="${msg}" type="hidden">

	<script>
      var dd = document.getElementById("mm").value;
      if (dd != '') {
         alert("" + dd + "");
      }</script>
    <%@ include file="/Header.jsp"%>
    <br><br><br>
	<div class="container">
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-md-8">
				<h1>타요타요에 오신것을 환영합니다.</h1>
				<form action="member.do" method="post" class="bs-example bs-example-form" data-example-id="simple-input-groups">
				<input type="hidden" name="action" value="${next}">
					<div class="control-group form-group">
						<div class="controls">
							<label>Id</label> <input type="text" class="form-control"
								id="mid" name="mid"required
								data-validation-required-message="Please enter your ID.">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Password</label> <input type="password"
								class="form-control" id="mpw" name="mpw" required
								data-validation-required-message="Please enter your PASSWORD.">
						</div>
					</div>

					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary">Login</button>
					<button type="reset" class="btn btn-default"
			onclick="location.href='/CycleClub/cycleclub/member/member.do?action=join'">Join</button>
				</form>
			</div>

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	 

</body>
</html>