 <%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/clean-blog.min.css"
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
<script>
      var dd = document.getElementById("mm").value;
      if (dd != '') {
         alert("" + dd + "");
      }
</script>
</head>
<body>
	<input id="mm" value="${msg}" type="hidden">

	
    <%@ include file="/Header.jsp"%>
    <br>
	<div class="container" style="width: 900px; vertical-align: middle;">
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
				<div class="col-md-8">
				<form action="member.do" method="post" class="bs-example bs-example-form" data-example-id="simple-input-groups">
				
				<input type="hidden" name="action" value="${next}">
					<div class="control-group form-group">
						<div class="controls">
							<label>Id</label>
							 <input type="text" class="form-control" id="mid" name="mid" required data-validation-required-message="Please enter your ID.">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Password</label> <input type="password"
								class="form-control" id="mpw" name="mpw" required
								data-validation-required-message="Please enter your PASSWORD.">
						</div>
					</div><br>

					<button type="submit" class="btn btn-primary" style="margin-left: 110px">Login</button>
					<button type="reset" class="btn btn-default"
			onclick="location.href='/CycleClub/cycleclub/member/member.do?action=join'">Join</button>
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div><br><br>
	<!-- /.container -->
	 <!-- jQuery -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/clean-blog.min.js"></script>

</body>
</html>