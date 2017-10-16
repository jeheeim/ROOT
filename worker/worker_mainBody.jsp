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
    		<table class="table table-striped">
				<thead><tr>
					<th colspan = "3"><p class="text-center">내가 할일</th>
					<th colspan = "4"><p class="text-center">서비스 요청 현황</th>
				</tr></thead>
				<tbody><tr>
					<td colspan = "3"><p class="text-center"><%=myTask%></td>
					<td colspan = "4"><p class="text-center"><%=task_request%></td>
				</tr></tbody>
				<thead><tr>
					<th><p class="text-center">인시던트</th>
					<th><p class="text-center">변경 관리</th>
					<th><p class="text-center">릴리즈 관리</th>

					<th><p class="text-center">신규</th>
					<th><p class="text-center">접수</th>
					<th><p class="text-center">작업중</th>
					<th><p class="text-center">완료</th>
				</tr></thead>
				<tbody>
					<td><p class="text-center"><%=myIncident%></td>
					<td><p class="text-center"><%=myChange%></td>
					<td><p class="text-center"><%=myRelease%></td>

					<td><p class="text-center"><%=task_new%></td>
					<td><p class="text-center"><%=task_assigned%></td>
					<td><p class="text-center"><%=task_onProgress%></td>
					<td><p class="text-center"><%=task_finished%></td>
				</tbody>
			</table>
		</form>
	</div>
	
	<%@include file="/common_header.jsp"%>

</body>
</html>