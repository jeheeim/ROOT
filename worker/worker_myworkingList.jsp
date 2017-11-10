<!-- 에러가 납니다. 하지만 경고 수준입니다.
	이유는 rs가 stmt를 사용하고 rs_temp1도 사용합니다.
	rs.close()하기전에 rs_temp1 = stmt.executeQuery(sqlFindNameDepart);하므로
	문제가 생기는 듯 합니다.-->

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
	String sqlFindNameDepart=null;
	String sqlKMSNum=null;
	int total = 0;
	//새로만든 rs
	ResultSet rs_temp1 = null;
	Statement stmt_temp = null;

	ResultSet rs_kms = null;
	Statement stmt_kms = null;

	String worker_id = "";

	worker_id = (String)session.getAttribute("user_id");

	try{
		//출처: http://seinarin.tistory.com/3 [행복을 찾아서]
		stmt = conn.createStatement();
		stmt_temp= conn.createStatement();
		stmt_kms = conn.createStatement();
		//String sqlCount = "SELECT COUNT(*) FROM incident_management"
		sqlCount = "SELECT COUNT(*) FROM incident_management";
		//ResultSet rs = stmt.executeQuery(sqlCount);
		rs = stmt.executeQuery(sqlCount);
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();

		out.print("총 게시물 : " + total + "개");

		sqlList = "SELECT kms_index, inci.title, inci.customer, inci.priority, inci.status, worker.id from kms "
				+ "LEFT JOIN incident_management as inci ON inci.idx=kms.incident_index "
				+ "LEFT JOIN account as worker ON worker.idx=kms.workerIdx "
				+ "WHERE id=\'" + worker_id + "\'"
				+ "ORDER BY kms_index DESC, inci.priority ASC ";
		
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
							
							//이름 구하기
							sqlFindNameDepart = "SELECT name FROM account WHERE account.Idx = \'" + managerId +"\'";
							rs_temp1 = stmt_temp.executeQuery(sqlFindNameDepart);
							String customerName = null;
							String customerDepart = null;
							if(rs_temp1.next())
								customerName = rs_temp1.getString("name");
							rs_temp1.close();

							sqlFindNameDepart = "SELECT department FROM account WHERE account.Idx = \'" + managerId +"\'";
							rs_temp1 = stmt_temp.executeQuery(sqlFindNameDepart);
							if(rs_temp1.next())
								customerDepart = rs_temp1.getString("department");
							rs_temp1.close();

							sqlFindNameDepart = "SELECT department FROM company_department WHERE company_department.idx = \'" + customerDepart +"\'";
							rs_temp1 = stmt_temp.executeQuery(sqlFindNameDepart);
							if(rs_temp1.next())
								customerDepart = rs_temp1.getString("department");
							rs_temp1.close();

							//KMS Num 찾기
							sqlKMSNum = "SELECT kms_index FROM kms WHERE incident_index=" + idx;
							rs_kms = stmt_kms.executeQuery(sqlKMSNum);
							int kms_idx = -1;
							if(rs_kms.next())
							    kms_idx = rs_kms.getInt(1);
							rs_kms.close();
				%>
				<tr>
					<th scope="row">
						<!--번호-->
						<%=idx%>
					</th>
					<td>
						<!--제목-->
						<a href="/mainPage.jsp?mod=105&param=<%=kms_idx%>"><%=title%></a>
					</td>
					<td>
						<!--작성자-->
						<%=customerName%>
					</td>
					<td>
						<!--소속-->
						<%=customerDepart%>
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
						if(status == 0) out.println("신규");
						else if(status == 1) out.println("접수");
						else if(status == 2) out.println("인시던트");
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