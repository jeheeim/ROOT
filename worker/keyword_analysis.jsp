<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>

<%
String keyword1[] = new String[3];
String keyword2[] = new String[9];
String keyword3[] = new String[27];
int count[] = new int[3];
int count2[] = new int[9];
int count3[] = new int[27];
int i=0;
int mid_i=0;
int end_i=0;
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
			<%
				try{
						sql = "SELECT keyword_2, COUNT(*) as keyword_count FROM kms where keyword_1 = '"+keyword1[0]+"' GROUP BY keyword_2 ORDER BY keyword_count DESC LIMIT 3"; // 여기에 날짜 비교할 코드 집어넣을것

						rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							keyword2[mid_i] = rs.getString(1);
							count2[mid_i] = rs.getInt(2);
							mid_i++;
						}
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[0]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=3;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[1]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=6;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[2]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=9;
				}catch(SQLException sqle) { out.println(sqle.toString()); }
				catch(Exception e) { out.println(e.toString());}
			%>
			var keyword2Chart1 = google.visualization.arrayToDataTable([
				['중분류', '자주', '종종', '지금'],
				['<%=keyword2[0]%>', <%=count3[0]%>, <%=count3[1]%>, <%=count3[2]%>],
				['<%=keyword2[1]%>', <%=count3[3]%>, <%=count3[4]%>, <%=count3[5]%>],
				['<%=keyword2[2]%>', <%=count3[6]%>, <%=count3[7]%>, <%=count3[8]%>]
			])

			var options2 = {
				title: '<%=keyword1[0]%>',
				width: 300,
				height: 400,
				legend: { position: 'top', maxLines: 3 },
				bar: { groupWidth: '75%' },
				isStacked: true,
			};

			var chart2 = new google.visualization.ColumnChart(document.getElementById('keyword2Chart1_div'));
			chart2.draw(keyword2Chart1, options2);
			<%
				try{
						sql = "SELECT keyword_2, COUNT(*) as keyword_count FROM kms where keyword_1 = '"+keyword1[1]+"' GROUP BY keyword_2 ORDER BY keyword_count DESC LIMIT 3"; // 여기에 날짜 비교할 코드 집어넣을것

						rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							keyword2[mid_i] = rs.getString(1);
							count2[mid_i] = rs.getInt(2);
							mid_i++;
						}
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[3]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=12;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[4]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=15;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[5]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=18;
				}catch(SQLException sqle) { out.println(sqle.toString()); }
				catch(Exception e) { out.println(e.toString());}
			%>
			
			var keyword2Chart2 = google.visualization.arrayToDataTable([
				['중분류', '자주', '종종', '지금'],
				['<%=keyword2[3]%>', <%=count3[9]%>, <%=count3[10]%>, <%=count3[11]%>],
				['<%=keyword2[4]%>', <%=count3[12]%>, <%=count3[13]%>, <%=count3[14]%>],
				['<%=keyword2[5]%>', <%=count3[15]%>, <%=count3[16]%>, <%=count3[17]%>]
			])

			var options3 = {
				title: '<%=keyword1[1]%>',
				width: 300,
				height: 400,
				legend: { position: 'top', maxLines: 3 },
				bar: { groupWidth: '75%' },
				isStacked: true,
			};

			var chart3 = new google.visualization.ColumnChart(document.getElementById('keyword2Chart2_div'));
			chart3.draw(keyword2Chart2, options3);

			<%
				try{
						sql = "SELECT keyword_2, COUNT(*) as keyword_count FROM kms where keyword_1 = '"+keyword1[2]+"' GROUP BY keyword_2 ORDER BY keyword_count DESC LIMIT 3"; // 여기에 날짜 비교할 코드 집어넣을것

						rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							keyword2[mid_i] = rs.getString(1);
							count2[mid_i] = rs.getInt(2);
							mid_i++;
						}
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[6]+"'";

						rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=21;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[7]+"'";

						rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
						end_i=24;
						sql = "select count(if(keyword_3='자주', 1, NULL)) as often, count(if(keyword_3='종종', 1, NULL)) as usual, count(if(keyword_3='지금', 1, NULL)) as now from kms where keyword_2 = '"+keyword2[8]+"'"; // 여기에 날짜 비교할 코드 집어넣을것
						
						rs = stmt.executeQuery(sql);
						if(rs.next())
						{
							count3[end_i++] = rs.getInt(1);
							count3[end_i++] = rs.getInt(2);
							count3[end_i++] = rs.getInt(3);
						}
				}catch(SQLException sqle) { out.println(sqle.toString()); }
				catch(Exception e) { out.println(e.toString());}
			%>
			var keyword2Chart3 = google.visualization.arrayToDataTable([
				['중분류', '자주', '종종', '지금'],
				['<%=keyword2[6]%>', <%=count3[18]%>, <%=count3[19]%>, <%=count3[20]%>],
				['<%=keyword2[7]%>', <%=count3[21]%>, <%=count3[22]%>, <%=count3[23]%>],
				['<%=keyword2[8]%>', <%=count3[24]%>, <%=count3[25]%>, <%=count3[26]%>]
			])

			var options4 = {
				title: '<%=keyword1[2]%>',
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

	<div id="keyword1Chart_div"></div>
	<div id="keyword2Chart1_div" class="col-md-4"></div>
	<div id="keyword2Chart2_div" class="col-md-4"></div>
	<div id="keyword2Chart3_div" class="col-md-4"></div>

	<%@include file="../common_footer.jsp"%>
</body>
</html>