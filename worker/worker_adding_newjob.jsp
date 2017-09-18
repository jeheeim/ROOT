<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	근로자가 새 업무를 등록하는 페이지.
	새 업무를 등록하면 submit_new_task.jsp 파일로 이동,
	db에 저장 후 내 할일로 간다.

	취소하면 지움
-->

<!DOCTYPE html>
<html>
<head>
	<title>Worker - add new task</title>

	<!--   BootStrap STARTING LINE   -->
	<%@include file="/common_header.jsp"%>
	
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
					<option value="1">삼성SDI</option>
					<option value="2">LINE</option>
					<option value="3">LG CNS</option>
					<option value="4">돈많이 주는곳</option>
				</select>
			</div>
			<label for="inputClient_depart" class="col-sm-1 control-label">부서</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputClient_depart" style="width: 100%;">
					<option value="1">작전과</option>
					<option value="2">정보과</option>
					<option value="3">인사과</option>
					<option value="4">군수과</option>
				</select>
			</div>
			<label for="inputClient" class="col-sm-1 control-label">이름</label>
			<div class="col-sm-4">
				<select class="form-control" name="inputClient" style="width: 100%;">
					<option value="1">대위 김호룡</option>
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
				<input type="date" class="form-control" id="inputDate_submit" placeholder="요청일시">
			</div>
			<label for="inputDate_Deadline" class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-3">
				<input type="date" class="form-control" id="inputdate_Deadline" placeholder="목표기한">
			</div>
		</div>

		<div class="form-group">
			<label for="inputRange" class="col-sm-2 control-label">문제범위</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputRange" style="width: 100%;">
					<option value="range-1">전 회사</option>
					<option value="range-2">부서</option>
					<option value="range-3">팀</option>
					<option value="range-4">개인</option>
				</select>
			</div>
			<label for="inputEmergency" class="col-sm-2 control-label">긴급도</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputEmergency" style="width: 100%;">
					<option value="1">긴급</option>
					<option value="2">중요</option>
					<option value="3">경미</option>
				</select>
			</div>
			<!-- 범위, 긴급도 입력하면 자동으로 계산. 더하기해서 작은순으로 하면 될듯 -->
			<label for="inputPriority" class="col-sm-2 control-label">우선순위</label>
			<div class="col-sm-2">
				<input disabled type="text" class="form-control" id="inputPriority" placeholder="연락처">
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