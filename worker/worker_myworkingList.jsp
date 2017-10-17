<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>

	<title>Worker's Job List</title>
</head>

<body>
	<div><table class="table table-striped">
		<thead><tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>소속_depart</th><th>우선순위</th><th>상태</th>
		</tr></thead>

		<tbody>
		<%
		String sqlCount=null;
		String sqlList =null;
		int total = 0;

		try
		{
			stmt = conn.createStatement();
		
			sqlCount = "SELECT COUNT(*) FROM incident_management";
			rs = stmt.executeQuery(sqlCount);

			if(rs.next())
			{
				total = rs.getInt(1);
			}

			rs.close();
			out.print("총 게시물 : " + total + "개");

			sqlList = "SELECT incident_management.index, title, manager_id, priority, status from incident_management ORDER BY incident_management.index DESC, priority ASC";
			rs = stmt.executeQuery(sqlList);
			
			//등록된 글이 없을 경우
			if(total == 0)
			{
		%>
			<tr align="center"><td colspan="6">등록된 글이 없습니다.</td></tr>
		<%
			}//if

			//등록된 글이 1개 이상 있다면
			else
			{
				while(rs.next())
				{
					int idx = rs.getInt(1);			//index
					String title = rs.getString(2);	//title
					String managerId = rs.getString(3);	//manager_id
					int priority = rs.getInt(4);	//priority
					int status = rs.getInt(5);
		%>
			<tr style="cursor:pointer;" onClick="location.href='../mainPage.jsp?param=<%=idx%>'">
				<!-- 번호 제목 작성자 소속 우선순위 상태 -->
				<th scope="row"><%=idx%></th>
				<td><%=title%></td>
				<td><%=managerId%></td>
				<td>소속</td>
				<td><%=priority%></td>
				<td><%=status%></td>
			</tr>
		<%
				}//while
			}//else

			rs.close();
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			out.println(e.toString());
		}
		%>
			
		</tbody>
	</table></div>

	<%@include file="/common_footer.jsp"%>

</body>
</html>