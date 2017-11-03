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
	try{
		stmt = conn.createStatement();

		sql = "SELECT title, reception_path, customer, registration_date, deadline, "
		+ "problem_scope, urgency, priority, content, IFNULL(action_details,'내용없음'), status FROM incident_management WHERE incident_management.index=" + idx;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			String title = rs.getString(1);
			int reception_path = rs.getInt(2);
			int customer = rs.getInt(3);
			String registration_data = rs.getString(4);
			String deadline = rs.getString(5);
			int problem_scope = rs.getInt(6);
			int urgency = rs.getInt(7);
			int priority = rs.getInt(8);
			String content = rs.getString(9);
			String action_details = rs.getString(10);
			int status = rs.getInt(11);

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
				<div class="well well-sm">...</div>
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
				<div class="well well-sm"><%=customer%></div>
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
				<div class="well well-sm"><%=problem_scope%></div>
			</div>
			<label class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=urgency%></div>
			</div>
			<label class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<div class="well well-sm"><%=priority%></div>
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
		<div class="form-group">
		<%switch(status){
		    case 0:
		%><button type="submit" class="btn btn-default">작업시작</button><%
			break;
			case 1:
		        %><button type="submit" class="btn btn-default">작업완료</button>
				<button type="submit" class="btn btn-default">변경이관</button><%
			break;
		        %><%
		}%>
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