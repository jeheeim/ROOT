<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<!--
well{
	min-height:20px;
	padding:19px;
	margin-bottom:20px;
	background-color:#f5f5f5;
	border:1px solid #e3e3e3;
	border-radius:4px;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.05)
}
.well blockquote{
	border-color:#ddd;
	border-color:rgba(0,0,0,.15)
}
.well-lg{
	padding:24px;
	border-radius:6px
}.well-sm{
	padding:9px;
	border-radius:3px
}
-->
<head>
	<title>인시던트</title>
	<%@include file="/common_header.jsp"%>
	<!--
	<script>
var observe;
if (window.attachEvent)
{
observe = function (element, event, handler)
{
element.attachEvent('on'+event, handler);
};
}
else
{
observe = function (element, event, handler)
{
element.addEventListener(event, handler, false);
    		};
		}
		function init ()
		{
    		var text = document.getElementById('text');
    		function resize ()
			{
        		text.style.height = 'auto';
        		text.style.height = text.scrollHeight+'px';
    		}
/* 0-timeout to get the already changed text */
    
	function delayedResize ()
	{
		window.setTimeout(resize, 0);
	}
    	
		observe(text, 'change',  resize);
		observe(text, 'cut',     delayedResize);
	observe(text, 'paste',   delayedResize);
	observe(text, 'drop',    delayedResize);
	observe(text, 'keydown', delayedResize);

	text.focus();
	text.select();
    resize();
}
	</script>
	-->
</head>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sqlFindNameDepart=null;
	ResultSet rs_temp1 = null;
	Statement stmt_temp = null;
	try{
		stmt = conn.createStatement();
		stmt_temp= conn.createStatement();

		sql = "SELECT title, reception_path, customer, registration_date, deadline, "
		+ "problem_scope, urgency, priority, content, IFNULL(action_details,'내용없음'),receptionist FROM incident_management WHERE incident_management.index=" + idx;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			String title = rs.getString(1);					//title
			int reception_path = rs.getInt(2);				//reception_path
			int customer = rs.getInt(3);					//customer
			String registration_data = rs.getString(4);		//registration_date
			String deadline = rs.getString(5);				//deadline
			int problem_scope = rs.getInt(6);				//problem_scope
			int urgency = rs.getInt(7);						//urgency
			int priority = rs.getInt(8);					//priority
			String content = rs.getString(9);				//content
			String action_details = rs.getString(10);		//IFNULL(action_details,'내용없음')
			String receptionist = rs.getString(11);		//receptionist
			String problem_scope_str ="";
			String urgency_str = "";
			String priority_str = "";
			
			if(problem_scope==1) {problem_scope_str ="전회사";}
			else if(problem_scope==2) {problem_scope_str ="부서";}
			else if(problem_scope==3) {problem_scope_str ="개인";}
			if(urgency==1) {urgency_str ="긴급";}
			else if(urgency==2) {urgency_str ="중요";}
			else if(urgency==3) {urgency_str ="경미";	}	
			if(priority==1) {priority_str ="상";}
			else if(priority==2){ priority_str ="중";}
			else if(priority==3) {priority_str ="하";}

			sqlFindNameDepart = "SELECT name FROM account WHERE account.Idx = \'" + customer +"\'";
			rs_temp1 = stmt_temp.executeQuery(sqlFindNameDepart);
			String customerName = null;
			if(rs_temp1.next())
				customerName = rs_temp1.getString("name");
			rs_temp1.close();	

%>
<body onload="init();">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=idx%></div>
			</div>
			<label class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<div class="well well-sm"><%=title%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">고객</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=receptionist%></div>
			</div>
			<label class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<div class="well well-sm">
					<%switch (reception_path){
						case 1:
						    %>전화<%
						    break;
						case 2:
						    %>회의<%
						    break;
						case 3:
						    %>이메일<%
						    break;
						case 4:
						    %>기타<%
						    break;
					}
					%>
				</div>
			</div>

			<label class="col-sm-1 control-label">접수자</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=customerName%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=registration_data%></div>
			</div>
			<div class="col-sm-3"></div>
			<label class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=deadline%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=problem_scope_str%></div>
			</div>
			<label class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=urgency_str%></div>
			</div>
			<label class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=priority_str%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">내용</label>
			<div class="col-sm-8">
				<div class="well well-sm"><%=content%></div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">담당자 의견</label>
			<div class="col-sm-8">
				<div class="well well-sm"><%=action_details%></div>
			</div>
		</div>
	</form>
	<%@include file="/common_footer.jsp"%>
</body>
<%
		}
	}catch (Exception e){
		}
%>
</html>