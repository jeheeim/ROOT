<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
/*
number of tasks index
0: 전체
1: 신규

--------
2: 인시던트
3: 변경관리
4: 릴리즈
-------

5: 완료
6: 작업중

그래프화 하고 싶으면 여기 있는 number_of_tasks[] 배열을 사용하는 것을 권장!
*/
int number_of_tasks[] = new int[7];

String userid = "";
userid = (String)session.getAttribute("user_id");

try
{
	stmt = conn.createStatement();
	sql = "select count(*) as count0, "
		+ "count(if(status=0, 1, NULL)) as count1, "
		+ "count(if(status=1, 1, NULL)) as count2, "
		+ "count(if(status=2, 1, NULL)) as count3, "
		+ "count(if(status=3, 1, NULL)) as count4, "
		+ "count(if(status=4, 1, NULL)) as count5 "
		+ "from incident_management "
		+ "left join account on incident_management.customer=account.idx "
		+ "where account.id=\'" + userid + "\'";

	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		number_of_tasks[0]  = rs.getInt(1);
		number_of_tasks[1]  = rs.getInt(2);
		number_of_tasks[2]  = rs.getInt(3);
		number_of_tasks[3]  = rs.getInt(4);
		number_of_tasks[4]  = rs.getInt(5);
		number_of_tasks[5]  = rs.getInt(6);
	}

	number_of_tasks[6] = number_of_tasks[2] + number_of_tasks[3] + number_of_tasks[4];

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
				<tbody><tr style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2'"><td colspan = "4"><p class="text-center"><%=number_of_tasks[0]%></td></tr></tbody>
				
				<thead>
					<tr>
						<th><p class="text-center">신규</th>
						<th><p class="text-center">작업중</th>
						<th><p class="text-center">완료</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=2&param=1'"><p class="text-center"><%=number_of_tasks[1]%></td>
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