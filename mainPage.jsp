<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>

<%
/*
세션 및 아이디 체크
	

*/ 
boolean check = false;

// 로그인 상황. 고객사: ture, 업무담당자: false
boolean customerOrWorker = true;
String navbarListPage = null;
String mainBodyPage = null;
	
try
{
	//check = (int)session.getAttribute("idType");
	
	if(check)
	{
		customerOrWorker = true;
		
		navbarListPage = "/navbarList/navbarList_customerAccount.jsp";
	}
	else
	{
		customerOrWorker = false;

		navbarListPage = "/navbarList/navbarList_workerAccount.jsp";
	}
} 
catch(Exception e)
{
	out.write(e.toString());
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
case 1:
			//mainBodyPage = "/customer/customer_mainBody.jsp";
			break;

		case 101:
			mainBodyPage = "/worker/worker_mainBody.jsp";
			break;

		case 102:
			mainBodyPage = "/worker/worker_myworkingList.jsp";
			break;

		case 103:
			mainBodyPage = "/worker/worker_adding_newjob.jsp";
			break;

		case 104:
			mainBodyPage = "/worker/worker_myworkingList.jsp";
			break;

		case 201:
			mainBodyPage = "/notice/listNotice.jsp";
			break;

		case 202:
			mainBodyPage = "/notice/addNotice.jsp";
			break;

		default:
			if(check)
			{
				//mainBodyPage = "/customer/customer_mainBody.jsp";
			}
			else
			{
				mainBodyPage = "/worker/worker_mainBody.jsp";
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
					<a href="/mainPage.jsp"><img src="g4_logo.png" style="margin-bottom:30px"><a>
					<ul class="nav bs-docs-sidenav"><jsp:include page="<%= navbarListPage %>" flush="true" /></ul>
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
	
	<%@ include file="/common_footer.jsp"%>
</body>

</html>