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

<title>모임 등록</title>

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
		function club() {
			var cname = document.frm.cname.value;
			var cplace = document.frm.cplace.value;
			var cyear = document.frm.year.value;
			var ctime = document.frm.ctime.value;

			if (cname.length == 0 || cname == "") {
				alert("모임명을 입력하세요");
				document.all.cname.focus();
				return false;
			} else if (cplace.length == 0 || cpalce == "") {
				alert("장소를 입력하세요");
				document.all.cplace.focus();
				return false;
			} else if (cyear.length < 2) {
				alert("시간을 선택하세요");
				return false;
			} else {
				return true;
			}
		}

		function select() {

			var cyear = document.frm.year.value;
			var cmonth = document.frm.month.value;
			var cday = document.frm.day.value;
			var chour = document.frm.hour.value;
			var cmin = document.frm.min.value;

			var str = cyear + "/" + cmonth + "/" + cday + " " + chour + ":"
					+ cmin;
			document.frm.ctime.value = str;
		}
	</script>
	<%@ include file="/Header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
	<h1>모임 등록</h1><br>
		<c:if test="${!empty sessionScope.mid}">
			<form action="club.do" method="post" name="frm"
				class="bs-example bs-example-form"
				data-example-id="simple-input-groups" onSubmit="return club();">

				<input type="hidden" class="form-control" name="mid" id="mid">
				<input type="hidden" name="action" value="${next}"> <input
					type="hidden" class="form-control" name="ccode" id="ccode">
				<div class="control-group form-group">
					<div class="controls">
						<label>모임 이름</label> <input type="text" class="form-control"
							id="cname" name="cname" required
							data-validation-required-message="Please enter your ClubName.">
						<p class="help-block"></p>
					</div>
				</div>

				<div class="control-group form-group">
					<div class="controls">
						<label>모임 장소</label> <input type="text" class="form-control"
							id="cplace" name="cplace" required
							data-validation-required-message="Please enter your ClubName.">
						<p class="help-block"></p>
					</div>
				</div>

				<div class="control-group form-group">
					<div class="controls">
						<label>모임 시간</label> <span class="form-control"> <input type="hidden"
						name="ctime" id="ctime"> <select style="width: 60px"
						id="year" name="year" onChange="select()">
							<option value="2013" selected>2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
					</select>&nbsp;년&nbsp; <select style="width: 40px" id="month" name="month"
						onChange="select()">
							<option value="01" selected>01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select>&nbsp;월&nbsp; <select style="width: 40px" id="day" name="day"
						onChange="select()">
							<option value="01" selected>01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select>&nbsp;일 &nbsp; <select style="width: 40px" id="hour" name="hour"
						onChange="select()">
							<option value="01" selected>01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
					</select>&nbsp; 시 &nbsp; <select style="width: 40px" id="min" name="min"
						onChange="select()">
							<option value="00" selected>00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
					</select>&nbsp;분&nbsp;
					</span>
						<p class="help-block"></p>
					</div>
				</div>

				<div class="control-group form-group">
					<div class="controls">
						<label>주최자</label> <input type="text" class="form-control"
							id="mid" name="mid" value="<%=session.getAttribute("mid")%>" disabled 
							data-validation-required-message="Please enter your ClubName.">
						<p class="help-block"></p>
					</div>
				</div>


				<br>

				<button type="submit" class="btn btn-primary">저장</button>
				<button type="reset" class="btn btn-default"
					onclick="location.href='/CycleClub/cycleclub/club/club.do?action=clublist'">취소</button>
			</form>
		</c:if>

		<c:if test="${empty sessionScope.mid}">
			<br>
			<br>
			<br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/CycleClub/cycleclub/member/member.do?action=login"> 여 기
			</a>]를 클릭하여 로그인후 이용하실 수 있습니다.
</c:if>

</div>
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