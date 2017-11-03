<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Service Detail</title>
	<%@ include file="../common_header.jsp"%>
</head>

<body>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputNumber" class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputNumber" placeholder="번호">
			</div>
		
			<label for="inputTitle" class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputTitle" placeholder="제목">
			</div>
		
			<label for="inputState" class="col-sm-1 control-label">상태</label>
			<div class="col-sm-2">
				<select class="form-control" name="state" style="width: 100%;">
					<option value="state-1">state-1</option>
					<option value="state-2">state-2</option>
					<option value="state-3">state-3</option>
					<option value="state-4">state-4</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="inputClient" class="col-sm-1 control-label">요청자</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet" placeholder="요청자">
			</div>

			<label for="inputClient_Company" class="col-sm-1 control-label">고객사</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet_Company" placeholder="고객사">
			</div>

			<label for="inputClient_rank" class="col-sm-1 control-label">직급</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet_rank" placeholder="직급">
			</div>

			<label for="inputPhone" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputPhone" placeholder="연락처">
			</div>
		</div>

		<div class="form-group">
			<label for="inputRoot" class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<select class="form-control" name="root" style="width: 100%;">
					<option value="root-1">root-1</option>
					<option value="root-2">root-2</option>
					<option value="root-3">root-3</option>
					<option value="root-4">root-4</option>
				</select>
			</div>
			
			<label for="inputCategory" class="col-sm-1 control-label">분류</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputCategory" style="width: 100%;">
					<option value="Category-1">Category-1</option>
					<option value="Category-2">Category-2</option>
					<option value="Category-3">Category-3</option>
					<option value="Category-4">Category-4</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="inputRange" class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputRange" style="width: 100%;">
					<option value="range-1">range-1</option>
					<option value="range-2">range-2</option>
					<option value="range-3">range-3</option>
					<option value="range-4">range-4</option>
				</select>
			</div>

			<label for="inputEmergency" class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<select class="form-control" name="inpuEmergency" style="width: 100%;">
					<option value="emergency-1">emergency-1</option>
					<option value="emergency-2">emergency-2</option>
					<option value="emergency-3">emergency-3</option>
					<option value="emergency-4">emergency-4</option>
				</select>
			</div>

			<label for="inputPriority" class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<select class="form-control" name="inputPriority" style="width: 100%;">
					<option value="priority-1">priority-1</option>
					<option value="priority-2">priority-2</option>
					<option value="priority-3">priority-3</option>
					<option value="priority-4">priority-4</option>
				</select>
			</div>
		</div>
	
		<div class="form-group">
			<label for="inputWorker" class="col-sm-1 control-label">담당자</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet" placeholder="이름">
			</div>

			<label for="inputWorker_depart" class="col-sm-1 control-label">소속</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputWorker_depart" placeholder="소속">
			</div>

			<label for="inputWorker_rank" class="col-sm-1 control-label">직급</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputWorker_rank" placeholder="직급">
			</div>

			<label for="inputWorker_Phone" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputWoker_Phone" placeholder="연락처">
			</div>
		</div>

		<div class="form-group">
			<label for="inputDeatail" class="col-sm-1 control-label">내용</label>
			<div class="col-sm-11">
				<textarea name = "detail" class="form-control" rows="5" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputComment" class="col-sm-1 control-label">접수자 의견</label>
			<div class="col-sm-11">
				<textarea name = "comment" class="form-control" rows="3" placeholder="접수자의 의견이 들어갑니다."></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputDate_regist1" class="col-sm-1 control-label">등록일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_regist">
			</div>

			<label for="inputDate_regist2" class="col-sm-1 control-label">등록일시</label>
			<div class="col-sm-2">
				<input type="time" class="form-control">
			</div>

			<label for="inputDate_deadline1" class="col-sm-1 control-label">기한일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_deadline1">
			</div>

			<label for="inputDate_deadline2" class="col-sm-1 control-label">기한일시</label>
			<div class="col-sm-2">
				<input type="time" class="form-control" id="inputDate_deadline2">
			</div>
		</div>

		<div class="form-group">
			<label for="inputDate_accept1" class="col-sm-1 control-label">접수일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_accept1">
			</div>

			<label for="inputDate_accept2" class="col-sm-1 control-label">접수일시</label>
			<div class="col-sm-2">
				<input type="time" class="form-control" id="inputDate_accept2">
			</div>

			<label for="inputDate_complete1" class="col-sm-1 control-label">완료일자</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_complete">
			</div>

			<label for="inputDate_complete2" class="col-sm-1 control-label">완료일시</label>
			<div class="col-sm-2">
				<input type="time" class="form-control" id="inputDate_complete">
			</div>
		</div>

		<div class="form-group">
			<label for="inputResult" class="col-sm-1 control-label">조치내역</label>
			<div class="col-sm-11">
				<textarea name = "result" class="form-control" rows="3" placeholder="결과 내용"></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">목록으로</button>
			</div>
		</div>
	</form>

	<%@ include file="../common_footer.jsp"%>
</body>
</html>