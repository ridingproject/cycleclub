 <%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>모임 목록 조회</title>

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
	<div class="container" style="width: 1000px">
		<!-- 컨테이너 -->
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
								<td align="center"><c:out value="${fn:substring(clist.ctime, 0, 16)}"/></td>
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
<br><br>
		</c:if>


<c:if test="${empty sessionScope.mid}">
			<br>
			<br>
			<br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/CycleClub/cycleclub/member/member.do?action=login"> 여 기
			</a>]를 클릭하여 로그인후 이용하실 수 있습니다. <br><br><br><br><br><br>
</c:if>



		<!-- jQuery -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/bootstrap/js/clean-blog.min.js"></script>

	</div>
</body>
</html>
