<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>참가 회원</title>
<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

</head>
<body>
	
	<%@ include file="/Header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
    <form class="bs-example bs-example-form" data-example-id="simple-input-groups">
    <input type="hidden" class="form-control" name="mid" id="mid">
    <input type="hidden" name="action" value="${next}">
    <input type="hidden" class="form-control" name="ccode" id="ccode">
    
    <table calss="table table-striped" border="2" width="800">
    <tr>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">참  가  자    명  단</span>
      <!--  <input type="text" class="form-control" name="cname" id="cname"aria-describedby="basic-addon1" >-->
      </div></tr>
      <% int count=0; %>
 <tr>

		
     <c:forEach var="mlist" items="${mlist}">
      	<c:if test="${ccode eq mlist.mcode}">
      	<c:if test="${(!empty mlist.mname) and (!(count eq 0))}">
      			<%if(count !=0){ %>
      				<c:out value=", "/>
      			<%} %>
      			
      		</c:if>
      		<c:out value="${mlist.mname}"/>
      		<%count++; %>
     	 </c:if>
      </c:forEach>
     <%if(count==0){ %><br>
      	&nbsp;&nbsp;&nbsp;<c:out value="참가자가 없습니다^^ 얼른 참가해주세요!"/>
   <%} %>
      
      </tr>
      </table>

    <br><br>
    
    <button type="submit" class="btn btn-default">목록</button>
  </form>


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