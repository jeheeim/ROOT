<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
	<%@include file="/common_header.jsp"%>
	<title>인시던트</title>
  </head>
<body>
	<h1>인시던트</h1>
	<form class="form-horizontal">
  		<div class="form-group">
    		<label for="inputNumber" class="col-sm-1 control-label">번호</label>
    		<div class="col-sm-1">
      			<input type="text" class="form-control" id="inputNumber" placeholder="번호">
    		</div>
			<div class="col-sm-1"></div>
			<label for="inputTitle" class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputTitle" placeholder="제목">
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
			<div class="col-sm-offset-2 col-sm-1"></div>
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
			<label for="inputClient" class="col-sm-1 control-label">접수자</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet" placeholder="접수자">
			</div>
			<label for="inputClient_depart" class="col-sm-1 control-label">소속</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet_depart" placeholder="소속">
			</div>
			<label for="inputClient_rank" class="col-sm-1 control-label">직급</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputClinet_rank" placeholder="직급">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhone" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputPhone" placeholder="연락처">
			</div>
			<label for="inputDate_submit" class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_submit" placeholder="요청일시">
			</div>
			<label for="inputDate_Deadline" class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputdate_Deadline" placeholder="목표기한">
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
			<label for="inputDate_accept" class="col-sm-1 control-label">접수일시</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_accept">
			</div>
			<label for="inputDate_complete" class="col-sm-1 control-label">완료일시</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputDate_complete">
			</div>
			<label for="inputWorktime" class="col-sm-1 control-label">업무시간</label>
			<div class="col-sm-2">
				<input type="date" class="form-control" id="inputdate_Worktime" placeholder="업무시간">
			</div>
		</div>
		<div class="form-group">
			<label for="inputDeatail" class="col-sm-1 control-label">내용</label>
			<div class="col-sm-8">
				<textarea name = "detail" class="form-control" rows="5" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputComment" class="col-sm-1 control-label">담당자 의견</label>
			<div class="col-sm-8">
				<textarea name = "comment" class="form-control" rows="3" placeholder="담당자의 의견이 들어갑니다."></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputResult" class="col-sm-1 control-label">결과</label>
			<div class="col-sm-8">
				<textarea name = "result" class="form-control" rows="3" placeholder="결과 내용"></textarea>
			</div>
		</div>
	</form>
	<!-- 백업 -->
	<h1>백업</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputBackup" class="col-sm-1 control-label">백업 계획</label>
			<div class="col-sm-7"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">추가</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
			<table class="table table-striped">
      			<thead>
        			<tr>
          				<th>대상</th>
          				<th>일자</th>
          				<th>장비</th>
          				<th>용량</th>
						<th>시간</th>
						<th>작업자</th>
						<th>비고</th>
        			</tr>
      			</thead>
      			<tbody>
        			<tr>
         	 			<td>Sample target</td>
          				<td>Sample Date</td>
          				<td>Sample Equip</td>
          				<td>Sample Cap</td>
						<td>Sample Time</td>
						<td>Sample Worker</td>
						<td>Sample Note</td>
        			</tr>
        			<tr>
         	 			<td>Sample target</td>
          				<td>Sample Date</td>
          				<td>Sample Equip</td>
          				<td>Sample Cap</td>
						<td>Sample Time</td>
						<td>Sample Worker</td>
						<td>Sample Note</td>
        			</tr>
        			<tr>
         	 			<td>Sample target</td>
          				<td>Sample Date</td>
          				<td>Sample Equip</td>
          				<td>Sample Cap</td>
						<td>Sample Time</td>
						<td>Sample Worker</td>
						<td>Sample Note</td>
        			</tr>
      			</tbody>
    		</table>
			</div>
		</div>
	</form>

	<!--작업일정-->
	<h1>작업일정</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputWork" class="col-sm-1 control-label">작업일정</label>
			<div class="col-sm-7"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">추가</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1"><strong>구분</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>일시</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>작업자</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>비고</strong></div>
			<div class="col-sm-1">Sample</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<strong>세부내역</strong>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<textarea name = "workDetail" class="form-control" rows="5" placeholder="세부내역"></textarea>
			</div>
		</div>
	</form>
	<!--테스트 계획-->
	<h1>테스트 계획</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputTest" class="col-sm-1 control-label">테스트 계획</label>
			<div class="col-sm-7"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">추가</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1"><strong>계획일자</strong></div>
			<div class="col-sm-2">Sample</div>
			<div class="col-sm-1"><strong>담당자</strong></div>
			<div class="col-sm-2">Sample</div>
			<div class="col-sm-1"><strong>비고</strong></div>
			<div class="col-sm-2">Sample</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1"><strong>테스트 케이스</strong></div>
			<div class="col-sm-2">Sample</div>
			<div class="col-sm-1"><strong>예상결과</strong></div>
			<div class="col-sm-2">Sample</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<textarea name = "testDetail" class="form-control" rows="5" placeholder=""></textarea>
			</div>
		</div>
	</form>
	<!--복구 계획-->
	<h1>복구 계획</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputRecovery" class="col-sm-1 control-label">복구 계획</label>
			<div class="col-sm-7"></div>
			<div class="col-sm-1">
				<button class="btn btn-default" type="submit">추가</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1"><strong>복구대상</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>복구시간</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>작업자</strong></div>
			<div class="col-sm-1">Sample</div>
			<div class="col-sm-1"><strong>비고</strong></div>
			<div class="col-sm-1">Sample</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-1"><strong>복구방법</strong></div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<textarea name = "recoveryDetail" class="form-control" rows="5" placeholder=""></textarea>
			</div>
		</div>
	</form>
	<!--검토사항-->
	<h1>검토사항</h1>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputReview" class="col-sm-1 control-label">검토사항</label>
		</div>
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<textarea name = "review" class="form-control" rows="5" placeholder=""></textarea>
			</div>
		</div>
	</form>

	<%@include file="/common_footer.jsp"%>
</body>
</html>