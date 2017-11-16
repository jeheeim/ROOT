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
			<thead><tr><th>번호</th><th>제목</th><th>작성자</th><th>소속_depart</th><th>우선순위</th><th>상태</th></tr></thead>

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
		%>
			</tbody>
		</table>
	</div>
<%
try
{
	int i = 0;
	int[] keyword_count = new int[15];
	String[] keyword = new String[15];

	sql = "SELECT COUNT(*), keyword_1 FROM kms GROUP BY keyword_1 ORDER BY COUNT(*) DESC";

	rs = stmt.executeQuery(sql);

	while(rs.next())
	{
		keyword_count[i] = rs.getInt(1);
		keyword[i] = rs.getString(2);

		if(keyword[i] == null)
		{
			continue;
		}

		i++;

		if(i == 5)
		{
			break;
		}
	}

	i=5;

	sql = "SELECT COUNT(*), keyword_2 FROM kms GROUP BY keyword_2 ORDER BY COUNT(*) DESC";
	
	rs = stmt.executeQuery(sql);

	while(rs.next())
	{
		keyword_count[i] = rs.getInt(1);
		keyword[i] = rs.getString(2);

		if(keyword[i] == null)
		{
			continue;
		}

		i++;

		if(i == 10)
		{
			break;
		}
	}

	i=10;

	sql = "SELECT COUNT(*), keyword_3 FROM kms GROUP BY keyword_3 ORDER BY COUNT(*) DESC";

	rs = stmt.executeQuery(sql);

	while(rs.next())
	{
		keyword_count[i] = rs.getInt(1);
		keyword[i] = rs.getString(2);

		if(keyword[i] == null)
		{
			continue;
		}

		i++;

		if(i == 15)
		{
			break;
		}
	}
%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
        google.charts.load("current", {packages:['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Keyword1', '<%=keyword[0]%>', '<%=keyword[1]%>', '<%=keyword[2]%>', '<%=keyword[3]%>',
                    '<%=keyword[4]%>'],
                ['대분류', <%=keyword_count[0]%>, <%=keyword_count[1]%>, <%=keyword_count[2]%>,
					<%=keyword_count[3]%>, <%=keyword_count[4]%>]
            ]);
            var view = new google.visualization.DataView(data);
            var options = {
                width: 600,
                height: 400,
                bar: { groupWidth: '75%' },
                isStacked: true,
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(view, options);

            var data2 = google.visualization.arrayToDataTable([
                ['Keyword2', '<%=keyword[5]%>', '<%=keyword[6]%>', '<%=keyword[7]%>', '<%=keyword[8]%>',
                    '<%=keyword[9]%>'],
                ['중분류', <%=keyword_count[5]%>, <%=keyword_count[6]%>, <%=keyword_count[7]%>,
                    <%=keyword_count[8]%>, <%=keyword_count[9]%>]
            ]);
            var view2 = new google.visualization.DataView(data2);
            var options2 = {
                width: 600,
                height: 400,
                bar: { groupWidth: '75%' },
                isStacked: true,
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
            chart.draw(view2, options2);

            var data3 = google.visualization.arrayToDataTable([
                ['Keyword3', '<%=keyword[10]%>', '<%=keyword[11]%>', '<%=keyword[12]%>', '<%=keyword[13]%>',
                    '<%=keyword[14]%>'],
                ['소분류', <%=keyword_count[10]%>, <%=keyword_count[11]%>, <%=keyword_count[12]%>,
                    <%=keyword_count[13]%>, <%=keyword_count[14]%>]
            ]);
            var view3 = new google.visualization.DataView(data3);
            var options3 = {
                width: 600,
                height: 400,
                bar: { groupWidth: '75%' },
                isStacked: true,
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values3"));
            chart.draw(view3, options3);
        }
	</script>
	<div id="columnchart_values"></div>
	<div id="columnchart_values2"></div>
	<div id="columnchart_values3"></div>
	<%
	out.println(keyword[0]+keyword_count[0]);
	out.println(keyword[1]+keyword_count[1]);
	out.println(keyword[2]+keyword_count[2]);
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
	<%@include file="/common_footer.jsp"%>
</body>
</html>