<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
// param: url로 입력받는 parameter값. worker_id는 session으로 넘겨받는 작업자 id.
int param = 0;
String worker_id = "";

// query문에 따라 검색된 항목의 수
int count = 0;

// 글 번호, 제목, 고객이름, 부서, 우선순위값, 우선순위, 상태값, 상태
int idx = 0;
String title = "";
String client_name = "";
String client_dept = "";

int priority_val = 0;
String priority = "";

int status_val = 0;
String status = "";

try
{
	stmt = conn.createStatement();
	worker_id = (String)session.getAttribute("user_id");
	param = Integer.parseInt(request.getParameter("param"));

	// param = 0 -> 내 업무 검색
	// param = 1 -> 모든 업무 검색
	if(param == 0)
	{
		sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status, worker.id from kms "
			+ "LEFT JOIN incident_management AS inci ON inci.idx=kms.incident_index "
			+ "LEFT JOIN account AS client ON inci.customer=client.idx "
			+ "LEFT JOIN company_department AS dept ON client.department=dept.idx "
			+ "LEFT JOIN account AS worker ON worker.idx=kms.workerIdx "
			+ "WHERE worker.id=\'" + worker_id + "\' "
			+ "ORDER BY kms_index DESC, inci.priority ASC";
		
	}
	else
	{
		sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status FROM kms "
			+ "LEFT JOIN incident_management AS inci ON inci.idx=kms.incident_index "
			+ "LEFT JOIN account AS client ON inci.customer=client.idx "
			+ "LEFT JOIN company_department AS dept ON client.department=dept.idx "
			+ "WHERE inci.status = 0 "
			+ "ORDER BY kms_index DESC, inci.priority ASC";
	}
		
	rs = stmt.executeQuery(sql);
	rs.last();
	count = rs.getRow();
	rs.beforeFirst();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>
	<title>Worker's Job List</title>
</head>

<body>
	<div>
		<table class="table table-striped">
			<thead><tr><th>번호</th><th>제목</th><th>고객</th><th>소속_depart</th><th>우선순위</th><th>상태</th></tr></thead>

			<tbody>
			<%
			//등록된 글이 없을 경우
			if(count == 0)
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
					idx = rs.getInt(1);
					title = rs.getString(2);
					client_name = rs.getString(3);
					client_dept = rs.getString(4);

					priority_val = rs.getInt(5);
					switch(priority_val)
					{
					case 1: priority = "상"; break;
					case 2: priority = "중"; break;
					case 3: priority = "하"; break;
					}
					
					status_val = rs.getInt(6);
					switch(status_val)
					{
					case 0: status = "신규"; break;
					case 1: status = "인시던트"; break;
					case 2: status = "변경"; break;
					case 3: status = "릴리즈"; break;
					case 4: status = "완료"; break;
					}

			%>
				<tr>
					<!--번호-->
					<th scope="row"><%=idx%></th>
					<td>
						<!--제목-->
						<a href="/mainPage.jsp?mod=105&param=<%=idx%>"><%=title%></a>
					</td>
					<!--고객-->
					<td><%=client_name%></td>
					<!--소속-->
					<td><%=client_dept%></td>
					<!--우선순위-->
					<td><%=priority%></td>
					<!--상태-->
					<td><%=status%></td>
				</tr>
			<%
				}//while
			}//else
		}
		catch(SQLException sqle) { out.println(sqle.toString()); }
		catch(NumberFormatException nfe) { out.println(nfe.toString()); }
		catch(Exception e) { out.println(e.toString()); }
		finally
		{
			rs.close();
			stmt.close();
			conn.close();
		}
		%>
			</tbody>
		</table>
	</div>
	<%@include file="/common_footer.jsp"%>
</body>
</html>