<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception"%>

<% request.setCharacterEncoding("UTF-8");%>

<%
	/* 세션 및 아이디 체크 */ 
	int check = 0;

	// 로그인 상황. 고객사: ture, 업무담당자: false
	String navbarListPage = "/template/template-navbar.jsp";
	String mainBodyPage = null;
	
	try
	{
		check = (int)session.getAttribute("user_idtype");
	
		if(check == 0)
		{
			navbarListPage = "/navbarList/navbarList_customerAccount.jsp";
		}
		else
		{
			navbarListPage = "/navbarList/navbarList_workerAccount.jsp";
		}
	}
	catch(Exception e)
	{
		response.sendRedirect("/login.jsp");
	}

	/*
		패러미터 체크
	*/
	int pageMod = 0;
	int param = 0;
	
	if(request.getParameter("mod") != null)
	{
		pageMod = Integer.parseInt(request.getParameter("mod"));

	}	
	if(request.getParameter("param") != null)
	{
		param = Integer.parseInt(request.getParameter("param"));

	}
	
	switch(pageMod)
	{
		// 고객사 id
		case 1:
			mainBodyPage = "/client/client_mainBody.jsp";
			break;
		case 2:
			mainBodyPage = "/client/client_currentService.jsp?param=" + param;
			break;
		case 3:
			mainBodyPage = "/client/client_addService.jsp";
			break;
		case 4:
			mainBodyPage = "/client/client_serviceState.jsp?param=" + param;
			break;

		// 근무자 id
		case 101:
			mainBodyPage = "/worker/myWorkingNumber.jsp";
			break;

		// param 값이 0 이면 내 업무 검색, 1이면 배정되지않은 업무 전체 검색
		case 102:
			mainBodyPage = "/worker/worker_myworkingList.jsp?param=" + param;
			break;

		case 103:
			mainBodyPage = "/worker/worker_adding_newjob.jsp";
			break;

		// param 값이 0 이면 내 업무 검색, 1이면 배정되지않은 업무 전체 검색
		case 104:
			mainBodyPage = "/worker/worker_myworkingList.jsp?param=" + param;
			break;

		// 업무 확인하기. 세부 업무 보기
		case 105:
			mainBodyPage = "/worker/task_detail.jsp?param=" + param;
			break;

		// 기한 1주일이내인 업무 검색
		case 106:
			mainBodyPage = "/worker/deadline_soon_work.jsp";
			break;

		// 키워드 분석(차트화) 페이지
		case 107:
			mainBodyPage = "/worker/keyword_analysis.jsp";
			break;

		// 공지사항, 로그아웃
		case 201:
			mainBodyPage = "/notice/listNotice.jsp";
			break;

		case 202:
			mainBodyPage = "/notice/addNotice.jsp";
			break;

		case 203:
		    mainBodyPage = "/notice/detailNotice.jsp";
		    break;

		// 디폴트. 로그인시.
		default:
			if(check == 0)
			{
				mainBodyPage = "/client/client_mainBody.jsp";
			}
			else
			{
				mainBodyPage = "/worker/myWorkingNumber.jsp";
			}
			break;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>main page</title>
	<%@ include file="/common_header.jsp"%>
</head>

<body id="target">
	<div class="container" style="margin-top:20px">
		<div class="row">
			<div class="col-md-3" role="complementary">
				<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
					<a href="/mainPage.jsp">
						<img src="g4_logo.png" style="margin-bottom:30px">
					<a>
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
									<a class="btn btn-default" href="/mainPage.jsp?mod=201" role="button">공지사항</a>
									<a class="btn btn-default" href="/logout.jsp" role="button">로그아웃</a>
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
	
	<%@ include file="/common_footer.jsp"%>
</body>

</html>