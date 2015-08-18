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
<script type="text/javascript">
  	function loginCheck(){
  		var name = document.frm.mname.value;
  		var id = document.frm.mid.value;
  		var pw = document.frm.mpw.value;
  		var pwR = document.frm.mpwR.value;
  		var phone = document.frm.mphone.value;
  		
  		if((name.length==0)||name==""){
  			alert("이름을 입력하세요.");
  			document.frm.mname.focus();
  			return false;
  		}else if((id.length==0)||id==""){
  			alert("아이디를 입력하세요.");
  			document.frm.mid.focus();
  			return false;
  		}else if((pw.length==0)||pw==""){
  			alert("비밀번호를 입력하세요.");
  			document.frm.mpw.focus();
  			return false;
  		}else if((pwR.length==0)||pwR==""){
  			alert("비밀번호를 입력하세요.");
  			document.frm.mpwR.focus();
  			return false;
  		}else if((phone.length==0)||phone==""){
  			alert("전화번호를 입력하세요.");
  			document.frm.mphone.focus();
  			return false;
  		}else if(pw!=pwR){
  				alert("비밀번호가 다릅니다.");
  				document.frm.mpwR.value="";
  				return false;
  		}else{
  			return true;
  		}

  		
  	}
  
  </script>

<input id="mm" value="${msg}" type="hidden">
 
   <script>
      var dd = document.getElementById("mm").value;
      if (dd != '') {
         alert("" + dd + "");
      }</script>
<form action="member.do" method="post"  id ="frm" name="frm" class="bs-example bs-example-form" onSubmit="return loginCheck();" data-example-id="simple-input-groups" ">
	<h1>타요타요 회원가입</h1>
    <input type="hidden" name="action" value="${next}">
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">이름</span>
      <input type="text" class="form-control" name="mname" id="mname" aria-describedby="basic-addon1" >
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">id</span>
      <input type="text" class="form-control" name="mid" id="mid" aria-describedby="basic-addon1">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">비밀번호</span>
      <input type="password" class="form-control" name="mpw" id="mpw" aria-describedby="basic-addon1">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">비밀번호 확인</span>
      <input type="password" class="form-control" name="mpwR" id="mpwR" aria-describedby="basic-addon1">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">전화번호</span>
      <input type="text" class="form-control" name="mphone" id="mphone" aria-describedby="basic-addon1" >
    </div>
    <br>
    
    <button type="submit" class="btn btn-default" >가입하기</button>
    <button type="reset" class="btn btn-default" onclick="location.href='/CycleClub/cycleclub/member/member.do?action=login'">취소</button>
  </form>
</body>
</html>