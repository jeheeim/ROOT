<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<%
	String check = "";

	// 로그인 상황. 고객사: ture, 업무담당자: false
	boolean customerOrWorker = true;
	String navbarList = null;
	
	check = (String)session.getAttribute("idType");
	
	if(check == "true")
	{
		customerOrWorker = true;
	}
	else
	{
		customerOrWorker = false;
	}

	if(customerOrWorker)
	{
		navbarList = "navbarList/navbarList_customerAccount.jsp";
	}
	else
	{
		navbarList = "navbarList/navbarList_workerAccount.jsp";
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<title>template.jsp</title>

	<!-- 부트스트랩 -->
	<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
	<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body id="target">
	<div class="container">
		<div class="row">
			<div class="col-md-3" role="conmplementary">
				<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
					<img src="g4_logo.png">
					<ul class="nav bs-docs-sidenav">
						<!-- 여기있는 리스트만 가져오면 된다
						<li>
							<a href="#boolean1">h1</a>
							<a href="#boolean2">h2</a>
							<a href="#boolean3">h3</a>
						</li>
						-->
						<%
						out.flush();

						RequestDispatcher dispatcher = request.getRequestDispatcher(navbarList);
						dispatcher.include(request, response);
						%>
					</ul>
				</nav>
			</div>

			<div class="col-md-9" role="main">
				<div class="panel panel-default">
  					<div class="panel-body">
    					<div class="col-md-9"></div>

						<div class="col-md-3">
							<div id="control">
								<div class="btn-group" role="group" aria-label="...">
									<a class="btn btn-default" href="#" role="button">공지사항</a>
									<a class="btn btn-default" href="#" role="button">로그아웃</a>
								</div>
							</div>
						</div>
  					</div>
				</div>

				<div id="mainFrame">Main Frame</div>
			</div>
		</div>
	</div>


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>