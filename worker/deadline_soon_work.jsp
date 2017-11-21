<!--메인페이지로 보내서 조그마하게 출력해야한다.-->

<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="/dbLogin.jspf"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>

	<title>Worker's Job List</title>
</head>

<%
Date d = new Date();
String s = d.toString();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String todayDate = sdf.format(d);

String worker_id = "";
worker_id = (String)session.getAttribute("user_id");

int count = 0;

int idx = 0;
String title = "";
String client_name = "";
String client_dept = "";
int priority = 0;
int status = 0;
String deadline = "";

try{
	stmt = conn.createStatement();
		
	sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status, worker.id, inci.deadline from kms "
		+ "LEFT JOIN incident_management as inci ON inci.idx=kms.incident_index "
		+ "LEFT JOIN account as client ON inci.customer=client.idx "
		+ "LEFT JOIN company_department as dept ON client.department=dept.idx "
		+ "LEFT JOIN account as worker ON worker.idx=kms.workerIdx "
		+ "WHERE worker.id=\'" + worker_id + "\' AND inci.status < 4 "
		+ "ORDER BY kms_index DESC, inci.priority ASC";
		
	rs = stmt.executeQuery(sql);
	rs.last();
	count = rs.getRow();
	rs.beforeFirst();
%>


<body>
	<h1 align="center">마감 임박</h1>
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
				<th>마감기간</th>
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
						deadline = rs.getString("deadline");

			%>
				<tr>
				<%
 				    	Date beginDate = sdf.parse(todayDate);
				        Date endDate = sdf.parse(deadline);
        				// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
        				long diff = endDate.getTime() - beginDate.getTime();
        				long diffDays = diff / (24 * 60 * 60 * 1000);
						if(0<=diffDays&&diffDays<=3.0f){
				%>
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
						switch(priority)
						{
						case 1: out.println("상");
							break;
						case 2: out.println("중");
							break;
						case 3: out.println("하");
							break;
						}
						%>
					</td>
					<td>
						<!--상태-->
						<%
						switch(status)
						{
						case 0: out.println("신규");
							break;
						case 1: out.println("인시던트");
							break;
						case 2: out.println("변경");
							break;
						case 3: out.println("릴리즈");
							break;
						case 4: out.println("완료");
							break;
						}

						%>
					</td>
					<td>
						<!--마감기간-->
						<%=deadline%>
					</td>
					<%
						}
					%>
				</tr>
				<%
					}//while
				}//else
				rs.close();
				stmt.close();
				conn.close();
			}
			catch(SQLException sqle) { out.println(sqle.toString()); }
			catch(Exception e) { out.println(e.toString()); }
			%>

			</tbody>
		</table>
	</div>

	<%@include file="/common_footer.jsp"%>
</body>
</html>