<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>client ID</title>

    <!-- 부트스트랩 -->
    <link href="/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/worker/worker_mainBody.css" rel="stylesheet">
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

     <div class="bs-example" data-example-id="striped-table">
    <table class="table table-striped">
      <thead>
        <tr>
          <th width = "20">번호</th>
          <th width = "50">일자</th>
          <th width = "50">기한</th>
          <th width = "200">제목</th>
		      <th width = "70">상태</th>
		      <th width = "70">담당자</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row" >1</th>
          <td>Sample Date</td>
          <td>Sample Deadline</td>
          <td>Sample Title</td>
		  <td>Sample State</td>
		  <td>Sample Worker</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Sample Date</td>
          <td>Sample Deadline</td>
          <td>Sample Title</td>
		  <td>Sample State</td>
		  <td>Sample Worker</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Sample Date</td>
          <td>Sample Deadline</td>
          <td>Sample Title</td>
		  <td>Sample State</td>
		  <td>Sample Worker</td>
        </tr>
      </tbody>
    </table>
  </div><!-- /example -->
  
  </body>
</html>