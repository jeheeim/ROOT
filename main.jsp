<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	boolean check = true;

	// 로그인 상황. 고객사: ture, 업무담당자: false
	boolean customerOrWorker = true;
	String navbarListPage = null;
	String mainBodyPage = null;
	
	try
	{
		//check = session.getAttribute("idType");
	}
	catch(Exception e)
	{
		out.write(e.toString());
	}
	
	if(check)
	{
		customerOrWorker = true;
		
		navbarListPage = "/navbarList/navbarList_customerAccount.jsp";
		//mainBodyPage = "/client/client_mainBody.jsp";
	}
	else
	{
		customerOrWorker = false;

		navbarListPage = "/navbarList/navbarList_workerAccount.jsp";
		mainBodyPage = "/worker/worker_mainBody.jsp";
	}

	/* PARAMETER CHECKING
	패러미터 값을 체크해서 메인 페이지를 정하는 부분
	
	001: 고객사 아이디 메인 페이지
	101: 근무자 아이디 메인 페이지
	*/

	String selectMainPage = request.getParameter("cmd");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>main page</title><style>
div.container {
    width: 100%;
    border: 1px solid gray;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    padding: 1em;
    overflow: hidden;
}
</style>
	
</head>

<body name="mainBody">
	<header>
		<a href="#">공지사항</a>
		<a href="#">로그아웃</a>
	</header>
	<nav>
		<ul class="nav bs-docs-sidenav">
			<jsp:include page="<%= navbarListPage %>" flush="true" />
		</ul>
	</nav>
	<article src="worker_mainBody.jsp">
		<h1>Hello World!</h1>
	</article>
</body>

</html>