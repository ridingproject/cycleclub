<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 상세조회</title>
</head>
<body>
<h1>모임 상세조회</h1>

<table border="1" width="800px" class="table table-striped">
<form action="club.do" method="get">
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
</form>
	<!--  
	<td>[<a href="club.do?action=update&ccode=${cvo.ccode}">모임 참가</a>]
	[<a href="club.do?action=delete&ccode=${cvo.ccode}">모임 취소</a>]</td>
	바꿔야함 버튼 -->
</table>
</body>
</html>