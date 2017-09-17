<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<%
	int check = 1;

	// 로그인 상황. 고객사: ture, 업무담당자: false
	boolean customerOrWorker = true;
	String navbarListPage = null;
	String mainBodyPage = null;
	
	try
	{
		//check = (int)session.getAttribute("idType");
	
		if(check == 0)
		{
			customerOrWorker = true;
		
			navbarListPage = "/navbarList/navbarList_customerAccount.jsp";
			//mainBodyPage = "/client/client_mainBody.jsp";
		}
		else if(check == 1)
		{
			customerOrWorker = false;

			navbarListPage = "/navbarList/navbarList_workerAccount.jsp";
			mainBodyPage = "/worker/worker_mainBody.jsp";
		}
	}
	catch(Exception e)
	{
		out.write(e.toString());
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>main page</title>
	<%@ include file="common_header.jsp"%>
</head>

<body id="target">
	<div class="container" style="margin-top:20px">
		<div class="row">
			<div class="col-md-3" role="complementary">
				<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
					<img src="g4_logo.png" style="margin-bottom:30px">
					<ul class="nav bs-docs-sidenav">
						<jsp:include page="<%= navbarListPage %>" flush="true" />
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

				<div id="mainFrame">
					<jsp:include page="<%= mainBodyPage %>" flush="true" />
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="common_footer.jsp"%>
</body>

</html>