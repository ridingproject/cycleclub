<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
<h1>CycleClub에 오시것을 환영합니다</h1>
<form action="member.do" method="post" class="bs-example bs-example-form" data-example-id="simple-input-groups">
    <input type="hidden" name="action" value="${next}">

    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">아이디</span>
      <input type="text" class="form-control" name="mid" id="mid" aria-describedby="basic-addon1" placeholder="아이디를 입력하세요" >
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">비밀번호</span>
      <input type="text" class="form-control" name="mpw" id="mpw" aria-describedby="basic-addon1" placeholder="비밀번호를 입력하세요" >
    </div>
    <br>
    
    <button type="submit" class="btn btn-default" >로그인</button>
   <button type="reset" class="btn btn-default" onclick="joinMember.jsp">회원가입</button>
  </form>
</body>
</html>