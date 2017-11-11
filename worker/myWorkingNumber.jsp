<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf" %>

<html>
<head>
   <%@ include file="/common_header.jsp"%>
    
</head>
<body>
<%
String id = "";
int incident = 0;
int change = 0;
int release = 0;
int finish = 0;
String nameStr ="";
try
{
   id = (String)session.getAttribute("user_id");
   nameStr = id + "님의 현황";
   sql = "select count(if(inci.status = 1, 1, null)), count(if(inci.status = 2, 1, null)), count(if(inci.status = 3, 1, null)), count(if(inci.status = 4, 1, null)) from kms "+
      "left join account on account.idx = workerIdx "+
      "left join incident_management as inci on inci.idx = kms.incident_index "+
      "where account.id = \'"+id+"\'";       
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();
   if(rs.next())
      {
         incident = rs.getInt(1);
         change = rs.getInt(2);
         release = rs.getInt(3);
         finish = rs.getInt(4);
      }

}catch(Exception e)
{
   out.println(e.toString());
}
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
   <a href="/mainPage.jsp?mod=102&param=0">마감기간이 임박한 작업이 5개 있습니다.</a>
</div>
<%@ include file="/common_footer.jsp"%>
</body>
</html>