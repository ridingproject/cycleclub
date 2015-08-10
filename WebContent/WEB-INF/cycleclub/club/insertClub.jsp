<%@ page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Club Regist</h1>
<form action="club.do" method="post">
모임코드: <input type="text" name="ccode"><br>
모임이름: <input type="text" name="cname"><br>
모임장소: <input type="text" name="cplace"><br>
모임시간: <input type="text" name="ctime"><br>
입력 예시 : 2015-08-09 15:30 <br> 
관리자 id: <input type="text" name="mid" value="<%= session.getAttribute("mid")%>"><br>
<input type="hidden" name="action" value="${next}">
<input type="submit" value=" 저장 ">
<input type="reset" value=" 취소 ">
</form>
</body>
</html>