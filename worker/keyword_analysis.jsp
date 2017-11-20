<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
String keyword1[] = new String[3];
String keyword2[] = new String[3];
String keyword3[] = new String[3];
int count[] = new int[5];
int i=0;

try
{
	stmt = conn.createStatement();
	sql = "SELECT keyword_1, COUNT(*) as keyword_count FROM kms GROUP BY keyword_1 ORDER BY keyword_count DESC LIMIT 3"; // 여기에 날짜 비교할 코드 집어넣을것

	rs = stmt.executeQuery(sql);
}
catch(SQLException sqle) { out.println(sqle.toString()); }
catch(Exception e) { out.println(e.toString());}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../common_header.jsp"%>
	<title>Keyword Analysis</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {packages: ['corechart', 'bar']});
		google.charts.setOnLoadCallback(drawBasic);

		// Define the chart to be drawn.
		function drawBasic()
		{
			var keyword1Chart = google.visualization.arrayToDataTable([
        		['키워드', '출현 수',],
			<%
				while(rs.next())
				{
					keyword1[i] = rs.getString(1);
					count[i] = rs.getInt(2);
			%>
        		['<%=keyword1[i]%>', <%=count[i]%>],
			<%
					i++;
				}
			%>
      		]);

      		var options1 = {
        		title: '대분류 키워드 출현 빈도',
        		chartArea: {width: '50%'},
        		hAxis: {
          			title: '출현 수',
          			minValue: 0
        		},
        		vAxis: {
          			title: '키워드'
        		}
      		};

      		var chart1 = new google.visualization.BarChart(document.getElementById('keyword1Chart_div'));

	    	chart1.draw(keyword1Chart, options1);

			google.visualization.events.addListener(keyword1Chart, 'select', selectHandler);

			function selectHandler(e)
			{
  				alert('A table row was selected');
			}

			var keyword2Chart1 = google.visualization.arrayToDataTable([
				['중분류', '페이지 1', '페이지 2', '페이지 3', '페이지 4', '페이지 5'],
				['로그인 에러', 2, 4, 3, 5, 1],
				['프린트 에러', 3, 2, 6, 2, 1],
				['파일생성 에러', 2, 3, 1, 2, 1]
			])

			var options2 = {
				width: 300,
				height: 400,
				legend: { position: 'top', maxLines: 3 },
				bar: { groupWidth: '75%' },
				isStacked: true,
			};

			var chart2 = new google.visualization.ColumnChart(document.getElementById('keyword2Chart1_div'));
			chart2.draw(keyword2Chart1, options2);

			var keyword2Chart2 = google.visualization.arrayToDataTable([
				['중분류', '페이지 1', '페이지 2', '페이지 3', '페이지 4', '페이지 5'],
				['로그인 에러', 2, 4, 3, 5, 1],
				['프린트 에러', 3, 2, 6, 2, 1],
				['파일생성 에러', 2, 3, 1, 2, 1]
			])

			var options3 = {
				width: 300,
				height: 400,
				legend: { position: 'top', maxLines: 3 },
				bar: { groupWidth: '75%' },
				isStacked: true,
			};

			var chart3 = new google.visualization.ColumnChart(document.getElementById('keyword2Chart2_div'));
			chart3.draw(keyword2Chart2, options3);

			var keyword2Chart3 = google.visualization.arrayToDataTable([
				['중분류', '페이지 1', '페이지 2', '페이지 3', '페이지 4', '페이지 5'],
				['로그인 에러', 2, 4, 3, 5, 1],
				['프린트 에러', 3, 2, 6, 2, 1],
				['파일생성 에러', 2, 3, 1, 2, 1]
			])

			var options4 = {
				width: 300,
				height: 400,
				legend: { position: 'top', maxLines: 3 },
				bar: { groupWidth: '75%' },
				isStacked: true,
			};

			var chart2 = new google.visualization.ColumnChart(document.getElementById('keyword2Chart3_div'));
			chart2.draw(keyword2Chart3, options4);
    	}
	</script>
</head>
<body>
	<h1>키워드 분석</h1>

	<form action="/mainPage.jsp?mod=107">
		<select>
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="mercedes">Mercedes</option>
			<option value="audi">Audi</option>
		</select> 
	</form>

	<div id="keyword1Chart_div"></div>
	<div id="keyword2Chart1_div" class="col-md-4"></div>
	<div id="keyword2Chart2_div" class="col-md-4"></div>
	<div id="keyword2Chart3_div" class="col-md-4"></div>
	<%@include file="../common_footer.jsp"%>
</body>
</html>