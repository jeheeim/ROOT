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
		if (temp == 1){
			frm.inputPriority.value = "상";
		}
		else if (temp > 1 && temp <= 2){
			frm.inputPriority.value = "중";
		}
		else if (temp > 2){
			frm.inputPriority.value = "하";
		}
		else{
			frm.inputPriority.value = "우선순위";
		}
	}
	function getPhoneNumber(frm)
	{
		var temp11 = frm.SUB11.options[frm.SUB11.selectedIndex].value;
		var temp12 = frm.SUB12.options[frm.SUB12.selectedIndex].value;
		var temp13 = frm.SUB13.options[frm.SUB13.selectedIndex].value;
		var temp14 = frm.SUB14.options[frm.SUB14.selectedIndex].value;
		var temp15 = frm.SUB15.options[frm.SUB15.selectedIndex].value;
		var temp16 = frm.SUB16.options[frm.SUB16.selectedIndex].value;
		var temp17 = frm.SUB17.options[frm.SUB17.selectedIndex].value;
		var temp18 = frm.SUB18.options[frm.SUB18.selectedIndex].value;
		var temp19 = frm.SUB19.options[frm.SUB19.selectedIndex].value;
		var temp20 = frm.SUB20.options[frm.SUB20.selectedIndex].value;

		if (temp11 == "고길동"){
			frm.inputPhone.value = "01012345678";
		}
		else if (temp12 == "홍길동"){
			frm.inputPhone.value = "01098765432";
		}
		else if (temp13 == "서장훈"){
			frm.inputPhone.value = "01013572468";
		}
		else if (temp14 == "이재명"){
			frm.inputPhone.value = "01011112222";
		}
		else if (temp15 == "김구라"){
			frm.inputPhone.value = "01022223333";
		}
		else if (temp16 == "강호동"){
			frm.inputPhone.value = "01099999999";
		}
		else if (temp17 == "이수근"){
			frm.inputPhone.value = "01010101010";
		}
		else if (temp18 == "김병만"){
			frm.inputPhone.value = "01000000001";
		}
		else if (temp19 == "정글만"){
			frm.inputPhone.value = "01023456789";
		}
		else if (temp20 == "독고탁"){
			frm.inputPhone.value = "01010000000";
		}
		else {
			frm.inputPhone.value = "연락처";
		}
	}
	function showSub(obj) {

    f = document.forms.select_machine;

    if(obj == 1) {
    
        f.inputClient_depart.style.display = "";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";
        f.SUB4.style.display = "none";
        f.SUB5.style.display = "none";
        
    } else  if(obj == 2){

        f.inputClient_depart.style.display = "none";
        f.SUB2.style.display = "";
        f.SUB3.style.display = "none";
        f.SUB4.style.display = "none";
        f.SUB5.style.display = "none";
        
     } else  if(obj == 3){

        f.inputClient_depart.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "";
        f.SUB4.style.display = "none";
        f.SUB5.style.display = "none";
     } else  if(obj == 4){

        f.inputClient_depart.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";
        f.SUB4.style.display = "";
        f.SUB5.style.display = "none";
     }
	 else{
		f.inputClient_depart.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";
        f.SUB4.style.display = "none";
        f.SUB5.style.display = "none";
	 }
	}
	function showSub2(obj) {

    f = document.forms.select_machine;

    if(obj == 1) {
        f.SUB11.style.display = "";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
        
    } else  if(obj == 2){
		f.SUB11.style.display = "none";f.SUB12.style.display = "";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
     } else  if(obj == 3){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
     } else  if(obj == 4){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";	
     }
	 else if(obj == 5) {
        f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
        
    } else  if(obj == 6){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
     } else  if(obj == 7){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
     } else  if(obj == 8){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";	
     } else  if(obj == 9){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "";
        f.SUB20.style.display = "none";
     } else  if(obj == 10){
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "";	
     }
	 else{
		f.SUB11.style.display = "none";f.SUB12.style.display = "none";f.SUB13.style.display = "none";
        f.SUB14.style.display = "none";f.SUB15.style.display = "none";f.SUB16.style.display = "none";
        f.SUB17.style.display = "none";f.SUB18.style.display = "none";f.SUB19.style.display = "none";
        f.SUB20.style.display = "none";
	 }
	}


