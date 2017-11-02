<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<head>
	<%@ include file="/common_header.jsp"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            // Some raw data (not necessarily accurate)
            var data = google.visualization.arrayToDataTable([
                ['항목',      '평균', 'user02', 'user03', 'user04', 'user05', 'user06'],
                ['인시던트',    7,      9,         5,      8,          5,      6]
            ]);

            var options = {
                title : '타이틀',
                vAxis: {title: '/개'},
                hAxis: {title: '항목'},
                seriesType: 'bars',         // 'line', 'area', 'bars', 'candlesticks' and 'steppedArea'
                series: {0: {type: 'area'}} //series column 넘버 (line 타입으로 나타남
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div id="chart_div" style="width: 900px; height: 500px;"></div>
<%@ include file="/common_footer.jsp"%>
</body>
</html>