<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbLogin.jspf"%>

<%
int param = 0;
try
{
	param = Integer.parseInt(request.getParameter("param"));
}
catch(Exception e){}

int index = 0;
String date_added = "";
String date_due = "";
String title = "";
int status = 0;
String status_name = "";
String worker_name = "";

String user_id = (String)session.getAttribute("user_id");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common_header.jsp"%>
	<title>client ID</title>
</head>
<body>
	<div class="bs-example" data-example-id="striped-table">
		<table class="table table-striped">
			<thead><tr>
				<th width = "20">번호</th><th width = "50">일자</th><th width = "50">기한</th><th width = "200">제목</th><th width = "70">상태</th><th width = "70">담당자</th>
			</tr></thead>
		
			<tbody>
				<%
				try
				{
					stmt = conn.createStatement();
					sql = "SELECT"
					+ " kms.kms_index, incident_management.registration_date, incident_management.deadline, incident_management.title, incident_management.status,"
					+ " workers.name as worker_name, clients.id as client_id FROM kms"
					+ " LEFT JOIN incident_management ON kms.incident_index=incident_management.idx"
					+ " LEFT JOIN account as workers ON kms.workerIdx=workers.idx"
					+ " LEFT JOIN account as clients ON incident_management.customer=clients.idx"
					+ " WHERE clients.id=\'" + user_id + "\'"
					+ " ORDER BY kms.kms_index DESC";

					rs = stmt.executeQuery(sql);

					while(rs.next())
					{
						index = rs.getInt(1);
						date_added = rs.getString(2);
						date_due = rs.getString(3);
						title = rs.getString(4);
						status = rs.getInt(5);
						worker_name = rs.getString(6);

						if(worker_name == null)
						{
							worker_name = "(미배정)";
						}
				%>
				<tr style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=4&param=<%=index%>'">
					<th scope="row" ><%=index%></th>
					<td><%=date_added%></td>
					<td><%=date_due%></td>
					<td><%=title%></td>
					<td><%=status%></td>
					<td><%=worker_name%></td>
				</tr>


				<%
					}

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
					
			</tbody>
		</table>
	</div>

	<%@include file="../common_footer.jsp"%>

  </body>
</html>