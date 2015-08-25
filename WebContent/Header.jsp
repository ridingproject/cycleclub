<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>


	<div class="container">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top topnav"
			role="navigation">
			<div class="container topnav">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand topnav" href="/CycleClub/cycleclub/club/club.do?action=clublist">TayoTayo</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/CycleClub/cycleclub/club/club.do?action=clublist">Clublist</a></li>
						<li><a href=${sessionScope.mid==null?"/CycleClub/cycleclub/member/member.do?action=login":"/CycleClub/cycleclub/club/club.do?action=logout"}>
										${sessionScope.mid==null?"Login":"Logout"}</a></li>
						<li><a href="/CycleClub/cycleclub/member/member.do?action=join">Join</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</div>
	<!-- 컨테이너 -->
</body>
</html>