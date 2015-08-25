<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>참여자 목록</title>

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
		<form class="bs-example bs-example-form"
			data-example-id="simple-input-groups">
			<input type="hidden" class="form-control" name="mid" id="mid">
			<input type="hidden" name="action" value="${next}"> <input
				type="hidden" class="form-control" name="ccode" id="ccode">

			<table calss="table table-striped" border="2" width="800">
				<tr>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">참 가 자 명 단</span>
						<!--  <input type="text" class="form-control" name="cname" id="cname"aria-describedby="basic-addon1" >-->
					</div>
				</tr>
				<% int count=0; %>
				<tr>


					<c:forEach var="mlist" items="${mlist}">
						<c:if test="${ccode eq mlist.mcode}">
							<c:if test="${(!empty mlist.mname) and (!(count eq 0))}">
								<%if(count !=0){ %>
								<c:out value=", " />
								<%} %>

							</c:if>
							<c:out value="${mlist.mname}" />
							<%count++; %>
						</c:if>
					</c:forEach>
					<%if(count==0){ %><br> &nbsp;&nbsp;&nbsp;
					<c:out value="참가자가 없습니다^^ 얼른 참가해주세요!" />
					<%} %>

				</tr>
			</table>

			<br>
			<br>

			<button type="submit" class="btn btn-default">목록</button>
		</form>
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