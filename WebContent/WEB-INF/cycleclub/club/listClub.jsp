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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${!empty sessionScope.mid}">
<table border="1">
	<tr>
		<td width="100" align="center">  순       번  </td>
		<td width="200" align="center">    모        임        명    </td>
		<td width="200" align="center">    장       소    </td>
		<td width="200" align="center">    시       간    </td>
		<td width="200" align="center">    기       타    </tr>
	<c:forEach var="clist" items="${clist}">
			<tr>
				<td align="center">${clist.ccode}</td> 
				<td align="center"><a href="club.do?action=detail&ccode=${clist.ccode}">${clist.cname}</a></td>
				<td align="center">${clist.cplace}</td> 
				<td align="center">${clist.ctime}</td>
				<td align="center"><a href="club.do?action=update&ccode=${clist.ccode}">[수정]</a>
				<a href="club.do?action=delete&ccode=${clist.ccode}">[삭제]</a></td>
			</tr>
	</c:forEach>
</table><br>
<form>
	<input type="hidden" name="action" value="${next}">
	<input type="submit" class="btn btn-lg btn-primary" value="등    록">
</form>
</c:if>
<c:if test="${empty sessionScope.mid}">
<br><br><br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/cycleclub/member/member.do?action=login"> 여  기 </a>]를 클릭하여 로그인후 이용하실 수 있습니다.
</c:if>
</body>
</html>
