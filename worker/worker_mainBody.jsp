<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/dblogin.jspf"%>

<%
// 내가 해야할 일들을 검색하기위해 세션의 id값을 받아옴
string myId = session.getAttribute("user_id");

int myTask = 0;
int task_request = 1;

int myIncident = 2;
int myChange = 3;
int myRelease = 4;

int task_new = 5;
int task_assigned = 6;
int task_onProgress = 7;
int task_finished = 8;

/* 쿼리문이 해결될때까지 주석처리
try
{
	conn=DriverManager.getConnection(dburl,dbuser,dbpw);  

	// myTask 구하기
	sql = "SELECT count(if(~)) FROM ~;" // 작업할 사람의 id가 세션의 id인 글들 모두 구하기
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	myTask = rs.getString().parseInt();

	// 전체 작업 리스트에서 배정되지않은 모든 일 숫자 세기
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	task_request = rs.getString().parseInt();


	// 내게 배정된 업무의 세부사항

	// 내 업무중에서 인시던트 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	myIncident = rs.getString().parseInt();


	// 내 업무중에서 변경관리 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	myChange = rs.getString().parseInt();


	// 내 업무중에서 릴리즈 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	myRelease = rs.getString().parseInt();


	// 전체 업무의 수
	
	// 전체 업무에서 아직 배정되지 않은 신규 업무
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	task_new = rs.getString().parseInt();
	

	// 전체 업무에서 배정된 업무의 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	task_assigned = rs.getString().parseInt();
	

	// 전체 업무에서 작업중인 업무의 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	task_onProgress = rs.getString().parseInt();
	

	// 전체 업무에서 종료된 업무의 수
	sql = "SELECT count(if()) FROM ~";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	// 문자열로 온 값을 정수로 변환
	task_finished = rs.getString().parseInt();
}
catch(Exception e)
{
	out.println(e.toString());
}
// 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
finally
{
	if(pstmt != null)	try	{ pstmt.close();}	catch(SQLException sqle){}            // PreparedStatement 객체 해제
	if(conn != null)	try	{ conn.close();}	catch(SQLException sqle){}            // Connection 해제
}
*/
%>


<!DOCTYPE html>
<html lang="ko">

<head>
	<title>Worker's Main Body</title>
	<%@include file="/common_header.jsp"%>
</head>

<body>
	<div class="col-sm-1"></div>
    <div class="col-sm-9">
    	<form class="form-horizontal">
    		<table class="table table-striped" style="text-align:center">
				<thead><tr>
					<th colspan = "3">내가 할일</th>
					<th colspan = "4">서비스 요청 현황</th>
				</tr></thead>

				<tbody><tr>
					<td colspan = "3" style="cursor:pointer;" onClick="/mainPage.jsp?mod=102&param=0;">
						<%=myTask%></td>
					<td colspan = "4" style="cursor:pointer;" onClick="/mainPage.jsp?mod=104&param=0;">
						<%=task_request%>
					</td>
				</tr></tbody>

				<thead><tr>
					<th>인시던트</th>
					<th>변경 관리</th>
					<th>릴리즈 관리</th>

					<th>신규</th>
					<th>접수</th>
					<th>작업중</th>
					<th>완료</th>
				</tr></thead>

				<tbody>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=102&param=1;">
						<%=myIncident%>
					</td>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=102&param=2;">
						<%=myChange%>
					</td>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=102&param=3;">
						<%=myRelease%>
					</td>

					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=104&param=1;">
						<%=task_new%>
					</td>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=104&param=2;">
						<%=task_assigned%>
					</td>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=104&param=3;">
						<%=task_onProgress%>
					</td>
					<td style="cursor:pointer;" onClick="/mainPage.jsp?mod=104&param=4;">
						<%=task_finished%>
					</td>
				</tbody>
			</table>
		</form>
	</div>
	
	<%@include file="/common_header.jsp"%>

</body>
</html>