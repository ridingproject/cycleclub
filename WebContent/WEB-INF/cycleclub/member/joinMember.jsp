<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
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
	<script type="text/javascript">
  	function loginCheck(){
  		var name = document.frm.mname.value;
  		var id = document.frm.mid.value;
  		var pw = document.frm.mpw.value;
  		var pwR = document.frm.mpwR.value;
  		var phone = document.frm.mphone.value;
  		
  		if((name.length==0)||name==""){
  			alert("이름을 입력하세요.");
  			document.frm.mname.focus();
  			return false;
  		}else if((id.length==0)||id==""){
  			alert("아이디를 입력하세요.");
  			document.frm.mid.focus();
  			return false;
  		}else if((pw.length==0)||pw==""){
  			alert("비밀번호를 입력하세요.");
  			document.frm.mpw.focus();
  			return false;
  		}else if((pwR.length==0)||pwR==""){
  			alert("비밀번호를 입력하세요.");
  			document.frm.mpwR.focus();
  			return false;
  		}else if((phone.length==0)||phone==""){
  			alert("전화번호를 입력하세요.");
  			document.frm.mphone.focus();
  			return false;
  		}else if(pw!=pwR){
  				alert("비밀번호가 다릅니다.");
  				document.frm.mpwR.value="";
  				return false;
  		}else{
  			return true;
  		}

  		
  	}
  
  </script>
	<%@ include file="/Header.jsp"%>
	<br><br><br>
	<input id="mm" value="${msg}" type="hidden">

	<script>
      var dd = document.getElementById("mm").value;
      if (dd != '') {
         alert("" + dd + "");
      }</script>

	<div class="container">
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-md-8">
				<h1>타요타요 회원가입</h1>
				<form action="member.do" method="post" id="frm" name="frm"
					class="bs-example bs-example-form" onSubmit="return loginCheck();"
					data-example-id="simple-input-groups"">
					<input type="hidden" name="action" value="${next}">
					<div class="control-group form-group">
						<div class="controls">
							<label>이름</label> <input type="text" class="form-control"
								id="mname" name="mname" required
								data-validation-required-message="Please enter your Name.">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Id</label> <input type="text" class="form-control"
								id="mid" name="mid" required
								data-validation-required-message="Please enter your ID.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Password</label> <input type="password"
								class="form-control" id="mpw" name="mpw" required
								data-validation-required-message="Please enter your PASSWORD.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Password check</label> <input type="text"
								class="form-control" id="mpwR" name="mpwR" required
								data-validation-required-message="Please enter your PASSWORD CHECK.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>Phone</label> <input type="text" class="form-control"
								id="phone" name="phone" required
								data-validation-required-message="Please enter your Phone number.">
						</div>
					</div>

					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary">Join</button>
					<button type="reset" class="btn btn-default"
						onclick="location.href='/CycleClub/cycleclub/member/member.do?action=login'">Cancel</button>
				</form>
			</div>

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</body>
</html>