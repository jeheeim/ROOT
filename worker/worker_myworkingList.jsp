<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!--
	DB와 연동 후 작업해야함!



-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>

	<title>Worker's Job List</title>
</head>

<%
	String sqlCount=null;
	//ResultSet rs=null;
	String sqlList =null;
	int total = 0;
	try{
		//출처: http://seinarin.tistory.com/3 [행복을 찾아서]
		stmt = conn.createStatement();
		
		//String sqlCount = "SELECT COUNT(*) FROM incident_management"
		sqlCount = "SELECT COUNT(*) FROM incident_management";
		//ResultSet rs = stmt.executeQuery(sqlCount);
		rs = stmt.executeQuery(sqlCount);
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");

		//String sqlList = "SELECT index, title, manager_id, priority, status from incident_management ORDER BY index DESC, priority ASC";
		sqlList = "SELECT incident_management.index, title, manager_id, priority, status from incident_management ORDER BY incident_management.index DESC, priority ASC";
		
		rs = stmt.executeQuery(sqlList);
	
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
					if(total == 0){	//등록된 글이 없을 경우
				%>
						<tr align="center">
							<td colspan="6">등록된 글이 없습니다.</td>
						</tr>
				<%
					}//if
					else{	//등록된 글이 1개 이상 있다면
						while(rs.next()){
							int idx = rs.getInt(1);			//index
							String title = rs.getString(2);	//title
							String managerId = rs.getString(3);	//manager_id
							int priority = rs.getInt(4);	//priority
							int status = rs.getInt(5);
				%>
				<tr>
					<th scope="row">
						<!--번호-->
						<%=idx%>
					</th>
					<td>
						<!--제목-->
						<%=title%>
					</td>
					<td>
						<!--작성자-->
						<%=managerId%>
					</td>
					<td>
						<!--소속-->
						소속
					</td>
					<td>
						<!--우선순위-->
						<%=priority%>
					</td>
					<td>
						<!--상태-->
						<%
						if(status == 0) out.println("인시던트");
						else if(status == 1) out.println("변경");
						else if(status == 2) out.println("릴리즈");
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