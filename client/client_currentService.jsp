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
					sql = "SELECT A.kms_index, B.registration_date, B.deadline, B.title, B.status, C.name FROM kms A, incident_management B, account C WHERE A.kms_index=B.index AND A.workerIdx=C.Idx AND B.customer=C.Idx";

					rs = stmt.executeQuery(sql);

					while(rs.next())
					{
						index = rs.getInt(1);
						date_added = rs.getString(2);
						date_due = rs.getString(3);
						title = rs.getString(4);
						status = rs.getInt(5);
						worker_name = rs.getString(6);
				%>
				<tr>
					<th scope="row" ><%=index%></th>
					<td><%=date_added%></td>
					<td><%=date_due%></td>
					<td><%=title%></td>
					<td><%=status_name%></td>
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