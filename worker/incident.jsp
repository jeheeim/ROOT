<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>인시던트</title>
	<%@include file="/common_header.jsp"%>
</head>

<body>
	<div class="container-fluid">
  		<div class="row" style="background-color:yellow;height:100%">
    		<label for="number" class="col-sm-1 control-label" style="top:50%; background-color:red;">번호</label>
    		<div class="col-sm-1 panel panel-default" id="number">
      			<div class="panel-body">번호</div>
    		</div>

			<div class="col-sm-1"></div>

    		<label for="number" class="col-sm-1 control-label">제목</label>
    		<div class="col-sm-5 panel panel-default" id="number">
      			<div class="panel-body">제목</div>
    		</div>
			<!--
			<label for="inputTitle" class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="inputTitle" placeholder="제목">
  			</div> -->
		</div>

  		<div class="row">
    		<label for="root" class="col-sm-1 control-label">접수경로</label>
    		<div class="col-sm-2 panel panel-default" id="root">
				<div class="panel-body">접수경로</div>
    		</div>

			<div class="col-sm-offset-2 col-sm-1"></div>
			
    		<label for="status" class="col-sm-1 control-label">상태</label>
    		<div class="col-sm-2 panel panel-default" id="status">
				<div class="panel-body">상태</div>
    		</div>
  		</div>

		<div class="row">
			<label for="client_company" class="col-sm-1 control-label">고객사</label>
			<div class="col-sm-2 panel panel-default" id="client_company">
				<div class="panel-body">고객사</div>
			</div>

			<label for="client_depart" class="col-sm-1 control-label">부서</label>
			<div class="col-sm-2 panel panel-default" id="client_depart">
				<div class="panel-body">부서</div>
			</div>

			<label for="client_name" class="col-sm-1 control-label">고객명</label>
			<div class="col-sm-2 panel panel-default" id="client_name">
				<div class="panel-body">고객명</div>
			</div>
		</div>

		<div class="row">
			<label for="phoneNumber" class="col-sm-1 control-label">연락처</label>
			<div class="col-sm-2 panel panel-default" id="phoneNumber">
				<div class="panel-body">연락처</div>
			</div>

			<label for="date_submit" class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2 panel panel-default" id="date_submit">
				<div class="panel-body">요청일시</div>
			</div>

			<label for="date_Deadline" class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-2 panel panel-default" id="date_Deadline">
				<div class="panel-body">목표기한</div>
			</div>
		</div>
		<div class="row">
			<label for="problem_range" class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2 panel panel-default" id="problem_range">
				<div class="panel-body">문제범위</div>
			</div>

			<label for="emergency" class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2 panel panel-default" id="emergency">
				<div class="panel-body">긴급도</div>
			</div>

			<label for="priority" class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2 panel panel-default" id="priority">
				<div class="panel-body">우선순위</div>
			</div>
		</div>
		<div class="form-group">

			<label for="date_accept" class="col-sm-1 control-label">접수일시</label>
			<div class="col-sm-2 panel panel-default" id="date_accept">
				<div class="panel-body">접수일시</div>
			</div>

			<div class="col-sm-9">
		</div>

		<div class="row">
			<label for="detail" class="col-sm-1 control-label">내용</label>
			<div class="col-sm-8 panel panel-default" id="detail">
				<div class="panel-body">내용</div>
			</div>
		</div>

		<div class="row">
			<label for="comment" class="col-sm-1 control-label">담당자 의견</label>
			<div class="col-sm-8 panel panel-default" id="comment">
				<div class="panel-body">담당자 의견</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputResult" class="col-sm-1 control-label">결과</label>
			<div class="col-sm-8">
				<textarea name = "result" class="form-control" rows="3" placeholder="결과 내용"></textarea>
			</div>
		</div>

	<%@include file="/common_footer.jsp"%>
</body>
</html>