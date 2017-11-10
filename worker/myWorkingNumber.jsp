<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Item', 'Number'],
                ['인시던트',     11],
                ['변경관리',      2],
                ['릴리즈관리',  2],
                ['완료', 2]
            ]);

            var options = {
                title: 'user01의 현황' ,
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
</head>
<body>
<div id="donutchart" style="width: 900px; height: 500px;"></div>
<div  class="col-md-3"></div>
<div  class="col-md-4">
	<a href="/mainPage.jsp?mod=102&param=0">마감기간이 임박한 작업이 5개 있습니다.</a>
</div>
<%@ include file="/common_footer.jsp"%>
</body>
</html>