<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>모임 수정</title>

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
	<%@ include file="/Header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">

		<h1>모임 수정</h1>
		<form action="club.do" method="post"
			class="bs-example bs-example-form"
			data-example-id="simple-input-groups">

			<input type="hidden" name="action" value="${next}">
			<!-- update넘어옴 -->

			<div class="control-group form-group">
				<div class="controls">
					<label>모임 이름</label> <input type="text" class="form-control"
						id="cname" name="cname" value="${cvo.cname}" required
						data-validation-required-message="Please enter your Name.">
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group form-group">
				<div class="controls">
					<label>모임 장소</label> <input type="text" class="form-control"
						id="cplace" name="cplace" value="${cvo.cplace}" required
						data-validation-required-message="Please enter your Name.">
					<p class="help-block"></p>
				</div>
			</div>
			
						<div class="control-group form-group">
				<div class="controls">
					<label>모임 시간</label> <input type="text" class="form-control"
						id="ctime" name="ctime" value="${cvo.ctime}" required
						data-validation-required-message="Please enter your Name.">
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group form-group">
				<div class="controls">
					<label>주최자</label> <input type="text" class="form-control"
						id="mid" name="mid" value="${cvo.mid}" disable
						data-validation-required-message="Please enter your Name.">
					<p class="help-block"></p>
				</div>
			</div>
			
			<br>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-default"
				onclick="javascript:history.back(-1)">취소</button>
		</form><br><br>

	</div>
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
<script type="text/javascript">
var mid = document.getElementById('mid') ;
mid.readOnly = true;

</script>
</html>