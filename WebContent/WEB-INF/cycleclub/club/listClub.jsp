<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	<input id="message" value="${message}" type="hidden">

	<script>
		var dd = document.getElementById("message").value;
		if (dd != '') {
			alert("" + dd + "");
		}
	</script>
	<%@ include file="/Header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
	<!-- 컨테이너 -->
	<h1>모임 리스트</h1><br>
	<c:if test="${!empty sessionScope.mid}">
		<form class="bs-example bs-example-form"
			data-example-id="simple-input-groups">
			<table class="table table-striped" border="1">
				<tr>
					<td width="100" align="center">순 번</td>
					<td width="200" align="center">모 임 명</td>
					<td width="200" align="center">장 소</td>
					<td width="200" align="center">시 간</td>
					<td width="100" align="center">참여 인원</td>
					<!--  <td width="200" align="center">    기       타    </tr>-->
					<c:forEach var="clist" items="${clist}">
						<%
							int i = 0;
						%>
						<tr>
							<td align="center">${clist.ccode}</td>
							<td align="center"><a
								href="club.do?action=detail&ccode=${clist.ccode}">${clist.cname}</a></td>
							<td align="center">${clist.cplace}</td>
							<td align="center">${clist.ctime}</td>
							<!-- <<c:forEach var="mlist" items="${mlist}">
					<c:if test="${(clist.ccode eq mlist.mcode) and (mlist.mjoin eq 1)}">
						<%i++;%>
					</c:if>
				</c:forEach>-->
							<td align="center"><a
								href="club.do?action=joinlist&ccode=${clist.ccode}"><%=i%></a></td>
							<!-- <td align="center"><a href="club.do?action=update&ccode=${clist.ccode}">[수정]</a>
				<a href="club.do?action=delete&ccode=${clist.ccode}">[삭제]</a></td>-->
						</tr>
					</c:forEach>
			</table>
		</form>

		
		<form>
			<input type="hidden" name="action" value="${next}">
			<button type="submit" class="btn btn-primary">모임 등록</button>
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
	
	</div>
</body>
</html>
