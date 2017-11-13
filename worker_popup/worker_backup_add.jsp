<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbLogin.jspf" %>
<%
	String change_idx = request.getParameter("idx");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>백업 계획 추가</title>

    <!-- 부트스트랩 -->
    <link href="/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	
	<form class="form-horizontal" action="/worker_popup/worker_backup_add_process.jsp?change_idx=<%=change_idx%>" method="post" accept-charset="UTF-8">
  		<div class="form-group">
    		<label for="inputTarget" class="col-sm-2 control-label">대상</label>
    		<div class="col-sm-8">
      			<input type="text" class="form-control" id="inputTarget" placeholder="대상">
    		</div>
  		</div>
		<div class="form-group">
    		<label for="inputDate" class="col-sm-2 control-label">일자</label>
    		<div class="col-sm-2" >
				<input type="date" class="form-control" name="inputDate">
    		</div>
			<label for="inputTime" class="col-sm-1 control-label">시간</label>
			<div class="col-sm-2" >
				<input type="time" class="form-control" name="inputTime" placeholder="시간">
			</div>
			<label for="inputHour" class="col-sm-1 control-label">작업시간</label>
			<div class="col-sm-2" >
				<input type="text" class="form-control" name="inputHour" placeholder="작업시간">
			</div>
  		</div>
		<div class="form-group">
			<label for="inputEquip" class="col-sm-2 control-label">장비</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="inputEquip" placeholder="장비">
			</div>
		</div>
		<div class="form-group">
			<label for="inputCapacity" class="col-sm-2 control-label">용량</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="inputCapacity" placeholder="용량">
			</div>
		</div>
		<div class="form-group">
			<label for="inputWorker" class="col-sm-2 control-label">작업자</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="inputWorker" placeholder="작업자">
			</div>
		</div>
		<div class="form-group">
			<label for="inputMethod" class="col-sm-2 control-label">방식</label>
			<div class="col-sm-8">
				<textarea name = "method" class="form-control" rows="5" placeholder="방식"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputNote" class="col-sm-2 control-label">비고</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="inputNote" placeholder="비고">
			</div>
		</div>
  		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-1">
    			<button type="submit" class="btn btn-default">추가</button>
    		</div>
			<div class="col-sm-1">
    			<button type="submit" class="btn btn-default">취소</button>
    		</div>
  		</div>
</form>

</body>
</html>