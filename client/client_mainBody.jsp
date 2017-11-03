<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
/*
number of tasks index
0: 신규
1: 접수

--------
2: 인시던트
3: 변경관리
4: 릴리즈
-------

5: 완료
6: 작업중
7: 서비스 요청 현황

그래프화 하고 싶으면 여기 있는 number_of_tasks[] 배열을 사용하는 것을 권장!
*/
int number_of_tasks[] = new int[8];

int i = 0;

try
{
	stmt = conn.createStatement();
	sql = "SELECT"
		+ " COUNT(*) AS count0,"
		+ " COUNT(CASE WHEN 'status'=0 THEN 1 END) AS count1,"
		+ " COUNT(CASE WHEN 'status'=1 THEN 1 END) AS count2,"
		+ " COUNT(CASE WHEN 'status'=2 THEN 1 END) AS count3,"
		+ " COUNT(CASE WHEN 'status'=3 THEN 1 END) AS count4,"
		+ " COUNT(CASE WHEN 'status'=4 THEN 1 END) AS count5,"
		+ " COUNT(CASE WHEN 'status'=5 THEN 1 END) AS count6,"
		+ " COUNT(CASE WHEN 'status'=6 THEN 1 END) AS count7"
		+ " FROM incident_management"
		+ " LEFT JOIN account ON incident_management.customer=account.idx"
		+ " WHERE account.id=\'" + session.getAttribute("user_id") + "\'";

	rs = stmt.executeQuery(sql);

	while(rs.next())
	{
		number_of_tasks[i]  = rs.getInt(1);

		i++;
	}

	number_of_tasks[6] = number_of_tasks[2] + number_of_tasks[3] + number_of_tasks[4];
	number_of_tasks[7] = number_of_tasks[0] + number_of_tasks[1] + number_of_tasks[5] + number_of_tasks[6];

	rs.close();
	stmt.close();
	conn.close();
}
catch(SQLException sqle)
{
	out.println(sqle.toString());
}
catch(Exception e)
{
	out.println(e.toString());
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common_header.jsp"%>	
	<title>client main body</title>
</head>

<body>
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
		<form class="form-horizontal">
			<table class="table table-striped">
				<thead>
					<tr><th colspan = "4"><p class="text-center">서비스 요청 현황</th></tr>
				</thead>
				
				<%
				/*
				url에 있는 param의 의미
				0 또는 없는 경우 : 내가 요구한 모든 일 검색
				1: 아직 배정되지않은 서비스 검색
				2: 배정은 됐지만 아직 작업에 들어가지않은 서비스
				3: 지금 작업중인 서비스
				4: 작업 완료된 서비스
				*/
				%>
				<tbody><tr style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2'"><td colspan = "4"><p class="text-center"><%=number_of_tasks[7]%></td></tr></tbody>
				
				<thead>
					<tr>
						<th><p class="text-center">신규</th>
						<th><p class="text-center">접수</th>
						<th><p class="text-center">작업중</th>
						<th><p class="text-center">완료</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=1'"><p class="text-center"><%=number_of_tasks[0]%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=2'"><p class="text-center"><%=number_of_tasks[1]%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=3'"><p class="text-center"><%=number_of_tasks[6]%></td>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=4'"><p class="text-center"><%=number_of_tasks[5]%></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%@ include file="../common_footer.jsp"%>
</body>
</html>