<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>모임 등록</title>
<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

</head>
<body>
<script type="text/javascript">
	function club(){
		var cname = document.frm.cname.value;
		var cplace = document.frm.cplace.value;
		var cyear = document.frm.year.value;
		var ctime = document.frm.ctime.value;
		
		if(cname.length==0||cname==""){
			alert("모임명을 입력하세요");
			document.all.cname.focus();
			return false;
		}else if(cplace.length==0||cpalce==""){
			alert("장소를 입력하세요");
			document.all.cplace.focus();
			return false;
		}else if(cyear.length<2){
			alert("시간을 선택하세요");
			return false;
		}else {return true;}
	}
	
	function select(){
		
		var cyear = document.frm.year.value;
		var cmonth = document.frm.month.value;
		var cday = document.frm.day.value;
		var chour = document.frm.hour.value;
		var cmin = document.frm.min.value;
		
		var str = cyear+"/"+cmonth+"/"+cday+" "+chour+":"+cmin;
		document.frm.ctime.value=str;
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
   <c:if test="${!empty sessionScope.mid}">
 <form action="club.do" method="post" name="frm" class="bs-example bs-example-form" data-example-id="simple-input-groups"  onSubmit="return club();">
 
    <input type="hidden" class="form-control" name="mid" id="mid">
    <input type="hidden" name="action" value="${next}">
    <input type="hidden" class="form-control" name="ccode" id="ccode">
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">모임이름</span>
      <input type="text" class="form-control" name="cname" id="cname"aria-describedby="basic-addon1" >
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">모임장소</span>
      <input type="text" class="form-control" name="cplace" id="cplace"aria-describedby="basic-addon1">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">모임시간</span>
    <!--   <input type="text" class="form-control" name="ctime" id="ctime" aria-describedby="basic-addon1" placeholder="2015-08-12 10:52" >
    -->
	
    <span class="form-control">
    <input type="hidden" name="ctime" id="ctime">
    <select style="width:60px" id="year" name="year"  onChange="select()">
    	<option value="2013" selected>2013</option>
    	<option value="2014">2014</option>
    	<option value="2015">2015</option>
    	<option value="2016">2016</option>
    	<option value="2017">2017</option>
    	<option value="2018">2018</option>
    	<option value="2019">2019</option>
    	<option value="2020">2020</option>
    	<option value="2021">2021</option>
    	<option value="2022">2022</option>
    	<option value="2023">2023</option>
    	<option value="2024">2024</option>
    	<option value="2025">2025</option>
    	<option value="2026">2026</option>
    	<option value="2027">2027</option>
    	<option value="2028">2028</option>
    	<option value="2029">2029</option>
    	<option value="2030">2030</option>
    </select>&nbsp;년&nbsp;
    <select style="width:40px" id="month" name="month" onChange="select()">
    	<option value="01" selected>01</option>
    	<option value="02">02</option>
    	<option value="03">03</option>
    	<option value="04">04</option>
    	<option value="05">05</option>
    	<option value="06">06</option>
    	<option value="07">07</option>
    	<option value="08">08</option>
    	<option value="09">09</option>
    	<option value="10">10</option>
    	<option value="11">11</option>
    	<option value="12">12</option>
    </select>&nbsp;월&nbsp;
   <select style="width:40px" id="day" name="day" onChange="select()">
    	<option value="01" selected>01</option>
    	<option value="02">02</option>
    	<option value="03">03</option>
    	<option value="04">04</option>
    	<option value="05">05</option>
    	<option value="06">06</option>
    	<option value="07">07</option>
    	<option value="08">08</option>
    	<option value="09">09</option>
    	<option value="10">10</option>
    	<option value="11">11</option>
    	<option value="12">12</option>
    	<option value="13">13</option>
    	<option value="14">14</option>
    	<option value="15">15</option>
    	<option value="16">16</option>
    	<option value="17">17</option>
    	<option value="18">18</option>
    	<option value="19">19</option>
    	<option value="20">20</option>
    	<option value="21">21</option>
    	<option value="22">22</option>
    	<option value="23">23</option>
    	<option value="24">24</option>
    	<option value="25">25</option>
    	<option value="26">26</option>
    	<option value="27">27</option>
    	<option value="28">28</option>
    	<option value="29">29</option>
    	<option value="30">30</option>
    	<option value="31">31</option>
    </select>&nbsp;일 &nbsp;
     <select style="width:40px" id="hour" name="hour" onChange="select()">
    	<option value="01" selected>01</option>
    	<option value="02">02</option>
    	<option value="03">03</option>
    	<option value="04">04</option>
    	<option value="05">05</option>
    	<option value="06">06</option>
    	<option value="07">07</option>
    	<option value="08">08</option>
    	<option value="09">09</option>
    	<option value="10">10</option>
    	<option value="11">11</option>
    	<option value="12">12</option>
    	<option value="13">13</option>
    	<option value="14">14</option>
    	<option value="15">15</option>
    	<option value="16">16</option>
    	<option value="17">17</option>
    	<option value="18">18</option>
    	<option value="19">19</option>
    	<option value="20">20</option>
    	<option value="21">21</option>
    	<option value="22">22</option>
    	<option value="23">23</option>
    	<option value="24">24</option>
    </select>&nbsp; 시 &nbsp;
   <select style="width:40px" id="min" name="min"onChange="select()">
    	<option value="00" selected>00</option>
    	<option value="10">10</option>
    	<option value="20">20</option>
    	<option value="30">30</option>
    	<option value="40">40</option>
    	<option value="50">50</option>
    </select>&nbsp;분&nbsp;
    </span>
    </div>
    

    
    
    
    
    <br>
    <div class="input-group">
      <span class="input-group-addon" id="basic-addon1">관리자 ID</span>
      <input type="text" class="form-control" name="mid" id="mid" value="<%= session.getAttribute("mid")%>" aria-describedby="basic-addon1" disabled>
    </div>
    <br>
    
    <button type="submit" class="btn btn-default">저장</button>
    <button type="reset" class="btn btn-default" onclick="location.href='/CycleClub/cycleclub/club/club.do?action=clublist'">취소</button>
  </form>
</c:if>

<c:if test="${empty sessionScope.mid}">
<br><br><br>
회원에게만 제공되는 서비스입니다.
<br>
 [<a href="/CycleClub/cycleclub/member/member.do?action=login"> 여  기 </a>]를 클릭하여 로그인후 이용하실 수 있습니다.
</c:if>

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
</body>
</html>