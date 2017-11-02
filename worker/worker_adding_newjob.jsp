<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	근로자가 새 업무를 등록하는 페이지.
	새 업무를 등록하면 submit_new_task.jsp 파일로 이동,
	db에 저장 후 내 할일로 간다.

	취소하면 지움
-->
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	Date d = new Date();
    String s = d.toString();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String todayDate = sdf.format(d);
	int selectNum=0;
	
%>
<!DOCTYPE html>
<html>
<head>
	<title>Worker - add new task</title>

	<!--   BootStrap STARTING LINE   -->
	<%@include file="/common_header.jsp"%>
	<script language="javascript">
	function getSelectValue(frm)
	{
		var temp1 = frm.inputRange.options[frm.inputRange.selectedIndex].value;
		var temp2 = frm.inputEmergency.options[frm.inputEmergency.selectedIndex].value;
		var temp = ( parseInt(temp1) + parseInt(temp2) )/2;
		if (temp <= 1){
			frm.inputPriority.value = "상";
		}
		else if (temp > 1 && temp <= 2){
			frm.inputPriority.value = "중";
		}
		else if (temp > 2){
			frm.inputPriority.value = "하";
		}
	}
</script>
</head>

<body>
	<h1 align="center">New Task</h1>
	<form class="form-horizontal" action="/worker/submit_new_task.jsp" method="post" accept-charset="UTF-8">
		<div class="form-group">
			<label for="inputTitle" class="col-sm-2 control-label">제목</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="inputTitle" placeholder="제목">
			</div>
			<label for="inputGetBy" class="col-sm-2 control-label">접수경로</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputGetBy" style="width: 100%;">
					<option value="1">전화</option>
					<option value="2">회의</option>
					<option value="3">이메일</option>
					<option value="4">기타</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputClient" class="col-sm-2 control-label">고객사</label>
			<div class="col-sm-2">
				<!-- 고객사 순서는 db의 고객사 테이블의 id가 되게 한다 -->
				<select class="form-control" name="inputClient_company" style="width: 100%;">
				<%
					String user_id = (String)session.getAttribute("user_id");
					String dburl = "jdbc:mysql://localhost:3306/itsmdb";
					String dbuser = "root";
					String dbpw = "1234";
					Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
       				Statement stmt = null;
					String sql_table = null;
        			ResultSet rs = null;
					String company_name = null;
					String depart_name = null;
					try{
						stmt = conn.createStatement();
						sql_table = "SELECT * FROM company";
						rs = stmt.executeQuery(sql_table);
						while(rs.next()){
							company_name = rs.getString("companyName");			//회사명
							selectNum++;
				%>
							<option value=<%=selectNum%>><%=company_name%></option>
				<%
						}
						selectNum=0;
						if(rs.next())
							company_name = rs.getString("companyName");	
						rs.close();
					}catch(SQLException e){
					out.println(e.toString() );
					}
				%>
				</select>
			</div>
			<label for="inputClient_depart" class="col-sm-1 control-label">부서</label>
			<div class="col-sm-2">
			<select class="form-control" name="inputClient_depart" style="width: 100%;">
					<option value="1">인사부</option>
					<option value="2">경리부</option>
					<option value="3">영업부</option>
				</select>
				<!--/*
				<select class="form-control" name="inputClient_depart" style="width: 100%;">
				<%
					try{
						sql_table = "SELECT * FROM company WHERE companyName = \'"+company_name+"\'";
						rs = stmt.executeQuery(sql_table);
						//
						//여기 할 차례 웬지 반응형으로 해야하니까 javascript로 해야 할 것 같다!
						//
						while(rs.next()){
							depart_name = rs.getString("index");			//index
							selectNum++;
				%>
					<option value=<%=selectNum%>></option>
				<%
						}
						selectNum=0;
						rs.close();
					}catch(SQLException e){
					out.println(e.toString() );
					}
				%>
				</select>
				*/-->
			</div>
			<label for="inputClient" class="col-sm-1 control-label">이름</label>
			<div class="col-sm-4">
				<select class="form-control" name="inputClient" style="width: 100%;">
					<option value="1">김구라</option>
					<option value="2">소령 서상인</option>
					<option value="3">소위 김나도</option>
					<option value="4">중위 김김김</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<!-- 고객사에서 접수된 건인 경우 이름을 클릭했을때 자동으로 적힌다. -->
			<label for="inputPhone" class="col-sm-2 control-label">연락처</label>
			<div class="col-sm-2">
				<input disabled type="text" class="form-control" name="inputPhone" placeholder="연락처">
			</div>
			<label for="inputDate_submit" class="col-sm-1 control-label">요청일시</label>
			<!-- 연월일시 검색할 수 있는 폼 찾기 -->
			<div class="col-sm-3">
				<input type="date" value = <%=todayDate%> class="form-control" name="inputDate_submit" placeholder="요청일시">
			</div>
			<label for="inputDate_Deadline" class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-3">
				<input type="date" value = <%=todayDate%> class="form-control" name="inputdate_Deadline" placeholder="목표기한">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputRange" class="col-sm-2 control-label">문제범위</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputRange" style="width: 100%;" onChange="getSelectValue(this.form);">
					<option value="1">전 회사</option>
					<option value="2">부서</option>
					<option value="3">개인</option>
				</select>
			</div>
			
			<label for="inputEmergency" class="col-sm-2 control-label">긴급도</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputEmergency" style="width: 100%;" onChange="getSelectValue(this.form);">
					<option value="1">긴급</option>
					<option value="2">중요</option>
					<option value="3">경미</option>
				</select>
			</div>
			
			<!-- 범위, 긴급도 입력하면 자동으로 계산. 더하기해서 작은순으로 하면 될듯 -->
			<label for="inputPriority" class="col-sm-2 control-label">우선순위</label>
			<div class="col-sm-2">
				<input disabled type="text" class="form-control" id="inputPriority" placeholder="우선순위">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputDetail" class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea style="resize:none;" name = "inputDetail" class="form-control" rows="5" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputComment" class="col-sm-2 control-label">담당자 의견</label>
			<div class="col-sm-10">
				<textarea style="resize:none;" name = "inputComment" class="form-control" rows="3" placeholder="담당자의 의견이 들어갑니다."></textarea>
			</div>
		</div>
		<div align="center">
			<button type="submit" class="btn btn-default">등록</button>
			<button type="cancel" class="btn btn-default">취소</button>
		</div>
	</form>

	<!--  BootStrap ENDING LINE    -->
	<%@include file="/common_footer.jsp"%>

</body>
</html>