</script>

</head>

<body>
	<h1 align="center">New Task</h1>
	<form name="select_machine" class="form-horizontal" action="/worker/submit_new_task.jsp" method="post" accept-charset="UTF-8">
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
				<select class="form-control" name="inputClient_company" style="width: 100%;" onChange="showSub(this.options[this.selectedIndex].value);">
				<option value="0">----------</option>
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
				<select class="form-control" name="inputClient_depart" style="width: 100%;" onChange="showSub2(this.options[this.selectedIndex].value);">
					<option value="0">----------</option>
					<option value="1">작전과</option>
					<option value="2">군수과</option>
					<option value="3">보급과</option>
					<option value="4">정보과</option>
				</select>
				<select class="form-control" name="SUB2" style=" display: none;" onChange="showSub2(this.options[this.selectedIndex].value);">
					<option value="0">----------</option>
					<option value="5">인사부</option>
					<option value="6">영업부</option>
					<option value="7">개발부</option>
				</select>
				<select class="form-control" name="SUB3" style="display: none;" onChange="showSub2(this.options[this.selectedIndex].value);">
					<option value="0">----------</option>
					<option value="8">인사부</option>
					<option value="9">이사회</option>
				</select>
				<select class="form-control" name="SUB4" style="display: none;" onChange="showSub2(this.options[this.selectedIndex].value);">
					<option value="0">----------</option>
					<option value="10">국제협작부</option>
				</select>
				<select class="form-control" name="SUB5" style="display: none;" onChange="showSub2(this.options[this.selectedIndex].value);">
					<option value="0">----------</option>
				</select>
			</div>
			<label for="inputReceptionist" class="col-sm-1 control-label">이름</label>
			<div class="col-sm-4">
				<select class="form-control" name="SUB11" style="width: 100%;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="고길동">고길동</option>
				</select>
				<select class="form-control" name="SUB12" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="홍길동">홍길동</option>
				</select>
				<select class="form-control" name="SUB13" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="서장훈">서장훈</option>
				</select>
				<select class="form-control" name="SUB14" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="이재명">이재명</option>
				</select>
				<select class="form-control" name="SUB15" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="김구라">김구라</option>
				</select>
				<select class="form-control" name="SUB16" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="강호동">강호동</option>
				</select>
				<select class="form-control" name="SUB17" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="이수근">이수근</option>
				</select>
				<select class="form-control" name="SUB18" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="김병만">김병만</option>
				</select>
				<select class="form-control" name="SUB19" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="정글만">정글만</option>
				</select>
				<select class="form-control" name="SUB20" style=" display: none;" onChange="getPhoneNumber(this.form);">
					<option value="0">----------</option>
					<option value="독고탁">독고탁</option>
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
					<option value="0">----------</option>
					<option value="1">전 회사</option>
					<option value="2">부서</option>
					<option value="3">개인</option>
				</select>
			</div>
			
			<label for="inputEmergency" class="col-sm-2 control-label">긴급도</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputEmergency" style="width: 100%;" onChange="getSelectValue(this.form);">
					<option value="0">----------</option>
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
		<div class="form-group">
			<label for="keyword1" class="col-sm-2 control-label">키워드1</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="keyword1" placeholder="키워드1">
			</div>
			<label for="keyword2" class="col-sm-2 control-label">키워드2</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="keyword2" placeholder="키워드2">
			</div>
			<label for="keyword3" class="col-sm-2 control-label">키워드3</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="keyword3" placeholder="키워드3">
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