<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>

	<title>Worker's Job List</title>
</head>


<%
	int param = Integer.parseInt(request.getParameter("param"));
	String worker_id = "";

	worker_id = (String)session.getAttribute("user_id");

	int count = 0;

	int idx = 0;
	String title = "";
	String client_name = "";
	String client_dept = "";
	int priority = 0;
	int status = 0;

	try{
		stmt = conn.createStatement();

		if(param == 0)
		{
			sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status, worker.id from kms "
				+ "LEFT JOIN incident_management as inci ON inci.idx=kms.incident_index "
				+ "LEFT JOIN account as client ON inci.customer=client.idx "
				+ "LEFT JOIN company_department as dept ON client.department=dept.idx "
				+ "LEFT JOIN account as worker ON worker.idx=kms.workerIdx "
				+ "WHERE worker.id=\'" + worker_id + "\' "
				+ "ORDER BY kms_index DESC, inci.priority ASC";
		
		}
		else
		{
			sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status from kms "
				+ "LEFT JOIN incident_management as inci ON inci.idx=kms.incident_index "
				+ "LEFT JOIN account as client ON inci.customer=client.idx "
				+ "LEFT JOIN company_department as dept ON client.department=dept.idx "
				+ "ORDER BY kms_index DESC, inci.priority ASC";
		}
		
		rs = stmt.executeQuery(sql);
		rs.last();
		count = rs.getRow();
		rs.beforeFirst();
%>


<body>
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>소속_depart</th>
				<th>우선순위</th>
				<th>상태</th>
				</tr>
			</thead>
			<tbody>
			
				<%
					if(count == 0){	//등록된 글이 없을 경우
				%>
						<tr align="center">
							<td colspan="6">등록된 글이 없습니다.</td>
						</tr>
				<%
					}//if
					else{	//등록된 글이 1개 이상 있다면
						while(rs.next()){
							idx = rs.getInt(1);
							title = rs.getString(2);
							client_name = rs.getString(3);
							client_dept = rs.getString(4);
							priority = rs.getInt(5);
							status = rs.getInt(6);
				%>
				<tr>
					<th scope="row">
						<!--번호-->
						<%=idx%>
					</th>
					<td>
						<!--제목-->
						<a href="/mainPage.jsp?mod=105&param=<%=idx%>"><%=title%></a>
					</td>
					<td>
						<!--고객-->
						<%=client_name%>
					</td>
					<td>
						<!--소속-->
						<%=client_dept%>
					</td>
					<td>
						<!--우선순위-->
						<%
						if(priority == 1) out.println("하");
						else if(priority == 2) out.println("중");
						else if(priority == 3) out.println("상");
						%>
					</td>
					<td>
						<!--상태-->
						<%
						switch(status)
						{
						case 0: out.println("신규");
							break;
						case 1: out.println("접수");
							break;
						case 2: out.println("인시던트");
							break;
						case 3: out.println("변경");
							break;
						case 4: out.println("릴리즈");
							break;
						}
						
						%>
					</td>
				</tr>
				<%
						}//while
					}//else
					rs.close();
					stmt.close();
					conn.close();
				} catch(SQLException e){
					out.println(e.toString() );
				}
				%>
				
			</tbody>
		</table>
	</div><!-- /example -->

	<%@include file="/common_footer.jsp"%>
</body>


</html>