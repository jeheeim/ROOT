<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="../dbLogin.jspf" %>

<html>
<head>
	<%@ include file="/common_header.jsp"%>
	<title>Worker's main body</title>
</head>

<body>
<%
String name = "";
int incident = 0;
int change = 0;
int release = 0;
int finish = 0;
String nameStr ="";
String worker_id = "";
String deadline = "";

Date d = new Date();
String s = d.toString();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String todayDate = sdf.format(d);
int cnt = 0;

worker_id = (String)session.getAttribute("user_id");
try
{
	name = (String)session.getAttribute("user_name");
	nameStr = name + "님의 현황";

	stmt = conn.createStatement();

	sql = "SELECT COUNT(IF(inci.status = 1, 1, NULL)), COUNT(IF(inci.status = 2, 1, NULL)), COUNT(IF(inci.status = 3, 1, NULL)), COUNT(IF(inci.status = 4, 1, NULL)) FROM kms "
		+ "LEFT JOIN account ON account.idx = workerIdx "
		+ "LEFT JOIN incident_management AS inci ON inci.idx = kms.incident_index "
		+ "WHERE account.name = \'" + name + "\'";

	rs = stmt.executeQuery(sql);

	if(rs.next())
	{
		incident = rs.getInt(1);
		change = rs.getInt(2);
		release = rs.getInt(3);
		finish = rs.getInt(4);
	}
	sql = "SELECT kms_index, inci.title, client.name, dept.department, inci.priority, inci.status, worker.id, inci.deadline from kms "
				+ "LEFT JOIN incident_management as inci ON inci.idx=kms.incident_index "
				+ "LEFT JOIN account as client ON inci.customer=client.idx "
				+ "LEFT JOIN company_department as dept ON client.department=dept.idx "
				+ "LEFT JOIN account as worker ON worker.idx=kms.workerIdx "
				+ "WHERE worker.id=\'" + worker_id + "\' "
				+ "ORDER BY kms_index DESC, inci.priority ASC";
	rs = stmt.executeQuery(sql);
	while(rs.next()){
		deadline = rs.getString("deadline");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 		Date beginDate = formatter.parse(todayDate);
		Date endDate = formatter.parse(deadline);
        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
        long diff = endDate.getTime() - beginDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
		if(0<=diffDays&&diffDays<=3.0f){
			cnt++;
		}
	}
}
catch(SQLException sqle) { out.println(sqle.toString()); }
catch(Exception e) { out.println(e.toString()); }

%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Item', 'Number'],
				['인시던트',     <%=incident%>],
				['변경관리',      <%=change%>],
				['릴리즈관리',  <%=release%>],
				['완료', <%=finish%>]
			]);

			var options = {
				title: '<%=nameStr%>' ,
				pieHole: 0.4,
				pieSliceText: 'value',
				pieSliceTextStyle :{
					color: 'white',
					fontsize:24
				},
				colors:['#4285F4', '#FFCA3E', '#FF6060', '#B6E11E']
			};

			var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
			chart.draw(data, options);
		}
	</script>
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
	<div  class="col-md-3"></div>
	<div  class="col-md-4">
		<a href="/worker/deadline_soon_work.jsp?mod=102&param=0">마감기간이 임박한 작업이 <%=cnt%>개 있습니다.</a>
	</div>
	
	<%@ include file="/common_footer.jsp"%>
</body>
</html>