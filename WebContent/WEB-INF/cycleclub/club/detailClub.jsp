 <%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
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

<title>모임 상세조회</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/cleanBoot/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/cleanBoot/css/clean-blog.min.css"
	rel="stylesheet">

<style type="text/css">
@font-face {
	font-family: "HU미드나잇120";
	src:
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.eot');
	src:
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.eot?#iefix')
		format('embedded-opentype'),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.woff) format('woff '),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.ttf')
		format('truetype');
	src: local(※),
		url('${pageContext.request.contextPath}/resources/font/HU미드나잇120.woff')
		format('woff');
}

.container {
	font-family: "HU미드나잇120";
}

.notmember {
	font-family: "HU미드나잇120";
}
</style>
</head>
<body>
	<script type="text/javascript">
		function joinAlert() {
			alert("모임에 참가하셨습니다!");
		}
		function cancelAlert() {
			alert("모임 참가를 취소 하였습니다.");
		}

		function deleteCheck() {
			var select = confirm("정말 삭제하시겠습니까?");
			if (select == true) {
				alert("삭제되었습니다.");
				location.href = '/CycleClub/cycleclub/club/club.do?action=delete&mid=${cvo.mid}&ccode=${cvo.ccode}'
			} else {
				alert("취소되었습니다.");
				return;
			}
		}
	</script>

	<%@ include file="/Header.jsp"%>
	<div class="container" style="width: 900px">
	<h1>모임 상세조회</h1>
	<br>

	<form action="club.do" method="get">
		<input type="hidden" name="action" value="${next}"> <input
			type="hidden" name="ccode" value="${cvo.ccode}">
		<!-- 지우지마...update에 필요하다고ㅋㅋㅋ -->
		<table border="1" width="800px" class="table table-striped">
			<tr>
				<td align="center" width="76">모임코드</td>
				<td width="319">${cvo.ccode}</td>
			</tr>
			<tr>
				<td align="center" width="76">모임이름</td>
				<td width="319">${cvo.cname}</td>
			</tr>
			<tr>
				<td align="center" width="76">모임장소</td>
				<td width="319">${cvo.cplace}</td>
			</tr>
			<tr>
				<td align="center" width="76">모임시간</td>
				<td width="319"><c:out value="${fn:substring(cvo.ctime, 0, 16)}"/></td>
			</tr>
			<tr>
				<td align="center" width="76">주최자</td>
				<td width="319">${cvo.mid}</td>
			</tr>
			
		</table>
		<c:if test="${cvo.mid eq mid}">
			<button type="submit" class="btn btn-default">수정</button>
		</c:if><br><br><br>
		<%
			int count = 0;
		%>
		<c:forEach var="mlist" items="${mlist}">
			<c:if test="${mlist.mid eq mid}">
				<c:set var="checkCode" value="${mlist.mcode}" />

			</c:if>

		</c:forEach>

		<c:if test="${checkCode ne cvo.ccode}">
			<button type="button" class="btn btn-primary"
				onclick="location.href='/CycleClub/cycleclub/club/club.do?action=join&mid=<%= session.getAttribute("mid")%>&ccode=${cvo.ccode}',joinAlert()">모임
				참여</button>
		</c:if>
		<c:if test="${checkCode eq cvo.ccode}">
			<button type="button" class="btn btn-primary"
				onclick="location.href='/CycleClub/cycleclub/club/club.do?action=unjoin&mid=<%=session.getAttribute("mid")%>',cancelAlert()">모임
				취소</button>
		</c:if>
		<c:if test="${cvo.mid eq mid}">
			<button type="button" class="btn btn-primary" onclick="deleteCheck()">모임 삭제</button>
		</c:if>
		<button type="button" class="btn btn-default"
			onclick="location.href='/CycleClub/cycleclub/club/club.do?action=clublist'">목록으로</button>
		<!-- javascript:history.back(-1)는 Backspace와 같은 것 (뒤로가기) -->
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
</html>