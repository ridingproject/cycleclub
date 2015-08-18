<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 상세조회</title>
</head>
<body>
<script type="text/javascript">
	function joinAlert(){
		alert("모임에 참가하셨습니다!");
	}
	function cancelAlert(){
		alert("모임 참가를 취소 하였습니다.");
	}
	
	
	function deleteCheck(){
		var select = confirm("정말 삭제하시겠습니까?");
		if(select == true){
			alert("삭제되었습니다.");
			location.href='/CycleClub/cycleclub/club/club.do?action=delete&mid=${cvo.mid}&ccode=${cvo.ccode}'
		}else{
			alert("취소되었습니다.");
			return;
		}
	}
	
</script>

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
	
	
	<h1>모임 상세조회</h1><br>

	<form action="club.do" method="get">
		<input type="hidden" name="action" value="${next}">
		<input type="hidden" name="ccode" value="${cvo.ccode}"> <!-- 지우지마...update에 필요하다고ㅋㅋㅋ -->
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
				<td width="319">${cvo.ctime}</td>
			</tr>
			<tr>
				<td align="center" width="76">주최자</td>
				<td width="319">${cvo.mid}</td>
			</tr>
		</table>
		<c:if test="${cvo.mid eq mid}">
			<button type="submit" class="btn btn-default">수정</button>
		</c:if>
		<% int count=0; %>
		<c:forEach var="mlist" items="${mlist}">
			<c:if test="${mlist.mid eq mid}">
				<c:set var="checkCode" value="${mlist.mcode}"/>

			</c:if>
		
		</c:forEach>
		
				<c:if test="${checkCode ne cvo.ccode}">
					<button type="button" class="btn btn-default" onclick="location.href='/CycleClub/cycleclub/club/club.do?action=join&mid=<%= session.getAttribute("mid")%>&ccode=${cvo.ccode}',joinAlert()" >모임 참여</button>
				</c:if>
				<c:if test="${checkCode eq cvo.ccode}">
					<button type="button" class="btn btn-default" onclick="location.href='/CycleClub/cycleclub/club/club.do?action=unjoin&mid=<%= session.getAttribute("mid")%>',cancelAlert()">모임 취소</button>
				</c:if>
		<c:if test="${cvo.mid eq mid}">
			<button type="button" class="btn btn-default" onclick="deleteCheck()">모임 삭제</button>
			</c:if>
		<button type="button" class="btn btn-default" onclick="location.href='/CycleClub/cycleclub/club/club.do?action=clublist'">목록으로</button>
		<!-- javascript:history.back(-1)는 Backspace와 같은 것 (뒤로가기) -->
	</form>

</body>
</html>