<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>

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
	<form>
  		<div class="form-group">
    		<div class="col-sm-1"><label for="client">요청자</label></div>
			<div class="col-sm-1">
      			<p class="form-control-static" name = "name">client</p>
    		</div>
  		</div>
  		<div class="form-group">
    		<div class="col-sm-1"><label for="root">접수경로</label></div>
			<div class="col-sm-2">
			<select class="form-control" name="root" style="width: 100%;">
        		<option value="root-1">root-1</option>
        		<option value="root-2">root-2</option>
        		<option value="root-3">root-3</option>
        		<option value="root-4">root-4</option>
        	</select>
			</div>
  		</div>
		<div class="form-group">
			<div class="col-sm-1"><label for="range">문제범위</label></div>
			<div class="col-sm-2">
			<select class="form-control" name="range" style="width: 100%;">
        		<option value="range-1">range-1</option>
        		<option value="range-2">range-2</option>
        		<option value="range-3">range-3</option>
        		<option value="range-4">range-4</option>
        	</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-1"><label for="emergency">긴급도</label></div>
			<div class="col-sm-2">
			<select class="form-control" name="emergency" style="width: 100%;">
        		<option value="emergency-1">emergency-1</option>
        		<option value="emergency-2">emergency-2</option>
        		<option value="emergency-3">emergency-3</option>
        		<option value="emergency-4">emergency-4</option>
        	</select>
			</div>
		</div>
		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-1"><label for="title">제목</label></div>
			<div class="col-sm-10">
				<input name = "title" type="text" class="form-control" placeholder="제목을 입력해주세요">
			</div>
		</div>
		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-1"><label for="detail">내용</label></div>
			<div class="col-sm-10">
			<textarea name = "detail" class="form-control" rows="3" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
		<br>&nbsp;</br>
		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-1"><label for="Calender">목표기한</label></div>
			<div class="col-sm-2">
				<input type="date" class="form-control" placeholder="캘린더 입력">
			</div>
		</div>
		<br>&nbsp;</br>
		<br>&nbsp;</br>
		<div class="col-sm-1">
  			<button type="submit" class="btn btn-default">제출</button>
		</div>
	</form>

  </body>
</html>