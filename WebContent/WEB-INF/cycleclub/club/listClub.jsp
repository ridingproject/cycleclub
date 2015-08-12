<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>모임 리스트</title>
<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

</head>
<body>

<div class="container">

		<!-- Static navbar -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Contact</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="./">Default <span
								class="sr-only">(current)</span></a></li>
						<li><a href="../navbar-static-top/">Static top</a></li>
						<li><a href="../navbar-fixed-top/">Fixed top</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>
	</div>
	<!-- 컨테이너 -->

<c:if test="${!empty sessionScope.mid}">
<form class="bs-example bs-example-form" data-example-id="simple-input-groups">
<table border="1">
	<tr>
		<td width="100" align="center">  순       번  </td>
		<td width="200" align="center">    모        임        명    </td>
		<td width="200" align="center">    장       소    </td>
		<td width="200" align="center">    시       간    </td>
		<td width="80" align="center">  참여 인원 </td>
		<!--  <td width="200" align="center">    기       타    </tr>-->
	<c:forEach var="clist" items="${clist}">
	<%int i=0; %>
			<tr>
				<td align="center">${clist.ccode}</td> 
				<td align="center"><a href="club.do?action=detail&ccode=${clist.ccode}">${clist.cname}</a></td>
				<td align="center">${clist.cplace}</td> 
				<td align="center">${clist.ctime}</td>
				<!-- <<c:forEach var="mlist" items="${mlist}">
					<c:if test="${(clist.ccode eq mlist.mcode) and (mlist.mjoin eq 1)}">
						<%i++; %>
					</c:if>
				</c:forEach>-->
				<td align="center"><a href="club.do?action=join"><%=i%></a></td>
				<!-- <td align="center"><a href="club.do?action=update&ccode=${clist.ccode}">[수정]</a>
				<a href="club.do?action=delete&ccode=${clist.ccode}">[삭제]</a></td>-->
			</tr>
	</c:forEach>
</table></form><br>
<form>
	<input type="hidden" name="action" value="${next}">
	<button type="submit" class="btn btn-default">등록</button>
</form>
</c:if>
<c:if test="${empty sessionScope.mid}">
<br><br><br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/cycleclub/member/member.do?action=login"> 여  기 </a>]를 클릭하여 로그인후 이용하실 수 있습니다.
</c:if>



	<!--       Main component for a primary marketing message or call to action
      <div class="jumbotron">
        <h1>Navbar example</h1>
        <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>
          <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
        </p>
      </div>-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
