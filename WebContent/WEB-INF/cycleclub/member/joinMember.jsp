 <%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입</title>

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
	<script type="text/javascript">
  	function loginCheck(){
  		//var name = document.frm.mname.value;
  		//var id = document.frm.mid.value;
  		var pw = document.frm.mpw.value;
  		var pwR = document.frm.mpwR.value;
  		//var phone = document.frm.mphone.value;
  		
  		/*if((name.length==0)||name==""){
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
  		}else */if(pw!=pwR){
  				alert("비밀번호가 다릅니다.");
  				document.frm.mpwR.value="";
  				return false;
  		}else{
  			return true;
  		}

  		
  	}
  
  </script>
	<%@ include file="/Header.jsp"%>
	<br>
	<input id="mm" value="${msg}" type="hidden">

	<script>
      var dd = document.getElementById("mm").value;
      if (dd != '') {
         alert("" + dd + "");
      }</script>

	<div class="container" style="width: 900px; vertical-align: middle;">
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-md-8">
				<form action="member.do" method="post" id="frm" name="frm"
					class="bs-example bs-example-form" onSubmit="return loginCheck();"
					data-example-id="simple-input-groups"">
					<input type="hidden" name="action" value="${next}">
					<div class="control-group form-group">
						<div class="controls">
							<label>Name</label> <input type="text" class="form-control"
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
							<label>Password check</label> <input type="password"
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
					</div><br>

					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary" style="margin-left: 110px">Join</button>
					<button type="reset" class="btn btn-default"
						onclick="location.href='/CycleClub/cycleclub/member/member.do?action=login'">Cancel</button>
				</form>
			</div>

		</div>
		<!-- /.row -->
	</div><br><br>
	<!-- /.container -->
	
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